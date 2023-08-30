import 'package:gais/data/model/booking_meeting_room/recurrence_day.dart';

class RecurrenceModel{
  final String? value;
  final String? text;
  final String? date;
  final List<RecurrenceDay>? recurrenceDays;

  RecurrenceModel({this.value, this.text, this.date, this.recurrenceDays});
}