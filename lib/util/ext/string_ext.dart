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

  DateTime? toDate({String originFormat = "dd/MM/yyyy"}){
    try{
      DateTime dateTime = DateFormat(originFormat).parse(this);

      return dateTime;
    }on FormatException catch(e){
      print("ERROR toDateFormat $e");
      rethrow;
    }catch(e){
      print("ERROR toDateFormat $e");
      return null;
    }
  }

  bool isNumeric() {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(this);
  }

  bool isImage(){
    String text = toLowerCase();
    return text.contains(".png") || text.contains(".jpg") || text.contains("jpeg");
  }

  String getInitials() => isNotEmpty
      ? replaceAll(RegExp(r"[^\s\w]"), "").trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
}