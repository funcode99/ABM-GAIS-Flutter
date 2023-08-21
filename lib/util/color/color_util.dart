
import 'dart:ui';

import 'package:gais/const/color.dart';
class ColorUtil{

  static Color getStatusColorByText(String text){
    Color result;
    switch (text.toLowerCase()){
      case "waiting approval":
      case "booked":
        result = blueColor;
        break;
      case "ready":
      case "approve":
      case "confirmed":
      case "need to settlement":
        result = orangeColor;
        break;
      case "draft":
      case "driver check":
        result = greyColor;
        break;
      case "cancelled":
      case "rejected":
      case "revision":
      case "expired":
        result = redColor;
        break;
      case "done":
      case "completed":
      default:
        result = greenColor;
        break;
    }


    return result;
  }
}