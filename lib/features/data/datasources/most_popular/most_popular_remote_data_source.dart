import 'package:dio/dio.dart';
import 'package:sicpa_news/core/network/api_provider.dart';

abstract class MostPopularRemoteDataSource {
  Future<Response> mostViewed(int period);
}

class MostPopularRemoteDataSourceImpl implements MostPopularRemoteDataSource {
  final ApiProvider apiProvider;

  MostPopularRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<Response> mostViewed(int period) {
    return apiProvider.mostViewed(period);
  }
}
