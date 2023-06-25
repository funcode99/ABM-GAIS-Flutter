/// success : true
/// message : "Success Get Data"
/// data : [{"text":"GA ( Accounting ) was rejected your document","date":"2023-06-12 13:46:05","level":4,"code_status":2,"notes":"tes"}]

class ApprovalInfoModel {
  ApprovalInfoModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ApprovalInfoModel.fromJson(dynamic json) {
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
ApprovalInfoModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ApprovalInfoModel(  success: success ?? _success,
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

/// text : "GA ( Accounting ) was rejected your document"
/// date : "2023-06-12 13:46:05"
/// level : 4
/// code_status : 2
/// notes : "tes"

class Data {
  Data({
      String? text, 
      String? date, 
      num? level, 
      num? codeStatus, 
      String? notes,}){
    _text = text;
    _date = date;
    _level = level;
    _codeStatus = codeStatus;
    _notes = notes;
}

  Data.fromJson(dynamic json) {
    _text = json['text'];
    _date = json['date'];
    _level = json['level'];
    _codeStatus = json['code_status'];
    _notes = json['notes'];
  }
  String? _text;
  String? _date;
  num? _level;
  num? _codeStatus;
  String? _notes;
Data copyWith({  String? text,
  String? date,
  num? level,
  num? codeStatus,
  String? notes,
}) => Data(  text: text ?? _text,
  date: date ?? _date,
  level: level ?? _level,
  codeStatus: codeStatus ?? _codeStatus,
  notes: notes ?? _notes,
);
  String? get text => _text;
  String? get date => _date;
  num? get level => _level;
  num? get codeStatus => _codeStatus;
  String? get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['date'] = _date;
    map['level'] = _level;
    map['code_status'] = _codeStatus;
    map['notes'] = _notes;
    return map;
  }

}