class GetCountryHotelModel {
  GetCountryHotelModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetCountryHotelModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetCountryHotelModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetCountryHotelModel(
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
    String? isoCountryCode,
    String? countryName,
  }) {
    _isoCountryCode = isoCountryCode;
    _countryName = countryName;
  }

  Data2.fromJson(dynamic json) {
    _isoCountryCode = json['IsoCountryCode'];
    _countryName = json['CountryName'];
  }

  String? _isoCountryCode;
  String? _countryName;

  Data2 copyWith({
    String? isoCountryCode,
    String? countryName,
  }) =>
      Data2(
        isoCountryCode: isoCountryCode ?? _isoCountryCode,
        countryName: countryName ?? _countryName,
      );

  String? get isoCountryCode => _isoCountryCode;

  String? get countryName => _countryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsoCountryCode'] = _isoCountryCode;
    map['CountryName'] = _countryName;
    return map;
  }
}
