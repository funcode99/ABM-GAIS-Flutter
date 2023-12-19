/// success : true
/// message : "Success Get Data"
/// data : [{"code":0,"status":"Draft"},{"code":1,"status":"Submit"},{"code":2,"status":"Approve Lv.1"},{"code":3,"status":"Approve Lv.2"},{"code":4,"status":"Approve Lv.3"},{"code":5,"status":"Approve Lv.4"},{"code":9,"status":"Reject"}]

class StatusDocumentModel {
  StatusDocumentModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  StatusDocumentModel.fromJson(dynamic json) {
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
StatusDocumentModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => StatusDocumentModel(  success: success ?? _success,
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

/// code : 0
/// status : "Draft"

class Data {
  Data({
      num? code, 
      String? status,}){
    _code = code;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
  }
  num? _code;
  String? _status;
Data copyWith({  num? code,
  String? status,
}) => Data(  code: code ?? _code,
  status: status ?? _status,
);
  num? get code => _code;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}