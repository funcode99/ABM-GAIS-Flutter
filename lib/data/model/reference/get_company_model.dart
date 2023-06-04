/// success : true
/// message : "Success Get Data"
/// data : [{"id":12,"company_code":"10820","company_name":"PT Satu Dua Dan Tiga","parent_company":"PT Prima Wiguna Parama","logo":"brand-ambassador1.png","logo_path":"storage/files/company/gPhstumrocE9HmtnRs5zrX8LwRYnXlrYQSPHYcr0.png","id_vendor":1,"created_at":"2023-05-15 09:03:22","created_by":"1","updated_at":"2023-05-15 09:03:22","updated_by":null,"vendor":"Antavaya"},{"id":11,"company_code":"5300","company_name":"PT Prima Wiguna Parama","parent_company":null,"logo":"Screenshot 2023-05-15 at 15.46.24.png","logo_path":"storage/files/company/BoI7yq4rFCCsBnmaco9Oojuti8LhaqL5jmlM0Wdv.png","id_vendor":1,"created_at":"2023-05-15 08:52:39","created_by":"1","updated_at":"2023-05-15 08:52:39","updated_by":null,"vendor":"Antavaya"},{"id":10,"company_code":"5000","company_name":"PT Sanggar Sarana Baja","parent_company":null,"logo":"Screenshot 2023-05-15 at 15.48.24.png","logo_path":"storage/files/company/Vi85uSLbd4ztNxeXmzvpKfVYcNSWApOSQah3YBXR.png","id_vendor":1,"created_at":"2023-05-15 08:49:13","created_by":"1","updated_at":"2023-05-15 08:49:13","updated_by":null,"vendor":"Antavaya"},{"id":9,"company_code":"4410","company_name":"PT Nagata Dinamika","parent_company":null,"logo":null,"logo_path":null,"id_vendor":1,"created_at":"2023-05-15 08:44:27","created_by":"1","updated_at":"2023-05-15 08:44:27","updated_by":null,"vendor":"Antavaya"},{"id":8,"company_code":"3000","company_name":"PT. Cipta Kridatama","parent_company":null,"logo":null,"logo_path":null,"id_vendor":1,"created_at":"2023-05-15 08:39:35","created_by":"1","updated_at":"2023-05-15 08:39:35","updated_by":null,"vendor":"Antavaya"},{"id":13,"company_code":"D001","company_name":"PT TEST","parent_company":"PT ABM","logo":null,"logo_path":null,"id_vendor":2,"created_at":"2023-05-15 09:07:34","created_by":"1","updated_at":"2023-05-15 09:07:34","updated_by":null,"vendor":"Aerowisata"}]

class GetCompanyModel {
  GetCompanyModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCompanyModel.fromJson(dynamic json) {
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
GetCompanyModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCompanyModel(  success: success ?? _success,
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

/// id : 12
/// company_code : "10820"
/// company_name : "PT Satu Dua Dan Tiga"
/// parent_company : "PT Prima Wiguna Parama"
/// logo : "brand-ambassador1.png"
/// logo_path : "storage/files/company/gPhstumrocE9HmtnRs5zrX8LwRYnXlrYQSPHYcr0.png"
/// id_vendor : 1
/// created_at : "2023-05-15 09:03:22"
/// created_by : "1"
/// updated_at : "2023-05-15 09:03:22"
/// updated_by : null
/// vendor : "Antavaya"

class Data {
  Data({
      num? id, 
      String? companyCode, 
      String? companyName, 
      String? parentCompany, 
      String? logo, 
      String? logoPath, 
      num? idVendor, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? vendor,}){
    _id = id;
    _companyCode = companyCode;
    _companyName = companyName;
    _parentCompany = parentCompany;
    _logo = logo;
    _logoPath = logoPath;
    _idVendor = idVendor;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _vendor = vendor;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _companyCode = json['company_code'];
    _companyName = json['company_name'];
    _parentCompany = json['parent_company'];
    _logo = json['logo'];
    _logoPath = json['logo_path'];
    _idVendor = json['id_vendor'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _vendor = json['vendor'];
  }
  num? _id;
  String? _companyCode;
  String? _companyName;
  String? _parentCompany;
  String? _logo;
  String? _logoPath;
  num? _idVendor;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _vendor;
Data copyWith({  num? id,
  String? companyCode,
  String? companyName,
  String? parentCompany,
  String? logo,
  String? logoPath,
  num? idVendor,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? vendor,
}) => Data(  id: id ?? _id,
  companyCode: companyCode ?? _companyCode,
  companyName: companyName ?? _companyName,
  parentCompany: parentCompany ?? _parentCompany,
  logo: logo ?? _logo,
  logoPath: logoPath ?? _logoPath,
  idVendor: idVendor ?? _idVendor,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  vendor: vendor ?? _vendor,
);
  num? get id => _id;
  String? get companyCode => _companyCode;
  String? get companyName => _companyName;
  String? get parentCompany => _parentCompany;
  String? get logo => _logo;
  String? get logoPath => _logoPath;
  num? get idVendor => _idVendor;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get vendor => _vendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_code'] = _companyCode;
    map['company_name'] = _companyName;
    map['parent_company'] = _parentCompany;
    map['logo'] = _logo;
    map['logo_path'] = _logoPath;
    map['id_vendor'] = _idVendor;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['vendor'] = _vendor;
    return map;
  }

}