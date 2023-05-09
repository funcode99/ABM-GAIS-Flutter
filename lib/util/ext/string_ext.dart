extension StringExt on String{
  int toInt(){
    return int.parse(replaceAll(RegExp(r"\D"), ""));
  }
}