import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenHeaderInterceptor extends Interceptor{
  final storageSecure = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{

    var token = await storageSecure.read(key: "token");

    options.headers.putIfAbsent("Authorization", () => "Bearer $token");
    super.onRequest(options, handler);
  }
}