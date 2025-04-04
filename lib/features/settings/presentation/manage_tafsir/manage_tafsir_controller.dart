import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/exceptions/app_exception.dart';
import 'package:quran_app/features/onboarding/data/metadata_repository.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_section.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';

final manageTafsirControllerProvider =
    StateNotifierProvider<ManageTafsirController, ManageTafsirState>(
  (ref) => ManageTafsirController(ref),
);

class ManageTafsirController extends StateNotifier<ManageTafsirState> {
  final Ref ref;
  ManageTafsirController(this.ref) : super(const ManageTafsirState()) {
    initializeSelectedTafsir();
    fetchTafsirList();
  }

  MetadataRepository get tafsirRepository =>
      ref.read(metadataRepositoryProvider);

  void initializeSelectedTafsir() {
    final selectedTafsirList = SharedPreferencesService.getTafsirList();
    state = state
        .setSelectedTafsir(selectedTafsirList.map((e) => e.fileName).toList());
  }

  Future<void> fetchTafsirList() async {
    try {
      // Set the initial state to loading
      state = state.setTafsirListLoading();

      // Fetch the tafsir list from the repository
      final tafsirList = await tafsirRepository.getTafsirList();
      state = state.setTafsirListData(tafsirList);
    } catch (e, st) {
      // Handle any errors that occur during the fetch
      state = state.setTafsirListError(e, st);
    }
  }

  void addTafsir(String tafsirName) {
    state = state.addSelectedTafsir(tafsirName);
  }

  void removeTafsir(String tafsirName) {
    state = state.removeSelectedTafsir(tafsirName);
  }
}

class ManageTafsirState extends Equatable {
  final AsyncValue<List<TafsirModel>> tafsirListAsync;
  final List<String> selectedTafsirList;

  const ManageTafsirState({
    this.tafsirListAsync = const AsyncLoading(),
    this.selectedTafsirList = const [],
  });

  List<TafsirModel> get selectedTafsirListModel {
    if (tafsirListAsync.hasError) return [];
    final tafsirList = tafsirListAsync.valueOrNull ?? [];
    return tafsirList
        .where((tafsir) => selectedTafsirList.contains(tafsir.fileName))
        .toList();
  }

  List<TafsirModel> get tafsirListOrdered {
    if (tafsirListAsync.hasError) return [];
    final tafsirList = tafsirListAsync.valueOrNull ?? [];
    return tafsirList
        .where((tafsir) => selectedTafsirList.contains(tafsir.fileName))
        .followedBy(
          tafsirList
              .where((tafsir) => !selectedTafsirList.contains(tafsir.fileName)),
        )
        .toList();
  }

  ManageTafsirState copyWith({
    AsyncValue<List<TafsirModel>>? tafsirListAsync,
    List<String>? selectedTafsirList,
  }) {
    return ManageTafsirState(
      tafsirListAsync: tafsirListAsync ?? this.tafsirListAsync,
      selectedTafsirList: selectedTafsirList ?? this.selectedTafsirList,
    );
  }

  ManageTafsirState setTafsirListLoading() {
    return copyWith(tafsirListAsync: const AsyncLoading());
  }

  ManageTafsirState setTafsirListError(Object e, StackTrace st) {
    return copyWith(tafsirListAsync: AppException.asAsyncError(e, st));
  }

  ManageTafsirState setTafsirListData(List<TafsirModel> data) {
    return copyWith(tafsirListAsync: AsyncData(data));
  }

  ManageTafsirState setSelectedTafsir(List<String> selectedTafsirName) {
    return copyWith(selectedTafsirList: selectedTafsirName);
  }

  ManageTafsirState addSelectedTafsir(String selectedTafsirName) {
    return copyWith(
      selectedTafsirList: [...selectedTafsirList, selectedTafsirName],
    );
  }

  ManageTafsirState removeSelectedTafsir(String selectedTafsirName) {
    return copyWith(
      selectedTafsirList: selectedTafsirList
          .where((tafsir) => tafsir != selectedTafsirName)
          .toList(),
    );
  }

  @override
  List<Object?> get props => [tafsirListAsync, selectedTafsirList];
}
