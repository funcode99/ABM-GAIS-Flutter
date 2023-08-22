class GetActivitiesByactualidModel {
  GetActivitiesByactualidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetActivitiesByactualidModel.fromJson(dynamic json) {
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
GetActivitiesByactualidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetActivitiesByactualidModel(  success: success ?? _success,
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
      String? id, 
      String? idAct, 
      String? actDate, 
      String? activities, 
      num? createdBy, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _idAct = idAct;
    _actDate = actDate;
    _activities = activities;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idAct = json['id_act'];
    _actDate = json['act_date'];
    _activities = json['activities'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _idAct;
  String? _actDate;
  String? _activities;
  num? _createdBy;
  dynamic _updatedBy;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? idAct,
  String? actDate,
  String? activities,
  num? createdBy,
  dynamic updatedBy,
  dynamic deletedAt,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  idAct: idAct ?? _idAct,
  actDate: actDate ?? _actDate,
  activities: activities ?? _activities,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get idAct => _idAct;
  String? get actDate => _actDate;
  String? get activities => _activities;
  num? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_act'] = _idAct;
    map['act_date'] = _actDate;
    map['activities'] = _activities;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}