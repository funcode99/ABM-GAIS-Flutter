/// success : true
/// message : "Success Get Data"
/// data : {"current_page":1,"data":[{"no":1,"id":1,"band_job_name":"test_update","id_company":1,"hotel_fare":"160000","meals_rate":"13000","id_flight_class":63,"created_at":"2023-05-29 06:39:11","created_by":"1","updated_at":"2023-05-29 21:04:52","updated_by":"2","company_name":"PT Cipta Kridatama","flight_class":"First Class"}],"first_page_url":"http://103.165.130.157:8086/api/job_band?page=1","from":1,"last_page":1,"last_page_url":"http://103.165.130.157:8086/api/job_band?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://103.165.130.157:8086/api/job_band?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://103.165.130.157:8086/api/job_band","per_page":"10","prev_page_url":null,"to":1,"total":1}

class GetJobBandModel {
  GetJobBandModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetJobBandModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetJobBandModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetJobBandModel(  success: success ?? _success,
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
/// data : [{"no":1,"id":1,"band_job_name":"test_update","id_company":1,"hotel_fare":"160000","meals_rate":"13000","id_flight_class":63,"created_at":"2023-05-29 06:39:11","created_by":"1","updated_at":"2023-05-29 21:04:52","updated_by":"2","company_name":"PT Cipta Kridatama","flight_class":"First Class"}]
/// first_page_url : "http://103.165.130.157:8086/api/job_band?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://103.165.130.157:8086/api/job_band?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://103.165.130.157:8086/api/job_band?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://103.165.130.157:8086/api/job_band"
/// per_page : "10"
/// prev_page_url : null
/// to : 1
/// total : 1

class Data {
  Data({
      num? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
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
  dynamic _nextPageUrl;
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
  dynamic nextPageUrl,
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
  dynamic get nextPageUrl => _nextPageUrl;
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

/// no : 1
/// id : 1
/// band_job_name : "test_update"
/// id_company : 1
/// hotel_fare : "160000"
/// meals_rate : "13000"
/// id_flight_class : 63
/// created_at : "2023-05-29 06:39:11"
/// created_by : "1"
/// updated_at : "2023-05-29 21:04:52"
/// updated_by : "2"
/// company_name : "PT Cipta Kridatama"
/// flight_class : "First Class"

class Data2 {
  Data2({
      num? no, 
      num? id, 
      String? bandJobName, 
      num? idCompany, 
      String? hotelFare, 
      String? mealsRate, 
      num? idFlightClass, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      String? companyName, 
      String? flightClass,}){
    _no = no;
    _id = id;
    _bandJobName = bandJobName;
    _idCompany = idCompany;
    _hotelFare = hotelFare;
    _mealsRate = mealsRate;
    _idFlightClass = idFlightClass;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _companyName = companyName;
    _flightClass = flightClass;
}

  Data2.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _bandJobName = json['band_job_name'];
    _idCompany = json['id_company'];
    _hotelFare = json['hotel_fare'];
    _mealsRate = json['meals_rate'];
    _idFlightClass = json['id_flight_class'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _companyName = json['company_name'];
    _flightClass = json['flight_class'];
  }
  num? _no;
  dynamic _id;
  String? _bandJobName;
  num? _idCompany;
  String? _hotelFare;
  String? _mealsRate;
  num? _idFlightClass;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  String? _companyName;
  String? _flightClass;
Data2 copyWith({  num? no,
  num? id,
  String? bandJobName,
  num? idCompany,
  String? hotelFare,
  String? mealsRate,
  num? idFlightClass,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  String? updatedBy,
  String? companyName,
  String? flightClass,
}) => Data2(  no: no ?? _no,
  id: id ?? _id,
  bandJobName: bandJobName ?? _bandJobName,
  idCompany: idCompany ?? _idCompany,
  hotelFare: hotelFare ?? _hotelFare,
  mealsRate: mealsRate ?? _mealsRate,
  idFlightClass: idFlightClass ?? _idFlightClass,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  companyName: companyName ?? _companyName,
  flightClass: flightClass ?? _flightClass,
);
  num? get no => _no;
  dynamic get id => _id;
  String? get bandJobName => _bandJobName;
  num? get idCompany => _idCompany;
  String? get hotelFare => _hotelFare;
  String? get mealsRate => _mealsRate;
  num? get idFlightClass => _idFlightClass;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  String? get companyName => _companyName;
  String? get flightClass => _flightClass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['band_job_name'] = _bandJobName;
    map['id_company'] = _idCompany;
    map['hotel_fare'] = _hotelFare;
    map['meals_rate'] = _mealsRate;
    map['id_flight_class'] = _idFlightClass;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['company_name'] = _companyName;
    map['flight_class'] = _flightClass;
    return map;
  }

}