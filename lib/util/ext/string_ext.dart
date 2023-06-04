import 'package:intl/intl.dart';

extension StringExt on String{
  String digitOnly(){
    return replaceAll(RegExp(r"\D"), "");
  }

  int toInt(){
    return int.parse(replaceAll(RegExp(r"\D"), ""));
  }

  String toDateFormat({String targetFormat = "dd-MM-yyyy", String originFormat = "dd/MM/yyyy"}){
    try{
      DateTime dateTimeOrigin = DateFormat(originFormat).parse(this);
      DateFormat dateFormat = DateFormat(targetFormat);
      return dateFormat.format(dateTimeOrigin);
    }catch(e){
      print("ERROR toDateFormat $e");
      return "-";
    }
  }
}