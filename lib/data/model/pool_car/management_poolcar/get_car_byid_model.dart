/// success : true
/// message : "Success Get Data"
/// data : [{"id":4,"car_name":"TESTLA","plate":"B1234ABM","id_company":1,"id_site":1,"odometer":12345,"transmisi":"Auto","id_driver":1,"status":1,"id_car_type":null,"created_at":"2023-07-05 23:35:33","created_by":"1","updated_at":"2023-07-06 08:34:35","updated_by":"2","deleted_at":null,"company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"type_car":null,"name":"admin"}]

class GetCarByidModel {
  GetCarByidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCarByidModel.fromJson(dynamic json) {
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
GetCarByidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCarByidModel(  success: success ?? _success,
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

/// id : 4
/// car_name : "TESTLA"
/// plate : "B1234ABM"
/// id_company : 1
/// id_site : 1
/// odometer : 12345
/// transmisi : "Auto"
/// id_driver : 1
/// status : 1
/// id_car_type : null
/// created_at : "2023-07-05 23:35:33"
/// created_by : "1"
/// updated_at : "2023-07-06 08:34:35"
/// updated_by : "2"
/// deleted_at : null
/// company_name : "PT Cipta Kridatama"
/// company_code : "3000"
/// site_name : null
/// site_code : null
/// type_car : null
/// name : "admin"

class Data {
  Data({
      num? id, 
      String? carName, 
      String? plate, 
      num? idCompany, 
      num? idSite, 
      dynamic odometer,
      String? transmisi, 
      num? idDriver, 
      num? status, 
      dynamic idCarType, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      dynamic deletedAt, 
      String? companyName, 
      String? companyCode, 
      dynamic siteName, 
      dynamic siteCode, 
      dynamic typeCar, 
      String? name,
      String? hullNo,
      String? stickersDate,
      String? kirDate,
      num? type,
      String? typeName,
      String? plateDate,
      String? registrationDate,
      String? startDate,
      String? endDate,
      String? assetNo,
      String? vendorName,
  }){
    _id = id;
    _carName = carName;
    _plate = plate;
    _idCompany = idCompany;
    _idSite = idSite;
    _odometer = odometer;
    _transmisi = transmisi;
    _idDriver = idDriver;
    _status = status;
    _idCarType = idCarType;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _companyName = companyName;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _typeCar = typeCar;
    _name = name;
    _hullNo = hullNo;
    _stickersDate = stickersDate;
    _kirDate = kirDate;
    _type = type;
    _typeName = typeName;
    _plateDate = plateDate;
    _registrationDate = registrationDate;
    _startDate = startDate;
    _endDate = endDate;
    _assetNo = assetNo;
    _vendorName = vendorName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _carName = json['car_name'];
    _plate = json['plate'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _odometer = json['odometer'];
    _transmisi = json['transmisi'];
    _idDriver = json['id_driver'];
    _status = json['status'];
    _idCarType = json['id_car_type'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _typeCar = json['type_car'];
    _name = json['name'];
    _hullNo = json['hull_no'];
    _stickersDate = json['stickers_date'];
    _kirDate = json['kir_date'];
    _type = json['type'];
    _typeName = json['type_name'];
    _plateDate = json['plate_date'];
    _registrationDate = json['registration_date'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _assetNo = json['asset_no'];
    _vendorName = json['vendor_name'];

  }
  dynamic _id;
  String? _carName;
  String? _plate;
  num? _idCompany;
  num? _idSite;
  dynamic _odometer;
  String? _transmisi;
  num? _idDriver;
  num? _status;
  dynamic _idCarType;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _deletedAt;
  String? _companyName;
  String? _companyCode;
  dynamic _siteName;
  dynamic _siteCode;
  dynamic _typeCar;
  String? _name;
  String? _hullNo;
  String? _stickersDate;
  String? _kirDate;
  num? _type;
  String? _typeName;
  String? _plateDate;
  String? _registrationDate;
  String? _startDate;
  String? _endDate;
  String? _assetNo;
  String? _vendorName;
Data copyWith({  num? id,
  String? carName,
  String? plate,
  num? idCompany,
  num? idSite,
  dynamic odometer,
  String? transmisi,
  num? idDriver,
  num? status,
  dynamic idCarType,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  String? updatedBy,
  dynamic deletedAt,
  String? companyName,
  String? companyCode,
  dynamic siteName,
  dynamic siteCode,
  dynamic typeCar,
  String? name,
  String? hullNo,
  String? stickersDate,
  String? kirDate,
  num? type,
  String? typeName,
  String? plateDate,
  String? registrationDate,
  String? startDate,
  String? endDate,
  String? assetNo,
  String? vendorName,
}) => Data(  id: id ?? _id,
  carName: carName ?? _carName,
  plate: plate ?? _plate,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  odometer: odometer ?? _odometer,
  transmisi: transmisi ?? _transmisi,
  idDriver: idDriver ?? _idDriver,
  status: status ?? _status,
  idCarType: idCarType ?? _idCarType,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  typeCar: typeCar ?? _typeCar,
  name: name ?? _name,
  hullNo: hullNo ?? _hullNo,
  stickersDate: stickersDate ?? _stickersDate,
  kirDate: kirDate ?? _kirDate,
  type: type ?? _type,
  typeName: typeName ?? _typeName,
  plateDate: plateDate ?? _plateDate,
  registrationDate: registrationDate ?? _registrationDate,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  assetNo: assetNo ?? _assetNo,
  vendorName: vendorName ?? _vendorName,
);
  dynamic get id => _id;
  String? get carName => _carName;
  String? get plate => _plate;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  dynamic get odometer => _odometer;
  String? get transmisi => _transmisi;
  num? get idDriver => _idDriver;
  num? get status => _status;
  dynamic get idCarType => _idCarType;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  dynamic get siteName => _siteName;
  dynamic get siteCode => _siteCode;
  dynamic get typeCar => _typeCar;
  String? get name => _name;
  String? get hullNo => _hullNo;
  String? get stickersDate => _stickersDate;
  String? get kirDate => _kirDate;
  num? get type => _type;
  String? get typeName => _typeName;
  String? get plateDate => _plateDate;
  String? get registrationDate => _registrationDate;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get assetNo => _assetNo;
  String? get vendorName => _vendorName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['car_name'] = _carName;
    map['plate'] = _plate;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['odometer'] = _odometer;
    map['transmisi'] = _transmisi;
    map['id_driver'] = _idDriver;
    map['status'] = _status;
    map['id_car_type'] = _idCarType;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['type_car'] = _typeCar;
    map['name'] = _name;
    map['hullNo'] = _hullNo;
    map['stickersDate'] = _stickersDate;
    map['kirDate'] = _kirDate;
    map['type'] = _type;
    map['typeName'] = _typeName;
    map['plateDate'] = _plateDate;
    map['registrationDate'] = _registrationDate;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['assetNo'] = _assetNo;
    map['vendorName'] = _vendorName;

    return map;
  }

}