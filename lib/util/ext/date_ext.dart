import 'package:flutter/material.dart';
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

  bool isTimeAfter(DateTime other, {bool isInclusive = true}) {
    int thisTotalSecond = (hour * 60 * 60) + (minute * 60) + second;
    int otherTotalSecond = (other.hour * 60 * 60) + (other.minute * 60) + other.second;

    if(isInclusive){
      return thisTotalSecond >= otherTotalSecond;
    }
    return thisTotalSecond > otherTotalSecond;
  }

  bool isTimeBefore(DateTime other, {bool isInclusive = true}) {
    int thisTotalSecond = (hour * 60 * 60) + (minute * 60) + second;
    int otherTotalSecond = (other.hour * 60 * 60) + (other.minute * 60) + other.second;

    if(isInclusive){
      return thisTotalSecond <= otherTotalSecond;
    }
    return thisTotalSecond < otherTotalSecond;
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

  String getDifferencesString({required DateTime otherDate}) {
    late DateTime firstDate;
    late DateTime secondDate;
    if(isBefore(otherDate)){
      firstDate = otherDate;
      secondDate = this;
    }else{
      firstDate = this;
      secondDate = otherDate;
    }

    int diffInSeconds = firstDate.difference(secondDate).inSeconds;
    print("FIRSTDATE $firstDate");
    print("SEECONDDATE $secondDate");
    print("SECONDS $diffInSeconds");

    int days = (diffInSeconds / (60*60*24)).floor();
    int hours = ((diffInSeconds - days * 60*60*24) / (60*60)).floor();
    int minutes = ((diffInSeconds - days * 60*60*24 - hours * 60*60)/ 60).floor();
    int seconds = ((diffInSeconds - days * 60*60*24 - hours * 60*60 - minutes * 60)).floor();


    print("days $days hours $hours minutes $minutes seconds $seconds");
    String result = "";
    if(days > 0){
      result += "$days d";
    }

    if(hours > 0){
      result += " $hours h";
    }

    if(minutes > 0){
      result += " $minutes m";
    }

    if(seconds > 0){
      result += " $seconds s";
    }

    return result;
  }

  List<DateTime> getDaysInBetween(DateTime otherDate) {
    DateTime startDate = this;
    DateTime endDate = otherDate;
    if(isAfter(otherDate)){
      startDate = otherDate;
      endDate = this;
    }

    startDate = DateUtils.dateOnly(startDate);
    endDate = DateUtils.dateOnly(endDate);

    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

}