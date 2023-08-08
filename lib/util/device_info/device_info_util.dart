import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoUtil{

  static Future<String?> getDeviceID()async{
    String? deviceID;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if(kIsWeb){
      WebBrowserInfo info = await deviceInfoPlugin.webBrowserInfo;
      deviceID = info.userAgent;
    }

    if(Platform.isAndroid){
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      deviceID = info.id;
      print("androidId $info");
      print("deviceID $deviceID");
    }else if(Platform.isIOS){
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
      deviceID = info.model;
    }
    return Future.value(deviceID);
  }

  static Future<int?> androidOS()async{
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    int? os = info.version.sdkInt;
    return os;
  }

  static Future<String> getAndroidID()async{
    String? result = "";
    if(kIsWeb){
      throw "Not available for web";
    }

    if(Platform.isAndroid){
      const _androidIdPlugin = AndroidId();

      final String? androidId = await _androidIdPlugin.getId();
      // sementara
      result = androidId;
      // result = "6285694039223";
      // result = "9236f21fe924a342";
    }else if(Platform.isIOS){
      result = "7e4cca4408128958";
      // result = "7e4cca4408128958212";
    }

    return Future.value(result);

  }

}
