/// success : true
/// message : "Success Get Data"
/// data : {"current_page":1,"data":[{"no":4,"id":7,"car_name":"12121","plate":"121212","id_company":2,"id_site":16,"odometer":2121,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:51:35","created_by":"1","updated_at":"2023-07-06 08:51:35","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Jakarta, Cilandak","site_code":"KYB01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":6,"id":9,"car_name":"12121","plate":"2121","id_company":2,"id_site":18,"odometer":4343,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:59:29","created_by":"1","updated_at":"2023-07-06 08:59:29","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Lahat, Kebur x","site_code":"LHT01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":5,"id":8,"car_name":"12121","plate":"2121","id_company":2,"id_site":18,"odometer":4343,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:59:23","created_by":"1","updated_at":"2023-07-06 08:59:23","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Lahat, Kebur x","site_code":"LHT01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":9,"id":12,"car_name":"Avanza","plate":"B 1234 ABM","id_company":1,"id_site":44,"odometer":1234,"transmisi":"Auto","id_driver":6598,"status":1,"id_car_type":2,"created_at":"2023-07-06 10:06:48","created_by":"5","updated_at":"2023-07-06 10:06:48","updated_by":null,"deleted_at":null,"company_code":"3000","site_name":"Jakarta, Cilandak","site_code":"KYB01","type_car":"Sedan","name":"Oke Driver","company_name":"PT Cipta Kridatama"},{"no":3,"id":6,"car_name":"Sigra","plate":"BBBBB","id_company":2,"id_site":14,"odometer":2000,"transmisi":"Manual","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:50:55","created_by":"1","updated_at":"2023-07-06 08:50:55","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Balikpapan, Sepinggan","site_code":"BPP02","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"}],"first_page_url":"http://38.47.76.138:8013/api/car/get?page=1","from":1,"last_page":2,"last_page_url":"http://38.47.76.138:8013/api/car/get?page=2","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://38.47.76.138:8013/api/car/get?page=1","label":"1","active":true},{"url":"http://38.47.76.138:8013/api/car/get?page=2","label":"2","active":false},{"url":"http://38.47.76.138:8013/api/car/get?page=2","label":"Next &raquo;","active":false}],"next_page_url":"http://38.47.76.138:8013/api/car/get?page=2","path":"http://38.47.76.138:8013/api/car/get","per_page":"5","prev_page_url":null,"to":5,"total":9}

