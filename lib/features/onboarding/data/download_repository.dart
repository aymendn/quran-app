import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/enums/riwaya_enum.dart';
import 'package:quran_app/features/onboarding/data/download_remote_data_source.dart';
import 'package:quran_app/utils/api.dart';
import 'package:quran_app/utils/io.dart';

final downloadRepositoryProvider = Provider<DownloadRepository>((ref) {
  return DownloadRepository(ref.watch(downloadRemoteDataSourceProvider));
});

class DownloadRepository {
  const DownloadRepository(this.remoteDataSource);
  final DownloadRemoteDataSource remoteDataSource;

  // Download a list of images, each image is downloaded separately
  Future<void> downloadQuranPages({
    required String folderName,
    required void Function(int number) onProgress,
  }) async {
    // activate "keep the screen on"
    await KeepScreenOn.turnOn();

    // Get save folder
    final appSupportDir = await getApplicationSupportDirectory();
    final saveFolder = join(appSupportDir.path, folderName);

    // Create save folder if not exist
    final saveFolderDir = Directory(saveFolder);
    if (!await saveFolderDir.exists()) {
      await saveFolderDir.create();
    }

    logger.fine('Save folder: $saveFolder');

    // Download each image
    for (var i = 1; i <= 604; i++) {
      logger.fine('Downloading: $i');
      
      final savePath = join(saveFolder, IO.getPageName(i));

      // if the file already exists, skip it
      if (await File(savePath).exists()) {
        logger.fine('Skipped: $i');
      } else {
        final url = Api.getQuranPageImageUrl(RiwayaEnum.warsh, i);
        await remoteDataSource.downloadFile(url, savePath);
        logger.fine('Downloaded: $url');
      }

      // Report progress
      onProgress(i);
    }

    // reset "keep the screen on"
    await KeepScreenOn.turnOff();
  }
}
