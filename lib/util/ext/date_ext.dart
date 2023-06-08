import 'package:intl/intl.dart';

extension DateExt on DateTime {
  DateTime copyDateWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  bool isTimeAfter(DateTime other) {
    int thisTotalSecond = (hour * 60 * 60) + (minute * 60) + second;
    int otherTotalSecond = (other.hour * 60 * 60) + (other.minute * 60) + other.second;

    return thisTotalSecond >= otherTotalSecond;
  }

  bool isTimeBefore(DateTime other) {
    int thisTotalSecond = (hour * 60 * 60) + (minute * 60) + second;
    int otherTotalSecond = (other.hour * 60 * 60) + (other.minute * 60) + other.second;

    return thisTotalSecond <= otherTotalSecond;
  }

  bool isSameTime(DateTime other) {
    int thisTotalSecond = (hour * 60 * 60) + (minute * 60) + second;
    int otherTotalSecond = (other.hour * 60 * 60) + (other.minute * 60) + other.second;

    return thisTotalSecond == otherTotalSecond;
  }

  String toStringWithFormat({String format = "HH:mm"}){
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }



}