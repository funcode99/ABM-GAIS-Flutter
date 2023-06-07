/// success : true
/// message : "Success Get Data"
/// data : [{"code":0,"status":"Draft","code_document":"SV"},{"code":1,"status":"Waiting Approval","code_document":"SV"},{"code":2,"status":"Revision","code_document":"SV"},{"code":3,"status":"Cancelled","code_document":"SV"},{"code":9,"status":"Rejected","code_document":"SV"},{"code":10,"status":"Completed","code_document":"SV"},{"code":0,"status":"Draft","code_document":"CB"},{"code":1,"status":"Waiting Approval","code_document":"CB"},{"code":2,"status":"Revision","code_document":"CB"},{"code":3,"status":"Cancelled","code_document":"CB"},{"code":9,"status":"Rejected","code_document":"CB"},{"code":10,"status":"Completed","code_document":"CB"},{"code":0,"status":"Draft","code_document":"FB"},{"code":1,"status":"Waiting Approval","code_document":"FB"},{"code":2,"status":"Revision","code_document":"FB"},{"code":3,"status":"Cancelled","code_document":"FB"},{"code":9,"status":"Rejected","code_document":"FB"},{"code":10,"status":"Completed","code_document":"FB"},{"code":0,"status":"Draft","code_document":"TV"},{"code":1,"status":"Waiting Approval","code_document":"TV"},{"code":2,"status":"Revision","code_document":"TV"},{"code":3,"status":"Cancelled","code_document":"TV"},{"code":9,"status":"Rejected","code_document":"TV"},{"code":10,"status":"Completed","code_document":"TV"},{"code":0,"status":"Draft","code_document":"STL"},{"code":1,"status":"Waiting Approval","code_document":"STL"},{"code":2,"status":"Revision","code_document":"STL"},{"code":3,"status":"Cancelled","code_document":"STL"},{"code":9,"status":"Rejected","code_document":"STL"},{"code":10,"status":"Completed","code_document":"STL"},{"code":0,"status":"Draft","code_document":"CLM"},{"code":1,"status":"Waiting Approval","code_document":"CLM"},{"code":2,"status":"Revision","code_document":"CLM"},{"code":3,"status":"Cancelled","code_document":"CLM"},{"code":9,"status":"Rejected","code_document":"CLM"},{"code":10,"status":"Completed","code_document":"CLM"},{"code":0,"status":"Need to Settlement","code_document":"TCA"},{"code":1,"status":"Expired","code_document":"TCA"},{"code":2,"status":"Draft","code_document":"TCA"},{"code":3,"status":"Waiting Approval","code_document":"TCA"},{"code":4,"status":"Revision","code_document":"TCA"},{"code":9,"status":"Fully Rejected","code_document":"TCA"},{"code":10,"status":"Completed","code_document":"TCA"},{"code":0,"status":"Need to Settlement","code_document":"CANT"},{"code":1,"status":"Expired","code_document":"CANT"},{"code":2,"status":"Draft","code_document":"CANT"},{"code":3,"status":"Waiting Approval","code_document":"CANT"},{"code":4,"status":"Revision","code_document":"CANT"},{"code":9,"status":"Fully Rejected","code_document":"CANT"},{"code":10,"status":"Completed","code_document":"CANT"},{"code":0,"status":"Draft","code_document":"ATKR"},{"code":1,"status":"Waiting Approval","code_document":"ATKR"},{"code":9,"status":"Cancelled","code_document":"ATKR"},{"code":10,"status":"Completed","code_document":"ATKR"},{"code":0,"status":"Draft","code_document":"STOIN"},{"code":1,"status":"Submitted","code_document":"STOIN"},{"code":0,"status":"Draft","code_document":"STOOP"},{"code":1,"status":"Submitted","code_document":"STOOP"},{"code":0,"status":"Draft","code_document":"BMR"},{"code":1,"status":"Booked","code_document":"BMR"},{"code":9,"status":"Cancelled","code_document":"BMR"},{"code":10,"status":"Done","code_document":"BMR"},{"code":0,"status":"Created","code_document":"DOCDL"},{"code":1,"status":"Received","code_document":"DOCDL"},{"code":2,"status":"Delivering","code_document":"DOCDL"},{"code":3,"status":"Delivered","code_document":"DOCDL"},{"code":0,"status":"Waiting Car & Driver","code_document":"PCR"},{"code":1,"status":"Driver Check","code_document":"PCR"},{"code":2,"status":"Ready","code_document":"PCR"},{"code":3,"status":"Done","code_document":"PCR"}]

class GetStatusDocumentModel {
  GetStatusDocumentModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetStatusDocumentModel.fromJson(dynamic json) {
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
GetStatusDocumentModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetStatusDocumentModel(  success: success ?? _success,
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
/// code_document : "SV"

class Data {
  Data({
      num? code, 
      String? status, 
      String? codeDocument,}){
    _code = code;
    _status = status;
    _codeDocument = codeDocument;
}

  Data.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _codeDocument = json['code_document'];
  }
  num? _code;
  String? _status;
  String? _codeDocument;
Data copyWith({  num? code,
  String? status,
  String? codeDocument,
}) => Data(  code: code ?? _code,
  status: status ?? _status,
  codeDocument: codeDocument ?? _codeDocument,
);
  num? get code => _code;
  String? get status => _status;
  String? get codeDocument => _codeDocument;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['code_document'] = _codeDocument;
    return map;
  }

}