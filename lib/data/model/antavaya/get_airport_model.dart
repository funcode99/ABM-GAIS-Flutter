class GetAirportModel {
  GetAirportModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAirportModel.fromJson(dynamic json) {
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
GetAirportModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetAirportModel(  success: success ?? _success,
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
      String? code, 
      String? cityName, 
      String? countryCode, 
      String? airportName, 
      num? locale, 
      bool? active, 
      bool? isNonGds, 
      bool? isGds, 
      dynamic forOverride,}){
    _code = code;
    _cityName = cityName;
    _countryCode = countryCode;
    _airportName = airportName;
    _locale = locale;
    _active = active;
    _isNonGds = isNonGds;
    _isGds = isGds;
    _forOverride = forOverride;
}

  Data.fromJson(dynamic json) {
    _code = json['Code'];
    _cityName = json['CityName'];
    _countryCode = json['CountryCode'];
    _airportName = json['AirportName'];
    _locale = json['Locale'];
    _active = json['Active'];
    _isNonGds = json['IsNonGds'];
    _isGds = json['IsGds'];
    _forOverride = json['ForOverride'];
  }
  String? _code;
  String? _cityName;
  String? _countryCode;
  String? _airportName;
  num? _locale;
  bool? _active;
  bool? _isNonGds;
  bool? _isGds;
  dynamic _forOverride;
Data copyWith({  String? code,
  String? cityName,
  String? countryCode,
  String? airportName,
  num? locale,
  bool? active,
  bool? isNonGds,
  bool? isGds,
  dynamic forOverride,
}) => Data(  code: code ?? _code,
  cityName: cityName ?? _cityName,
  countryCode: countryCode ?? _countryCode,
  airportName: airportName ?? _airportName,
  locale: locale ?? _locale,
  active: active ?? _active,
  isNonGds: isNonGds ?? _isNonGds,
  isGds: isGds ?? _isGds,
  forOverride: forOverride ?? _forOverride,
);
  String? get code => _code;
  String? get cityName => _cityName;
  String? get countryCode => _countryCode;
  String? get airportName => _airportName;
  num? get locale => _locale;
  bool? get active => _active;
  bool? get isNonGds => _isNonGds;
  bool? get isGds => _isGds;
  dynamic get forOverride => _forOverride;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['CityName'] = _cityName;
    map['CountryCode'] = _countryCode;
    map['AirportName'] = _airportName;
    map['Locale'] = _locale;
    map['Active'] = _active;
    map['IsNonGds'] = _isNonGds;
    map['IsGds'] = _isGds;
    map['ForOverride'] = _forOverride;
    return map;
  }

}