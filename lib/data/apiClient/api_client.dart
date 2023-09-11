import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_flutter/constants/utils/app_util.dart';
import 'package:food_flutter/data/apiClient/base_client.dart';

class ApiClient {
  static const apiHostReal = 'https://staging.hoan-dragon.com/main-service';
  final client = BaseClient.instance.dio;

  Future<Response> login(Map<String, dynamic> data) async {
    return client.post('$apiHostReal/auth/login',
        data: AppUtil.filterRequestData(data));
  }

  Future<Response> verifyOtpLogin(Map<String, dynamic> data) async {
    return client.post('$apiHostReal/auth/verify-login',
        data: AppUtil.filterRequestData(data));
  }

  Future<Response> verifyOtp(Map<String, dynamic> data) async {
    return client.post('$apiHostReal/auth/verify-otp',
        data: AppUtil.filterRequestData(data));
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return client.post('$apiHostReal/auth/confirm-register',
        data: AppUtil.filterRequestData(data));
  }

  Future<Response> sendOtp(Map<String, dynamic> data) async {
    return client.post('$apiHostReal/auth/pre-register',
        data: AppUtil.filterRequestData(data));
  }
}
