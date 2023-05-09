import 'package:intl/intl.dart';

extension IntExt on int{
  String toCurrency(){
    var formatter = NumberFormat('#,##0', 'ID');
    return formatter.format(this);
  }
}