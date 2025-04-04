import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/features/onboarding/data/metadata_remote_data_source.dart';
import 'package:quran_app/features/onboarding/domain/riwayah_model.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';

final metadataRepositoryProvider = Provider<MetadataRepository>((ref) {
  return MetadataRepository(ref.watch(metadataRemoteDataSourceProvider));
});

class MetadataRepository {
  const MetadataRepository(this.remoteDataSource);
  final MetadataRemoteDataSource remoteDataSource;

  Future<List<RiwayahModel>> getRiwayahList() async {
    try {
      final response = await remoteDataSource.getRiwayahList();
      final List<RiwayahModel> riwayahList = (response.data as List)
          .map((riwayah) => RiwayahModel.fromJson(riwayah))
          .toList();
      return riwayahList;
    } catch (e, st) {
      logger.error('Error fetching Riwayah list: $st');
      rethrow;
    }
  }

  Future<List<TafsirModel>> getTafsirList() async {
    try {
      final response = await remoteDataSource.getTafsirList();
      final List<TafsirModel> tafsirList = (response.data as List)
          .map((tafsir) => TafsirModel.fromJson(tafsir))
          .toList();
      return tafsirList;
    } catch (e, st) {
      logger.error('Error fetching Tafsir list: $st');
      rethrow;
    }
  }
}
