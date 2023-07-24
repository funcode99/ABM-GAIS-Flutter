/// success : true
/// message : "Success Get Data"
/// data : [{"id":101,"id_ca":104,"id_item_ca":null,"id_cost_center":2,"remarks":"remarks dua","item_name":"item dua","frequency":null,"nominal":"200000","total":null,"created_at":"2023-05-24 21:25:37","created_by":"2","updated_at":"2023-05-24 21:25:37","updated_by":null},{"id":102,"id_ca":104,"id_item_ca":null,"id_cost_center":3,"remarks":"remarks 3","item_name":"item tiga","frequency":null,"nominal":"300000","total":null,"created_at":"2023-05-24 21:25:37","created_by":"2","updated_at":"2023-05-24 21:25:37","updated_by":null}]

class GetDetailcaBycashidModel {
  GetDetailcaBycashidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetDetailcaBycashidModel.fromJson(dynamic json) {
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
GetDetailcaBycashidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetDetailcaBycashidModel(  success: success ?? _success,
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

/// id : 101
/// id_ca : 104
/// id_item_ca : null
/// id_cost_center : 2
/// remarks : "remarks dua"
/// item_name : "item dua"
/// frequency : null
/// nominal : "200000"
/// total : null
/// created_at : "2023-05-24 21:25:37"
/// created_by : "2"
/// updated_at : "2023-05-24 21:25:37"
/// updated_by : null

class Data {
  Data({
      num? id, 
      num? idCa, 
      dynamic idItemCa, 
      num? idCostCenter, 
      String? remarks, 
      String? itemName, 
      dynamic frequency, 
      String? nominal, 
      dynamic total, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _idCa = idCa;
    _idItemCa = idItemCa;
    _idCostCenter = idCostCenter;
    _remarks = remarks;
    _itemName = itemName;
    _frequency = frequency;
    _nominal = nominal;
    _total = total;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idCa = json['id_ca'];
    _idItemCa = json['id_item_ca'];
    _idCostCenter = json['id_cost_center'];
    _remarks = json['remarks'];
    _itemName = json['item_name'];
    _frequency = json['frequency'];
    _nominal = json['nominal'];
    _total = json['total'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  num? _idCa;
  dynamic _idItemCa;
  num? _idCostCenter;
  String? _remarks;
  String? _itemName;
  dynamic _frequency;
  String? _nominal;
  dynamic _total;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  num? idCa,
  dynamic idItemCa,
  num? idCostCenter,
  String? remarks,
  String? itemName,
  dynamic frequency,
  String? nominal,
  dynamic total,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  idCa: idCa ?? _idCa,
  idItemCa: idItemCa ?? _idItemCa,
  idCostCenter: idCostCenter ?? _idCostCenter,
  remarks: remarks ?? _remarks,
  itemName: itemName ?? _itemName,
  frequency: frequency ?? _frequency,
  nominal: nominal ?? _nominal,
  total: total ?? _total,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  dynamic get id => _id;
  num? get idCa => _idCa;
  dynamic get idItemCa => _idItemCa;
  num? get idCostCenter => _idCostCenter;
  String? get remarks => _remarks;
  String? get itemName => _itemName;
  dynamic get frequency => _frequency;
  String? get nominal => _nominal;
  dynamic get total => _total;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_ca'] = _idCa;
    map['id_item_ca'] = _idItemCa;
    map['id_cost_center'] = _idCostCenter;
    map['remarks'] = _remarks;
    map['item_name'] = _itemName;
    map['frequency'] = _frequency;
    map['nominal'] = _nominal;
    map['total'] = _total;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}