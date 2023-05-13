import 'package:dio/dio.dart';
import 'package:sicpa_news/core/network/api_provider.dart';

abstract class MostPopularRemoteDataSource {
  Future<Response> mostViewed(int period);
  Future<Response> mostShared(int period);
  Future<Response> mostEmailed(int period);
  Future<Response> articleSearch(
      String beginDate,
      String endDate,
      String facet,
      String facetFields,
      String facetFilter,
      String f1,
      String fq,
      int page,
      String query,
      String sort);
}

class MostPopularRemoteDataSourceImpl implements MostPopularRemoteDataSource {
  final ApiProvider apiProvider;

  MostPopularRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<Response> mostViewed(int period) {
    return apiProvider.mostViewed(period);
  }

  @override
  Future<Response> mostShared(int period) {
    return apiProvider.mostShared(period);
  }

  @override
  Future<Response> mostEmailed(int period) {
    return apiProvider.mostEmailed(period);
  }

  @override
  Future<Response> articleSearch(
      String beginDate,
      String endDate,
      String facet,
      String facetFields,
      String facetFilter,
      String f1,
      String fq,
      int page,
      String query,
      String sort) {
    return apiProvider.articleSearch(beginDate, endDate, facet, facetFields,
        facetFilter, f1, fq, page, query, sort);
  }
}
