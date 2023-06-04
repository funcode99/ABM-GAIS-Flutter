/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"id_company":1,"departement_name":"Test Deputy","cost_center":"Test Cost","is_active":1,"profit_center":"Test Profit","departement_head":"John Doe","division":"Deputy Test","created_at":"2023-05-15 10:26:27","created_by":null,"updated_at":"2023-05-15 10:26:27","updated_by":null,"company_name":null,"company_code":null}]

class GetDepartmentModel {
  GetDepartmentModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetDepartmentModel.fromJson(dynamic json) {
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
GetDepartmentModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetDepartmentModel(  success: success ?? _success,
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
/// id_company : 1
/// departement_name : "Test Deputy"
/// cost_center : "Test Cost"
/// is_active : 1
/// profit_center : "Test Profit"
/// departement_head : "John Doe"
/// division : "Deputy Test"
/// created_at : "2023-05-15 10:26:27"
/// created_by : null
/// updated_at : "2023-05-15 10:26:27"
/// updated_by : null
/// company_name : null
/// company_code : null

class Data {
  Data({
      num? id, 
      num? idCompany, 
      String? departementName, 
      String? costCenter, 
      num? isActive, 
      String? profitCenter, 
      String? departementHead, 
      String? division, 
      String? createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic companyName, 
      dynamic companyCode,}){
    _id = id;
    _idCompany = idCompany;
    _departementName = departementName;
    _costCenter = costCenter;
    _isActive = isActive;
    _profitCenter = profitCenter;
    _departementHead = departementHead;
    _division = division;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _companyName = companyName;
    _companyCode = companyCode;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idCompany = json['id_company'];
    _departementName = json['departement_name'];
    _costCenter = json['cost_center'];
    _isActive = json['is_active'];
    _profitCenter = json['profit_center'];
    _departementHead = json['departement_head'];
    _division = json['division'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
  }
  num? _id;
  num? _idCompany;
  String? _departementName;
  String? _costCenter;
  num? _isActive;
  String? _profitCenter;
  String? _departementHead;
  String? _division;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _companyName;
  dynamic _companyCode;
Data copyWith({  num? id,
  num? idCompany,
  String? departementName,
  String? costCenter,
  num? isActive,
  String? profitCenter,
  String? departementHead,
  String? division,
  String? createdAt,
  dynamic createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic companyName,
  dynamic companyCode,
}) => Data(  id: id ?? _id,
  idCompany: idCompany ?? _idCompany,
  departementName: departementName ?? _departementName,
  costCenter: costCenter ?? _costCenter,
  isActive: isActive ?? _isActive,
  profitCenter: profitCenter ?? _profitCenter,
  departementHead: departementHead ?? _departementHead,
  division: division ?? _division,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
);
  num? get id => _id;
  num? get idCompany => _idCompany;
  String? get departementName => _departementName;
  String? get costCenter => _costCenter;
  num? get isActive => _isActive;
  String? get profitCenter => _profitCenter;
  String? get departementHead => _departementHead;
  String? get division => _division;
  String? get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get companyName => _companyName;
  dynamic get companyCode => _companyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_company'] = _idCompany;
    map['departement_name'] = _departementName;
    map['cost_center'] = _costCenter;
    map['is_active'] = _isActive;
    map['profit_center'] = _profitCenter;
    map['departement_head'] = _departementHead;
    map['division'] = _division;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    return map;
  }

}