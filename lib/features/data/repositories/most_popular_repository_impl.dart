import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
    debugPrint('get mostViewed');
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

  @override
  Future mostShared(int period) async {
    debugPrint('get mostShared');
    try {
      final response = await remoteDataSource.mostShared(period);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future mostEmailed(int period) async {
    debugPrint('get mostEmailed');
    try {
      final response = await remoteDataSource.mostEmailed(period);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future articleSearch(
      String beginDate,
      String endDate,
      String facet,
      String facetFields,
      String facetFilter,
      String f1,
      String fq,
      int page,
      String query,
      String sort) async {
    debugPrint('get articleSearch');
    try {
      final response = await remoteDataSource.articleSearch(beginDate, endDate,
          facet, facetFields, facetFilter, f1, fq, page, query, sort);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }
}
