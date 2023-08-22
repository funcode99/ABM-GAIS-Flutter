class SaveActivitiesModel {
  SaveActivitiesModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveActivitiesModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveActivitiesModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveActivitiesModel(  success: success ?? _success,
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
      String? idAct, 
      String? actDate, 
      String? activities, 
      num? createdBy, 
      String? id, 
      String? updatedAt, 
      String? createdAt,}){
    _idAct = idAct;
    _actDate = actDate;
    _activities = activities;
    _createdBy = createdBy;
    _id = id;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _idAct = json['id_act'];
    _actDate = json['act_date'];
    _activities = json['activities'];
    _createdBy = json['created_by'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _idAct;
  String? _actDate;
  String? _activities;
  num? _createdBy;
  String? _id;
  String? _updatedAt;
  String? _createdAt;
Data copyWith({  String? idAct,
  String? actDate,
  String? activities,
  num? createdBy,
  String? id,
  String? updatedAt,
  String? createdAt,
}) => Data(  idAct: idAct ?? _idAct,
  actDate: actDate ?? _actDate,
  activities: activities ?? _activities,
  createdBy: createdBy ?? _createdBy,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get idAct => _idAct;
  String? get actDate => _actDate;
  String? get activities => _activities;
  num? get createdBy => _createdBy;
  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_act'] = _idAct;
    map['act_date'] = _actDate;
    map['activities'] = _activities;
    map['created_by'] = _createdBy;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}