class GetCosetCenterModel {
  GetCosetCenterModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCosetCenterModel.fromJson(dynamic json) {
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
GetCosetCenterModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCosetCenterModel(  success: success ?? _success,
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
      num? no, 
      num? id, 
      String? costCenterCode, 
      String? costCenterName, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy, 
      dynamic companyCode,}){
    _no = no;
    _id = id;
    _costCenterCode = costCenterCode;
    _costCenterName = costCenterName;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _companyCode = companyCode;
}

  Data.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _costCenterCode = json['cost_center_code'];
    _costCenterName = json['cost_center_name'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _companyCode = json['company_code'];
  }
  num? _no;
  num? _id;
  String? _costCenterCode;
  String? _costCenterName;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  dynamic _companyCode;
Data copyWith({  num? no,
  num? id,
  String? costCenterCode,
  String? costCenterName,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
  dynamic companyCode,
}) => Data(  no: no ?? _no,
  id: id ?? _id,
  costCenterCode: costCenterCode ?? _costCenterCode,
  costCenterName: costCenterName ?? _costCenterName,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  companyCode: companyCode ?? _companyCode,
);
  num? get no => _no;
  num? get id => _id;
  String? get costCenterCode => _costCenterCode;
  String? get costCenterName => _costCenterName;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get companyCode => _companyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['cost_center_code'] = _costCenterCode;
    map['cost_center_name'] = _costCenterName;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['company_code'] = _companyCode;
    return map;
  }

}