import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/providers/dio_provider.dart';

final downloadRemoteDataSourceProvider =
    Provider<DownloadRemoteDataSource>((ref) {
  return DownloadRemoteDataSource(ref.watch(dioProvider));
});

class DownloadRemoteDataSource {
  final Dio dio;
  const DownloadRemoteDataSource(this.dio);

  Future<void> downloadFile(
    String url,
    String savePath,
  ) async {
    await dio.download(
      url,
      savePath,
      
    );
  }
}
