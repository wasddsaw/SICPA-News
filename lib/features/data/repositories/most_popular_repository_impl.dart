import 'package:dio/dio.dart';
import 'package:sicpa_news/core/network/api_provider.dart';
import 'package:sicpa_news/features/data/datasources/most_popular/most_popular_remote_data_source.dart';
import 'package:sicpa_news/features/domain/repositories/most_popular_repository.dart';

class MostPopularRepositoryImpl implements MostPopularRepository {
  final MostPopularRemoteDataSource remoteDataSource;
  final ApiProvider apiProvider;

  MostPopularRepositoryImpl({
    required this.remoteDataSource,
    required this.apiProvider,
  });

  @override
  Future mostViewed(int period) async {
    try {
      final response = await remoteDataSource.mostViewed(period);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }
}
