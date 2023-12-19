class ItemCashAdvanceTravelModel {
  ItemCashAdvanceTravelModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ItemCashAdvanceTravelModel.fromJson(dynamic json) {
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
ItemCashAdvanceTravelModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => ItemCashAdvanceTravelModel(  success: success ?? _success,
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
      int? id, 
      String? itemName,}){
    _id = id;
    _itemName = itemName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _itemName = json['item_name'];
  }
  int? _id;
  String? _itemName;
Data copyWith({  int? id,
  String? itemName,
}) => Data(  id: id ?? _id,
  itemName: itemName ?? _itemName,
);
  int? get id => _id;
  String? get itemName => _itemName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_name'] = _itemName;
    return map;
  }

}