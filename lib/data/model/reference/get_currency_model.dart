/// success : true
/// message : "Success Get Data"
/// data : [{"id":5,"currency_name":"Australian Dollar","currency_symbol":"A$","currency_code":"AUD","created_at":"2023-05-23 16:19:37","created_by":"1","updated_at":"2023-05-23 16:19:37","updated_by":null},{"id":18,"currency_name":"Balboa","currency_symbol":"B/.","currency_code":"PAB","created_at":"2023-05-23 16:50:47","created_by":"1","updated_at":"2023-05-23 16:50:47","updated_by":null},{"id":12,"currency_name":"Belarusian Ruble","currency_symbol":"BYN","currency_code":"BYN","created_at":"2023-05-23 16:48:18","created_by":"1","updated_at":"2023-05-23 16:48:18","updated_by":null},{"id":6,"currency_name":"Euro","currency_symbol":"€","currency_code":"EUR","created_at":"2023-05-23 16:33:08","created_by":"1","updated_at":"2023-05-23 16:33:08","updated_by":null},{"id":8,"currency_name":"Hong Kong Dollar","currency_symbol":"HK$","currency_code":"HKD","created_at":"2023-05-23 16:34:15","created_by":"1","updated_at":"2023-05-23 16:34:15","updated_by":null},{"id":14,"currency_name":"Jamaican Dollar","currency_symbol":"$","currency_code":"JMD","created_at":"2023-05-23 16:49:23","created_by":"1","updated_at":"2023-05-23 16:49:23","updated_by":null},{"id":9,"currency_name":"Malaysian Ringgit","currency_symbol":"RM","currency_code":"MYR","created_at":"2023-05-23 16:36:31","created_by":"1","updated_at":"2023-05-23 16:36:31","updated_by":null},{"id":21,"currency_name":"New Dollars","currency_symbol":"ND","currency_code":"New Dollars","created_at":"2023-05-23 17:11:46","created_by":"1","updated_at":"2023-05-23 17:12:20","updated_by":"1"},{"id":11,"currency_name":"New Zealand Dollar","currency_symbol":"$","currency_code":"NZD","created_at":"2023-05-23 16:46:53","created_by":"1","updated_at":"2023-05-23 16:46:53","updated_by":null},{"id":7,"currency_name":"Rupiah","currency_symbol":"Rp","currency_code":"Rp","created_at":"2023-05-23 16:33:20","created_by":"1","updated_at":"2023-05-23 16:33:20","updated_by":null},{"id":19,"currency_name":"Solomon Islands Dollar","currency_symbol":"Si$","currency_code":"SBD","created_at":"2023-05-23 16:53:05","created_by":"1","updated_at":"2023-05-23 16:53:05","updated_by":null},{"id":20,"currency_name":"Syrian Pound","currency_symbol":"LS, £","currency_code":"SYP","created_at":"2023-05-23 16:53:31","created_by":"1","updated_at":"2023-05-24 03:56:09","updated_by":"1"},{"id":10,"currency_name":"Taiwan Dollar","currency_symbol":"NT$","currency_code":"TWD","created_at":"2023-05-23 16:38:44","created_by":"1","updated_at":"2023-05-23 16:38:44","updated_by":null},{"id":4,"currency_name":"UAE Dirham","currency_symbol":"د.إ","currency_code":"AED","created_at":"2023-05-23 16:18:47","created_by":"1","updated_at":"2023-05-23 16:18:47","updated_by":null},{"id":2,"currency_name":"US Dollar","currency_symbol":"$","currency_code":"USD","created_at":"2023-05-22 02:39:30","created_by":"1","updated_at":"2023-05-22 02:39:30","updated_by":null},{"id":13,"currency_name":"Yuan","currency_symbol":"¥","currency_code":"CNY","created_at":"2023-05-23 16:48:40","created_by":"1","updated_at":"2023-05-23 16:48:40","updated_by":null}]

class GetCurrencyModel {
  GetCurrencyModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCurrencyModel.fromJson(dynamic json) {
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
GetCurrencyModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCurrencyModel(  success: success ?? _success,
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

/// id : 5
/// currency_name : "Australian Dollar"
/// currency_symbol : "A$"
/// currency_code : "AUD"
/// created_at : "2023-05-23 16:19:37"
/// created_by : "1"
/// updated_at : "2023-05-23 16:19:37"
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? currencyName, 
      String? currencySymbol, 
      String? currencyCode, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _currencyName = currencyName;
    _currencySymbol = currencySymbol;
    _currencyCode = currencyCode;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _currencyName = json['currency_name'];
    _currencySymbol = json['currency_symbol'];
    _currencyCode = json['currency_code'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _currencyName;
  String? _currencySymbol;
  String? _currencyCode;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? currencyName,
  String? currencySymbol,
  String? currencyCode,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  currencyName: currencyName ?? _currencyName,
  currencySymbol: currencySymbol ?? _currencySymbol,
  currencyCode: currencyCode ?? _currencyCode,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get currencyName => _currencyName;
  String? get currencySymbol => _currencySymbol;
  String? get currencyCode => _currencyCode;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_name'] = _currencyName;
    map['currency_symbol'] = _currencySymbol;
    map['currency_code'] = _currencyCode;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}