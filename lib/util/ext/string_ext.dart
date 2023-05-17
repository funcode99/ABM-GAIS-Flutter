import 'package:intl/intl.dart';

extension StringExt on String{
  int toInt(){
    return int.parse(replaceAll(RegExp(r"\D"), ""));
  }

  String toDateFormat({String format = "dd-MM-yyyy"}){
    try{
      DateTime dateTime = DateTime.parse(this);
      DateFormat dateFormat = DateFormat(format);
      return dateFormat.format(dateTime);
    }catch(e){
      return "-";
    }
  }
}