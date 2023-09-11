import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';

class BaseClient {
  static const _apiHostReal = 'https://staging.hoan-dragon.com/main-service';

  static BaseClient? _instance;
  Dio? _dio;

  BaseClient();

  static get instance {
    _instance ??= BaseClient._internal();
    return _instance;
  }

  get apiHostReal => _apiHostReal;

  get dio => _dio;

  BaseClient._internal() {
    _dio = Dio();
    _dio!.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = AppPrefs.accessToken;
      if (kDebugMode) {
        log('API URL: ${options.method} ${options.path} ${options.data}');
      }
      options.headers['content-type'] = 'application/json';
      options.headers['accept'] = 'application/json';
      if (token != '') {
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
