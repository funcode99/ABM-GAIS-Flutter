import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';

class GetTrainSeatsModel {
  GetTrainSeatsModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetTrainSeatsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  List<Data>? _data;

  GetTrainSeatsModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetTrainSeatsModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get success => _success;

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    int? num,
    String? code,
    String? coachName,
    List<List<SeatRows>>? seatRows,
  }) {
    _num = num;
    _code = code;
    _coachName = coachName;
    _seatRows = seatRows;
  }

  Data.fromJson(dynamic json) {
    _num = json['Num'];
    _code = json['Code'];
    _coachName = json['CoachName'];
    if (json['SeatRows'] != null) {
      _seatRows = [];
      List<dynamic> dynamicList = json['SeatRows']; // Your dynamic list
      for (int index = 0; index < dynamicList.length; index++) {
        List item = dynamicList[index];
        List<SeatRows> seatRowsList = [];
        item.forEach((e) {
          Map<String, dynamic> jsonData = e;
          seatRowsList.add(SeatRows.fromJson(jsonData));
        });
        _seatRows?.add(seatRowsList);
      }
    }
  }

  int? _num;
  String? _code;
  String? _coachName;
  List<List<SeatRows>>? _seatRows;

  Data copyWith({
    int? num,
    String? code,
    String? coachName,
    List<List<SeatRows>>? seatRows,
  }) =>
      Data(
        num: num ?? _num,
        code: code ?? _code,
        coachName: coachName ?? _coachName,
        seatRows: seatRows ?? _seatRows,
      );

  int? get num => _num;

  String? get code => _code;

  String? get coachName => _coachName;

  List<List<SeatRows>>? get seatRows => _seatRows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Num'] = _num;
    map['Code'] = _code;
    map['CoachName'] = _coachName;
    if (_seatRows != null) {
      map['SeatRows'] = _seatRows?.map((v) => v.map((e) => e.toJson()).toList()).toList();
    }
    return map;
  }
}

class SeatRows {
  SeatRows({
    String? seatNumber,
    int? seatStatus,
    int? x,
    int? y,
    String? seatId,
  }) {
    _seatNumber = seatNumber;
    _seatStatus = seatStatus;
    _x = x;
    _y = y;
    _seatId = seatId;
  }

  SeatRows.fromJson(dynamic json) {
    _seatNumber = json['SeatNumber'];
    _seatStatus = json['SeatStatus'];
    _x = json['X'];
    _y = json['Y'];
    _seatId = json['SeatId'];
  }

  String? _seatNumber;
  int? _seatStatus;
  int? _x;
  int? _y;
  String? _seatId;

  SeatRows copyWith({
    String? seatNumber,
    int? seatStatus,
    int? x,
    int? y,
    String? seatId,
  }) =>
      SeatRows(
        seatNumber: seatNumber ?? _seatNumber,
        seatStatus: seatStatus ?? _seatStatus,
        x: x ?? _x,
        y: y ?? _y,
        seatId: seatId ?? _seatId,
      );

  String? get seatNumber => _seatNumber;

  int? get seatStatus => _seatStatus;

  int? get x => _x;

  int? get y => _y;

  String? get seatId => _seatId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SeatNumber'] = _seatNumber;
    map['SeatStatus'] = _seatStatus;
    map['X'] = _x;
    map['Y'] = _y;
    map['SeatId'] = _seatId;
    return map;
  }
}
