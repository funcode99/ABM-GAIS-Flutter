/// success : true
/// message : "Success Update Data"
/// data : {"STATUS":"updated"}

class SubmitDocumentDeliveryModel {
  SubmitDocumentDeliveryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SubmitDocumentDeliveryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SubmitDocumentDeliveryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SubmitDocumentDeliveryModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// STATUS : "updated"

class Data {
  Data({
      String? status,}){
    _status = status;
}

  Data.fromJson(dynamic json) {
    _status = json['STATUS'];
  }
  String? _status;
Data copyWith({  String? status,
}) => Data(  status: status ?? _status,
);
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['STATUS'] = _status;
    return map;
  }

}