import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/providers/dio_provider.dart';
import 'package:quran_app/utils/constants.dart';

final metadataRemoteDataSourceProvider =
    Provider<MetadataRemoteDataSource>((ref) {
  return MetadataRemoteDataSource(ref.watch(dioProvider));
});

class MetadataRemoteDataSource {
  final Dio dio;
  const MetadataRemoteDataSource(this.dio);

  Future<Response> getRiwayahList() async {
    return await dio.get(
      Constants.riwayahUrl,
      options: Options(
        responseType: ResponseType.json,
        followRedirects: true,
      ),
    );
  }

  Future<Response> getTafsirList() async {
    return await dio.get(
      Constants.tafsirUrl,
      options: Options(
        responseType: ResponseType.json,
        followRedirects: true,
      ),
    );
  }
}