class GetCarListModel {
  GetCarListModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCarListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetCarListModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetCarListModel(  success: success ?? _success,
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

/// current_page : 1
/// data : [{"no":4,"id":7,"car_name":"12121","plate":"121212","id_company":2,"id_site":16,"odometer":2121,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:51:35","created_by":"1","updated_at":"2023-07-06 08:51:35","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Jakarta, Cilandak","site_code":"KYB01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":6,"id":9,"car_name":"12121","plate":"2121","id_company":2,"id_site":18,"odometer":4343,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:59:29","created_by":"1","updated_at":"2023-07-06 08:59:29","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Lahat, Kebur x","site_code":"LHT01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":5,"id":8,"car_name":"12121","plate":"2121","id_company":2,"id_site":18,"odometer":4343,"transmisi":"Automatic","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:59:23","created_by":"1","updated_at":"2023-07-06 08:59:23","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Lahat, Kebur x","site_code":"LHT01","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"},{"no":9,"id":12,"car_name":"Avanza","plate":"B 1234 ABM","id_company":1,"id_site":44,"odometer":1234,"transmisi":"Auto","id_driver":6598,"status":1,"id_car_type":2,"created_at":"2023-07-06 10:06:48","created_by":"5","updated_at":"2023-07-06 10:06:48","updated_by":null,"deleted_at":null,"company_code":"3000","site_name":"Jakarta, Cilandak","site_code":"KYB01","type_car":"Sedan","name":"Oke Driver","company_name":"PT Cipta Kridatama"},{"no":3,"id":6,"car_name":"Sigra","plate":"BBBBB","id_company":2,"id_site":14,"odometer":2000,"transmisi":"Manual","id_driver":6598,"status":1,"id_car_type":1,"created_at":"2023-07-06 08:50:55","created_by":"1","updated_at":"2023-07-06 08:50:55","updated_by":null,"deleted_at":null,"company_code":"4410","site_name":"Balikpapan, Sepinggan","site_code":"BPP02","type_car":"SUV","name":"Oke Driver","company_name":"PT Nagata Dinamika"}]
/// first_page_url : "http://38.47.76.138:8013/api/car/get?page=1"
/// from : 1
/// last_page : 2
/// last_page_url : "http://38.47.76.138:8013/api/car/get?page=2"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://38.47.76.138:8013/api/car/get?page=1","label":"1","active":true},{"url":"http://38.47.76.138:8013/api/car/get?page=2","label":"2","active":false},{"url":"http://38.47.76.138:8013/api/car/get?page=2","label":"Next &raquo;","active":false}]
/// next_page_url : "http://38.47.76.138:8013/api/car/get?page=2"
/// path : "http://38.47.76.138:8013/api/car/get"
/// per_page : "5"
/// prev_page_url : null
/// to : 5
/// total : 9

class Data {
  Data({
      num? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      String? nextPageUrl, 
      String? path, 
      String? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<Data2>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
Data copyWith({  num? currentPage,
  List<Data2>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  String? nextPageUrl,
  String? path,
  String? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => Data(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  links: links ?? _links,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<Data2>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  String? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
  label: label ?? _label,
  active: active ?? _active,
);
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

/// no : 4
/// id : 7
/// car_name : "12121"
/// plate : "121212"
/// id_company : 2
/// id_site : 16
/// odometer : 2121
/// transmisi : "Automatic"
/// id_driver : 6598
/// status : 1
/// id_car_type : 1
/// created_at : "2023-07-06 08:51:35"
/// created_by : "1"
/// updated_at : "2023-07-06 08:51:35"
/// updated_by : null
/// deleted_at : null
/// company_code : "4410"
/// site_name : "Jakarta, Cilandak"
/// site_code : "KYB01"
/// type_car : "SUV"
/// name : "Oke Driver"
/// company_name : "PT Nagata Dinamika"

class Data2 {
  Data2({
      num? no, 
      num? id, 
      String? carName, 
      String? plate, 
      num? idCompany, 
      num? idSite, 
      num? odometer, 
      String? transmisi, 
      num? idDriver, 
      num? status, 
      num? idCarType, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      String? companyCode, 
      String? siteName, 
      String? siteCode, 
      String? typeCar, 
      String? name, 
      String? companyName,}){
    _no = no;
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
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _typeCar = typeCar;
    _name = name;
    _companyName = companyName;
}

  Data2.fromJson(dynamic json) {
    _no = json['no'];
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
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _typeCar = json['type_car'];
    _name = json['name'];
    _companyName = json['company_name'];
  }
  num? _no;
  num? _id;
  String? _carName;
  String? _plate;
  num? _idCompany;
  num? _idSite;
  num? _odometer;
  String? _transmisi;
  num? _idDriver;
  num? _status;
  num? _idCarType;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  String? _companyCode;
  String? _siteName;
  String? _siteCode;
  String? _typeCar;
  String? _name;
  String? _companyName;
Data2 copyWith({  num? no,
  num? id,
  String? carName,
  String? plate,
  num? idCompany,
  num? idSite,
  num? odometer,
  String? transmisi,
  num? idDriver,
  num? status,
  num? idCarType,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  String? companyCode,
  String? siteName,
  String? siteCode,
  String? typeCar,
  String? name,
  String? companyName,
}) => Data2(  no: no ?? _no,
  id: id ?? _id,
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
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  typeCar: typeCar ?? _typeCar,
  name: name ?? _name,
  companyName: companyName ?? _companyName,
);
  num? get no => _no;
  num? get id => _id;
  String? get carName => _carName;
  String? get plate => _plate;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  num? get odometer => _odometer;
  String? get transmisi => _transmisi;
  num? get idDriver => _idDriver;
  num? get status => _status;
  num? get idCarType => _idCarType;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get companyCode => _companyCode;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get typeCar => _typeCar;
  String? get name => _name;
  String? get companyName => _companyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
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
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['type_car'] = _typeCar;
    map['name'] = _name;
    map['company_name'] = _companyName;
    return map;
  }

}