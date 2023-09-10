import 'dart:developer';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BaseClient {
  static BaseClient? _instance;
  Dio? _dio;

  factory BaseClient({bool needToken = true}) {
    _instance = BaseClient._(needToken: needToken);
    return _instance!;
  }

  get dio => _dio;

  BaseClient._({required bool needToken}) {
    _dio = Dio();
    _dio!.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = AppPrefs.accessToken;
      print("TOKENNNNN $token");
      if (kDebugMode) {
        log('API URL: ${options.method} ${options.path} ${options.data}');
      }
      options.headers['content-type'] = 'application/json';
      options.headers['accept'] = 'application/json';
      if (token != '' && needToken == true) {
        if (kDebugMode) {
          print('Request token: ${token.toString()}');
        }
        options.headers["Authorization"] = 'Bearer $token';
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      log('RESPONSE DATA : ${response.data}');
      return handler.next(response);
    }, onError: (DioException e, handler) {
      log('ERROR : ${e.message}}');
      return handler.next(e);
    }));
  }
}
