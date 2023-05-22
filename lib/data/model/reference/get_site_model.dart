/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"site_name":"Surabaya","site_code":"SBY","id_company":1,"created_at":"2023-05-19 05:06:48","created_by":null,"updated_at":"2023-05-19 05:06:48","updated_by":null,"company_name":"PT. Testing","company_code":"1234"}]

class GetSiteModel {
  GetSiteModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetSiteModel.fromJson(dynamic json) {
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
GetSiteModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetSiteModel(  success: success ?? _success,
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

/// id : 1
/// site_name : "Surabaya"
/// site_code : "SBY"
/// id_company : 1
/// created_at : "2023-05-19 05:06:48"
/// created_by : null
/// updated_at : "2023-05-19 05:06:48"
/// updated_by : null
/// company_name : "PT. Testing"
/// company_code : "1234"

class Data {
  Data({
      num? id, 
      String? siteName, 
      String? siteCode, 
      num? idCompany, 
      String? createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? companyName, 
      String? companyCode,}){
    _id = id;
    _siteName = siteName;
    _siteCode = siteCode;
    _idCompany = idCompany;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _companyName = companyName;
    _companyCode = companyCode;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _idCompany = json['id_company'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
  }
  num? _id;
  String? _siteName;
  String? _siteCode;
  num? _idCompany;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _companyName;
  String? _companyCode;
Data copyWith({  num? id,
  String? siteName,
  String? siteCode,
  num? idCompany,
  String? createdAt,
  dynamic createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? companyName,
  String? companyCode,
}) => Data(  id: id ?? _id,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  idCompany: idCompany ?? _idCompany,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
);
  num? get id => _id;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  num? get idCompany => _idCompany;
  String? get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['id_company'] = _idCompany;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    return map;
  }

}