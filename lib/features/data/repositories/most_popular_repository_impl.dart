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
}
