class SaveManagementMeetingRoomModel {
  SaveManagementMeetingRoomModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveManagementMeetingRoomModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveManagementMeetingRoomModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveManagementMeetingRoomModel(  success: success ?? _success,
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
      String? createdAt, 
      num? createdBy, 
      String? idCompany, 
      String? idSite, 
      String? nameMeetingRoom, 
      String? codeMeetingRoom, 
      String? capacity, 
      String? floor, 
      String? availableStatus, 
      String? updatedAt, 
      num? id,}){
    _createdAt = createdAt;
    _createdBy = createdBy;
    _idCompany = idCompany;
    _idSite = idSite;
    _nameMeetingRoom = nameMeetingRoom;
    _codeMeetingRoom = codeMeetingRoom;
    _capacity = capacity;
    _floor = floor;
    _availableStatus = availableStatus;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _nameMeetingRoom = json['name_meeting_room'];
    _codeMeetingRoom = json['code_meeting_room'];
    _capacity = json['capacity'];
    _floor = json['floor'];
    _availableStatus = json['available_status'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _createdAt;
  num? _createdBy;
  String? _idCompany;
  String? _idSite;
  String? _nameMeetingRoom;
  String? _codeMeetingRoom;
  String? _capacity;
  String? _floor;
  String? _availableStatus;
  String? _updatedAt;
  num? _id;
Data copyWith({  String? createdAt,
  num? createdBy,
  String? idCompany,
  String? idSite,
  String? nameMeetingRoom,
  String? codeMeetingRoom,
  String? capacity,
  String? floor,
  String? availableStatus,
  String? updatedAt,
  num? id,
}) => Data(  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  nameMeetingRoom: nameMeetingRoom ?? _nameMeetingRoom,
  codeMeetingRoom: codeMeetingRoom ?? _codeMeetingRoom,
  capacity: capacity ?? _capacity,
  floor: floor ?? _floor,
  availableStatus: availableStatus ?? _availableStatus,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get idCompany => _idCompany;
  String? get idSite => _idSite;
  String? get nameMeetingRoom => _nameMeetingRoom;
  String? get codeMeetingRoom => _codeMeetingRoom;
  String? get capacity => _capacity;
  String? get floor => _floor;
  String? get availableStatus => _availableStatus;
  String? get updatedAt => _updatedAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['name_meeting_room'] = _nameMeetingRoom;
    map['code_meeting_room'] = _codeMeetingRoom;
    map['capacity'] = _capacity;
    map['floor'] = _floor;
    map['available_status'] = _availableStatus;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}