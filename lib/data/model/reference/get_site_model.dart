/// success : true
/// message : "Success Get Data"
/// data : [{"no":1,"id":14,"site_name":"Balikpapan, Sepinggan","site_code":"BPP02","id_company":3,"created_at":"2023-05-29 07:23:59","created_by":"1","updated_at":"2023-06-08 11:00:22","updated_by":"1","deleted_at":null,"company_name":"PT Sanggar Sarana Baja","company_code":"5000"},{"no":2,"id":16,"site_name":"Jakarta, Cilandak","site_code":"KYB01","id_company":3,"created_at":"2023-05-30 02:52:48","created_by":"1","updated_at":"2023-06-07 02:41:34","updated_by":null,"deleted_at":null,"company_name":"PT Sanggar Sarana Baja","company_code":"5000"},{"no":3,"id":28,"site_name":"Tanah Bumbu, Bunati","site_code":"BLN01","id_company":3,"created_at":"2023-06-05 01:44:34","created_by":"1","updated_at":"2023-06-07 02:45:47","updated_by":"1","deleted_at":null,"company_name":"PT Sanggar Sarana Baja","company_code":"5000","detail":[{"id_warehouse":26,"id_site":28,"warehouse_name":"X1"}]},{"no":4,"id":29,"site_name":"Jakarta, Cilandak","site_code":"KYB01","id_company":48,"created_at":"2023-06-07 02:41:23","created_by":"1","updated_at":"2023-06-07 02:41:23","updated_by":null,"deleted_at":null,"company_name":"PT ABM Investama Tbk","company_code":"9900"},{"no":5,"id":32,"site_name":"Aceh Barat, Meulaboh 1","site_code":"MBO01","id_company":17,"created_at":"2023-06-07 02:48:29","created_by":"1","updated_at":"2023-06-07 02:48:29","updated_by":null,"deleted_at":null,"company_name":"PT Prima Wiguna Parama","company_code":"5300"},{"no":6,"id":33,"site_name":"Bungo","site_code":"MRB01","id_company":17,"created_at":"2023-06-07 02:49:05","created_by":"1","updated_at":"2023-06-07 02:49:05","updated_by":null,"deleted_at":null,"company_name":"PT Prima Wiguna Parama","company_code":"5300","detail":[{"id_warehouse":24,"id_site":33,"warehouse_name":"Gudang SATU"},{"id_warehouse":25,"id_site":33,"warehouse_name":"Gudang DUA"}]},{"no":7,"id":34,"site_name":"Vessel","site_code":"VSL01","id_company":19,"created_at":"2023-06-07 02:49:36","created_by":"1","updated_at":"2023-06-07 02:49:36","updated_by":null,"deleted_at":null,"company_name":"PT Alfa Trans Raya","company_code":"8200"},{"no":8,"id":35,"site_name":"Surabaya, Margomulyo","site_code":"SBY01","id_company":19,"created_at":"2023-06-07 02:50:00","created_by":"1","updated_at":"2023-06-07 02:50:00","updated_by":null,"deleted_at":null,"company_name":"PT Alfa Trans Raya","company_code":"8200"},{"no":9,"id":37,"site_name":"Bojonegoro","site_code":"BJN01","id_company":18,"created_at":"2023-06-07 02:52:50","created_by":"1","updated_at":"2023-06-07 02:52:50","updated_by":null,"deleted_at":null,"company_name":"PT Cipta Krida Bahari","company_code":"8000"}]

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

/// no : 1
/// id : 14
/// site_name : "Balikpapan, Sepinggan"
/// site_code : "BPP02"
/// id_company : 3
/// created_at : "2023-05-29 07:23:59"
/// created_by : "1"
/// updated_at : "2023-06-08 11:00:22"
/// updated_by : "1"
/// deleted_at : null
/// company_name : "PT Sanggar Sarana Baja"
/// company_code : "5000"

class Data {
  Data({
      num? no, 
      num? id, 
      String? siteName, 
      String? siteCode, 
      num? idCompany, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      dynamic deletedAt, 
      String? companyName, 
      String? companyCode,}){
    _no = no;
    _id = id;
    _siteName = siteName;
    _siteCode = siteCode;
    _idCompany = idCompany;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _companyName = companyName;
    _companyCode = companyCode;
}

  Data.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _idCompany = json['id_company'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
  }
  num? _no;
  num? _id;
  String? _siteName;
  String? _siteCode;
  num? _idCompany;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _deletedAt;
  String? _companyName;
  String? _companyCode;
Data copyWith({  num? no,
  num? id,
  String? siteName,
  String? siteCode,
  num? idCompany,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  String? updatedBy,
  dynamic deletedAt,
  String? companyName,
  String? companyCode,
}) => Data(  no: no ?? _no,
  id: id ?? _id,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  idCompany: idCompany ?? _idCompany,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
);
  num? get no => _no;
  num? get id => _id;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  num? get idCompany => _idCompany;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['id_company'] = _idCompany;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    return map;
  }

}