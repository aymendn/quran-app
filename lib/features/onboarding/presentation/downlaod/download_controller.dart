import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/features/onboarding/data/download_repository.dart';
import 'package:quran_app/router/app_router.dart';
import 'package:quran_app/router/routes.dart';

final downloadControllerProvider =
    StateNotifierProvider<DownloadController, DownloadState>((ref) {
  return DownloadController(ref);
});

class DownloadController extends StateNotifier<DownloadState> {
  final Ref ref;
  DownloadController(this.ref) : super(const DownloadState()) {
    download();
  }

  DownloadRepository get repository => ref.read(downloadRepositoryProvider);
  GoRouter get router => ref.read(goRouterProvider);

  Future<void> download() async {
    try {
      await repository.downloadQuranPages(
        folderName: 'warsh-tajweed',
        onProgress: (int number) {
          state = state.setDownloadedImages(number);
        },
      );

      router.goNamed(Routes.home.name);
    } catch (e, st) {
      logger.error('Download error: $e', stackTrace: st);
      state = state.setStatus(AsyncError(e, st));
    }
  }
}

class DownloadState extends Equatable {
  final int downloadedImages;
  final AsyncValue status;

  const DownloadState({
    this.downloadedImages = 0,
    this.status = const AsyncData(null),
  });

  DownloadState copyWith({
    int? downloadedImages,
    AsyncValue? status,
  }) {
    return DownloadState(
      downloadedImages: downloadedImages ?? this.downloadedImages,
      status: status ?? this.status,
    );
  }

  DownloadState setDownloadedImages(int downloadedImages) {
    return copyWith(downloadedImages: downloadedImages);
  }

  DownloadState setStatus(AsyncValue status) {
    return copyWith(status: status);
  }

  double get progress => downloadedImages / 604;

  int? get progressInt {
    if (downloadedImages == 0) return null;
    return (progress * 100).toInt();
  }

  String get progressString {
    if (downloadedImages == 0) return '';
    return '$progressInt%';
  }

  String get progressRatio {
    return '$downloadedImages/604';
  }

  @override
  List<Object> get props => [downloadedImages, status];
}
