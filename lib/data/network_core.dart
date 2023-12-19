import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/const/app_const.dart';
import 'package:gais/data/interceptor/response_error_interceptor.dart';
import 'package:gais/data/interceptor/token_header_interceptor.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: AppConst.baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        sendTimeout: 20000,
        headers: {
          'accept' : 'application/json',
        }
    );

    String env = FlavorConfig.instance.name ?? "PROD";
    if (env != "PROD") {
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    dio.interceptors.add(TokenHeaderInterceptor());
    dio.interceptors.add(ResponseErrorInterceptor());
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        final isValidHost = ["38.47.76.138"].contains(host);
        return isValidHost;
      });
  }
}