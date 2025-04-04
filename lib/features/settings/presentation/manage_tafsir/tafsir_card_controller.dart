import 'package:background_downloader/background_downloader.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/exceptions/app_exception.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/features/settings/presentation/manage_tafsir/manage_tafsir_controller.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';
import 'package:quran_app/utils/io.dart';

final tafsirCardControllerProvider = StateNotifierProvider.autoDispose
    .family<TafsirCardController, TafsirCardState, TafsirModel>(
  (ref, tafsir) => TafsirCardController(ref, tafsir),
);

class TafsirCardController extends StateNotifier<TafsirCardState> {
  final Ref ref;
  final TafsirModel tafsir;
  TafsirCardController(this.ref, this.tafsir) : super(const TafsirCardState());

  ManageTafsirController get manageTafsirController =>
      ref.read(manageTafsirControllerProvider.notifier);

  Future<void> startDownloading() async {
    try {
      // initialize the download task
      final task = DownloadTask(
        taskId: tafsir.fileName,
        url: tafsir.url,
        filename: tafsir.fileNameZip,
        directory: 'tafsir',
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
        await IO.unzipTafsir(tafsir.fileName);

        // Set the tafsir in shared preferences
        SharedPreferencesService.addTafsir(tafsir);

        // Download completed successfully
        state = state.setDownloadStatusData();

        // Update the selected tafsir in the manage tafsir controller
        manageTafsirController.addTafsir(tafsir.fileName);
      } else {
        // Download failed
        throw Exception('Download failed');
      }

      // // Mock the function:
      // state = state.setDownloadStatusLoading();
      // await Future.delayed(const Duration(seconds: 2));
      // state = state.setDownloadProgress(0.2);
      // await Future.delayed(const Duration(seconds: 2));
      // state = state.setDownloadProgress(0.5);
      // await Future.delayed(const Duration(seconds: 2));
      // state = state.setDownloadProgress(0.8);
      // await Future.delayed(const Duration(seconds: 2));
      // state = state.setDownloadProgress(1.0);
      // await Future.delayed(const Duration(seconds: 2));
      // state = state.setDownloadStatusData();
      // manageTafsirController.addTafsir(tafsir.fileName);
    } catch (e, st) {
      // Handle any errors that occur during the download
      state = state.setDownloadStatusError(e, st);
    }
  }

  Future<void> deleteTafsir() async {
    try {
      // First, remove the file from storage
      await IO.removeTafsir(tafsir.fileName);

      // Delete the tafsir from manageTafsirController's state
      manageTafsirController.removeTafsir(tafsir.fileName);

      // Remove the tafsir from shared preferences
      SharedPreferencesService.removeTafsir(tafsir.fileName);
    } catch (e, st) {
      // TODO: handle error
      logger.error(e, stackTrace: st);
    }
  }
}

class TafsirCardState extends Equatable {
  final AsyncValue downloadStatus;
  final double downloadProgress;

  const TafsirCardState({
    this.downloadStatus = const AsyncData(null),
    this.downloadProgress = 0.0,
  });

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

  TafsirCardState copyWith({
    AsyncValue? downloadStatus,
    double? downloadProgress,
  }) {
    return TafsirCardState(
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadProgress: downloadProgress ?? this.downloadProgress,
    );
  }

  TafsirCardState setDownloadStatusLoading() {
    return copyWith(downloadStatus: const AsyncLoading());
  }

  TafsirCardState setDownloadStatusError(Object e, StackTrace st) {
    return copyWith(downloadStatus: AppException.asAsyncError(e, st));
  }

  TafsirCardState setDownloadStatusData() {
    return copyWith(downloadStatus: const AsyncData(null));
  }

  TafsirCardState setDownloadProgress(double progress) {
    return copyWith(downloadProgress: progress);
  }

  @override
  List<Object?> get props => [downloadStatus, downloadProgress];
}
