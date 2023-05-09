import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sicpa_news/core/local/shared_pref.dart';

class ApiInterceptor extends Interceptor {
  late SharedPreferencesManager sharedPreferencesManager;

  ApiInterceptor({
    required this.sharedPreferencesManager,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data != null && options.data is! FormData) {
      debugPrint("Body: ${jsonEncode(options.data)}, path: ${options.path}");
    }
    final accessToken = sharedPreferencesManager
        .getString(SharedPreferencesManager.keyAccessToken);
    if (accessToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer $accessToken",
        "Accept": "application/json"
      });
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.data = jsonDecode(response.data);
    debugPrint(
        "Response: ${response.statusCode} ${response.realUri} ${response.data}");
    debugPrint("<-- END HTTP RESPONSE -->");
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // err.response?.data = jsonDecode(err.response?.data);

    debugPrint(
        "<-- ${err.message} ${(err.response != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    debugPrint(
        "${err.response != null ? err.response!.data : 'Unknown Error'}");
    debugPrint("<-- End error");
    if (err.response?.statusCode == 403) {
      // Refresh token function here
      return handler.next(err);
    } else {
      return handler.next(err);
    }
  }
}
