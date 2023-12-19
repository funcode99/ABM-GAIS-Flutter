class GetManagementMeetingRoomModel {
  GetManagementMeetingRoomModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetManagementMeetingRoomModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetManagementMeetingRoomModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetManagementMeetingRoomModel(  success: success ?? _success,
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

class Data2 {
  Data2({
      num? no, 
      num? id, 
      num? idCompany, 
      num? idSite, 
      String? nameMeetingRoom, 
      num? capacity, 
      num? floor, 
      String? availableStatus, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      String? codeMeetingRoom, 
      String? companyName, 
      String? companyCode, 
      dynamic siteName, 
      dynamic siteCode, 
      String? nameCreated, 
      dynamic nameUpdated,
      dynamic facility,
      dynamic approver,
      dynamic approverArray,
  }){
    _no = no;
    _id = id;
    _idCompany = idCompany;
    _idSite = idSite;
    _nameMeetingRoom = nameMeetingRoom;
    _capacity = capacity;
    _floor = floor;
    _availableStatus = availableStatus;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _codeMeetingRoom = codeMeetingRoom;
    _companyName = companyName;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _nameCreated = nameCreated;
    _nameUpdated = nameUpdated;
    _facility = facility;
    _approver = approver;
    _approverArray = approverArray;
}

  Data2.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _nameMeetingRoom = json['name_meeting_room'];
    _capacity = json['capacity'];
    _floor = json['floor'];
    _availableStatus = json['available_status'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _codeMeetingRoom = json['code_meeting_room'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _nameCreated = json['name_created'];
    _nameUpdated = json['name_updated'];
    _facility = json['facility'];
    _approver = json['approver'];
    _approverArray = json['approver_array'];
  }
  num? _no;
  dynamic _id;
  num? _idCompany;
  num? _idSite;
  String? _nameMeetingRoom;
  num? _capacity;
  num? _floor;
  String? _availableStatus;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  String? _codeMeetingRoom;
  String? _companyName;
  String? _companyCode;
  dynamic _siteName;
  dynamic _siteCode;
  String? _nameCreated;
  dynamic _nameUpdated;
  dynamic _facility;
  dynamic _approver;
  dynamic _approverArray;
Data2 copyWith({  num? no,
  num? id,
  num? idCompany,
  num? idSite,
  String? nameMeetingRoom,
  num? capacity,
  num? floor,
  String? availableStatus,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  String? codeMeetingRoom,
  String? companyName,
  String? companyCode,
  dynamic siteName,
  dynamic siteCode,
  String? nameCreated,
  dynamic nameUpdated,
  dynamic facility,
  dynamic approver,
  dynamic approverArray,
}) => Data2(  no: no ?? _no,
  id: id ?? _id,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  nameMeetingRoom: nameMeetingRoom ?? _nameMeetingRoom,
  capacity: capacity ?? _capacity,
  floor: floor ?? _floor,
  availableStatus: availableStatus ?? _availableStatus,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  codeMeetingRoom: codeMeetingRoom ?? _codeMeetingRoom,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  nameCreated: nameCreated ?? _nameCreated,
  nameUpdated: nameUpdated ?? _nameUpdated,
  facility: facility ?? _facility,
  approver: approver ?? _approver,
  approverArray: approverArray ?? _approverArray,
);
  num? get no => _no;
  dynamic get id => _id;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  String? get nameMeetingRoom => _nameMeetingRoom;
  num? get capacity => _capacity;
  num? get floor => _floor;
  String? get availableStatus => _availableStatus;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get codeMeetingRoom => _codeMeetingRoom;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  dynamic get siteName => _siteName;
  dynamic get siteCode => _siteCode;
  String? get nameCreated => _nameCreated;
  dynamic get nameUpdated => _nameUpdated;
  dynamic get facility => _facility;
  dynamic get approver => _approver;
  dynamic get approverArray => _approverArray;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['name_meeting_room'] = _nameMeetingRoom;
    map['capacity'] = _capacity;
    map['floor'] = _floor;
    map['available_status'] = _availableStatus;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['code_meeting_room'] = _codeMeetingRoom;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['name_created'] = _nameCreated;
    map['name_updated'] = _nameUpdated;
    map['facility'] = _facility;
    map['approver'] = approver;
    map['approver_array'] = approverArray;
    return map;
  }

}