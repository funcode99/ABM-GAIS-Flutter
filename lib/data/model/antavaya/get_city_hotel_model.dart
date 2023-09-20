class GetCityHotelModel {
  GetCityHotelModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetCityHotelModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetCityHotelModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetCityHotelModel(
        success: success ?? _success,
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
    List<Data2>? data,
    bool? isError,
    String? message,
    dynamic errorCode,
    dynamic warning,
  }) {
    _data = data;
    _isError = isError;
    _message = message;
    _errorCode = errorCode;
    _warning = warning;
  }

  Data.fromJson(dynamic json) {
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
    _isError = json['IsError'];
    _message = json['Message'];
    _errorCode = json['ErrorCode'];
    _warning = json['Warning'];
  }

  List<Data2>? _data;
  bool? _isError;
  String? _message;
  dynamic _errorCode;
  dynamic _warning;

  Data copyWith({
    List<Data2>? data,
    bool? isError,
    String? message,
    dynamic errorCode,
    dynamic warning,
  }) =>
      Data(
        data: data ?? _data,
        isError: isError ?? _isError,
        message: message ?? _message,
        errorCode: errorCode ?? _errorCode,
        warning: warning ?? _warning,
      );

  List<Data2>? get data => _data;

  bool? get isError => _isError;

  String? get message => _message;

  dynamic get errorCode => _errorCode;

  dynamic get warning => _warning;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['IsError'] = _isError;
    map['Message'] = _message;
    map['ErrorCode'] = _errorCode;
    map['Warning'] = _warning;
    return map;
  }
}

class Data2 {
  Data2({
    String? cityKey,
    String? cityName,
  }) {
    _cityKey = cityKey;
    _cityName = cityName;
  }

  Data2.fromJson(dynamic json) {
    _cityKey = json['CityKey'];
    _cityName = json['CityName'];
  }

  String? _cityKey;
  String? _cityName;

  Data2 copyWith({
    String? cityKey,
    String? cityName,
  }) =>
      Data2(
        cityKey: cityKey ?? _cityKey,
        cityName: cityName ?? _cityName,
      );

  String? get cityKey => _cityKey;

  String? get cityName => _cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CityKey'] = _cityKey;
    map['CityName'] = _cityName;
    return map;
  }
}
