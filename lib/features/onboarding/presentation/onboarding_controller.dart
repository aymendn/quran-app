import 'package:background_downloader/background_downloader.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/exceptions/app_exception.dart';
import 'package:quran_app/features/onboarding/data/download_repository.dart';
import 'package:quran_app/features/onboarding/data/metadata_repository.dart';
import 'package:quran_app/features/onboarding/domain/riwayah_model.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';
import 'package:quran_app/router/app_router.dart';
import 'package:quran_app/router/routes.dart';
import 'package:quran_app/utils/io.dart';

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
  (ref) => OnboardingController(ref),
);

class OnboardingController extends StateNotifier<OnboardingState> {
  final Ref ref;
  OnboardingController(this.ref) : super(const OnboardingState()) {
    fetchRiwayahList();
  }

  MetadataRepository get riwayahRepository =>
      ref.read(metadataRepositoryProvider);
  DownloadRepository get downloadRepository =>
      ref.read(downloadRepositoryProvider);
  GoRouter get router => ref.read(goRouterProvider);

  Future<void> startDownloading() async {
    try {
      final riwayah = state.selectedRiwayah;
      if (riwayah == null) {
        throw Exception('Please choose riwayah first');
      }

      // if current route is not '/download', then go to it
      if (router.routeInformationProvider.value.uri.path != '/download') {
        router.goNamed(Routes.download.name);
      }

      // initialize the download task
      final task = DownloadTask(
        taskId: riwayah.fileName,
        url: riwayah.url,
        filename: riwayah.fileNameZip,
        directory: 'riwayah',
        baseDirectory: BaseDirectory.applicationSupport,
        updates: Updates.statusAndProgress,
        retries: 5,
        allowPause: true,
      );

      // Start downlaoding...
      final result = await FileDownloader().download(
        task,
        onProgress: (progress) {
          // Update the download progress
          state = state.setDownloadProgress(progress);
        },
        onStatus: (status) {
          // Update the download status
          if (status.isNotFinalState) {
            state = state.setDownloadStatusLoading();
          } else if (status == TaskStatus.complete) {
            state = state.setDownloadStatusData();
          } else {
            throw Exception('Download failed');
          }
        },
      );

      // Check the result of the download
      if (result.status == TaskStatus.complete) {
        // Unzip the downloaded file
        await IO.unzipRiwayah(riwayah.fileName);

        // Set the riwayah in shared preferences
        SharedPreferencesService.setRiwayah(riwayah.fileName);

        // Download completed successfully
        state = state.setDownloadStatusData();
        router.goNamed(Routes.home.name);
      } else {
        // Download failed
        throw Exception('Download failed');
      }
    } catch (e, st) {
      // Handle any errors that occur during the download
      state = state.setDownloadStatusError(e, st);
    }
  }

  void setSelectedRiwayah(String? selectedRiwayahName) {
    state = state.setSelectedRiwayah(selectedRiwayahName);
  }

  Future<void> fetchRiwayahList() async {
    try {
      // Set the initial state to loading
      state = state.setRiwayahListLoading();

      // Fetch the riwayah list from the repository
      final riwayahList = await riwayahRepository.getRiwayahList();
      state = state.setRiwayahListData(riwayahList);
    } catch (e, st) {
      // Handle any errors that occur during the fetch
      state = state.setRiwayahListError(e, st);
    }
  }
}

class OnboardingState extends Equatable {
  final String? selectedRiwayahName;
  final AsyncValue<List<RiwayahModel>> riwayahListAsync;
  final AsyncValue downloadStatus;
  final double downloadProgress;

  const OnboardingState({
    this.selectedRiwayahName,
    this.riwayahListAsync = const AsyncLoading(),
    this.downloadStatus = const AsyncLoading(),
    this.downloadProgress = 0.0,
  });

  RiwayahModel? get selectedRiwayah {
    if (selectedRiwayahName == null) return null;
    return riwayahList.firstWhereOrNull(
      (riwayah) => riwayah.fileName == selectedRiwayahName,
    );
  }

  List<RiwayahModel> get riwayahList {
    if (riwayahListAsync.hasError) return [];
    return riwayahListAsync.valueOrNull ?? [];
  }

  bool get isSelectedRiwayah {
    return selectedRiwayahName != null;
  }

  int get downloadProgressInt {
    return (downloadProgress * 100).toInt();
  }

  int? get downloadProgressIntOrNull {
    if (downloadProgress == 0) return null;
    return (downloadProgress * 100).toInt();
  }

  String get downlaodProgressPercentage {
    return '$downloadProgressInt%';
  }

  OnboardingState copyWith({
    String? selectedRiwayahName,
    AsyncValue<List<RiwayahModel>>? riwayahListAsync,
    AsyncValue? downloadStatus,
    double? downloadProgress,
  }) {
    return OnboardingState(
      selectedRiwayahName: selectedRiwayahName ?? this.selectedRiwayahName,
      riwayahListAsync: riwayahListAsync ?? this.riwayahListAsync,
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }

  OnboardingState setSelectedRiwayah(String? selectedRiwayahName) {
    return copyWith(selectedRiwayahName: selectedRiwayahName);
  }

  OnboardingState setRiwayahListLoading() {
    return copyWith(riwayahListAsync: const AsyncLoading());
  }

  OnboardingState setRiwayahListError(Object e, StackTrace st) {
    return copyWith(riwayahListAsync: AppException.asAsyncError(e, st));
  }

  OnboardingState setRiwayahListData(List<RiwayahModel> data) {
    return copyWith(riwayahListAsync: AsyncData(data));
  }

  OnboardingState setDownloadStatusLoading() {
    return copyWith(downloadStatus: const AsyncLoading());
  }

  OnboardingState setDownloadStatusError(Object e, StackTrace st) {
    return copyWith(downloadStatus: AppException.asAsyncError(e, st));
  }

  OnboardingState setDownloadStatusData() {
    return copyWith(downloadStatus: const AsyncData(null));
  }

  OnboardingState setDownloadProgress(double progress) {
    return copyWith(downloadProgress: progress);
  }

  @override
  List<Object?> get props => [
        selectedRiwayahName,
        riwayahListAsync,
        downloadStatus,
        downloadProgress,
      ];
}
