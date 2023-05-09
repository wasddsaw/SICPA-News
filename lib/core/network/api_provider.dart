import 'package:dio/dio.dart';
import 'package:sicpa_news/core/network/api_interceptor.dart';

abstract class ApiProvider {
  Future<Response> mostViewed(int period);
  Future<Response> mostEmailed(int period);
  Future<Response> mostShared(int period);
}

class Const {
  static const baseUrl = "https://api.nytimes.com";
}

class ApiProviderImpl implements ApiProvider {
  final Dio _dio = Dio(options);

  ApiProviderImpl(ApiInterceptor apiInterceptor) {
    _dio.interceptors.add(apiInterceptor);
  }

  static BaseOptions options = BaseOptions(
    baseUrl: "${Const.baseUrl}/svc",
    contentType: "application/json",
    followRedirects: false,
    responseType: ResponseType.plain,
    connectTimeout: 20000,
    receiveTimeout: 20000,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  @override
  Future<Response> mostViewed(int period) {
    return _dio.get(
      "/mostpopular/v2/viewed/$period.json?api-key=8HIf7k7xdIFZQU8w74jLqoXscCpKkAVZ",
    );
  }

  @override
  Future<Response> mostShared(int period) {
    return _dio.get(
      "/mostpopular/v2/shared/$period.json?api-key=8HIf7k7xdIFZQU8w74jLqoXscCpKkAVZ",
    );
  }

  @override
  Future<Response> mostEmailed(int period) {
    return _dio.get(
      "/mostpopular/v2/emailed/$period.json?api-key=8HIf7k7xdIFZQU8w74jLqoXscCpKkAVZ",
    );
  }
}
