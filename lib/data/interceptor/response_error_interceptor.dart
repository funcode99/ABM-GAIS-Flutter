import 'package:dio/dio.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:get/get.dart';

class ResponseErrorInterceptor extends Interceptor{

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    int statusCode = err.response?.statusCode ?? 0;
    if(statusCode == 401){
      //logout, because token is invalid
      StorageCore().deleteToken();
      Get.offAll(() => const LoginScreen());
    }
    super.onError(err, handler);
  }
}