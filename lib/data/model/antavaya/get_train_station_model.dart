class GetTrainStationModel {
  GetTrainStationModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTrainStationModel.fromJson(dynamic json) {
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
GetTrainStationModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTrainStationModel(  success: success ?? _success,
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
      String? stationName, 
      String? stationCode, 
      String? cityName,}){
    _stationName = stationName;
    _stationCode = stationCode;
    _cityName = cityName;
}

  Data.fromJson(dynamic json) {
    _stationName = json['StationName'];
    _stationCode = json['StationCode'];
    _cityName = json['CityName'];
  }
  String? _stationName;
  String? _stationCode;
  String? _cityName;
Data copyWith({  String? stationName,
  String? stationCode,
  String? cityName,
}) => Data(  stationName: stationName ?? _stationName,
  stationCode: stationCode ?? _stationCode,
  cityName: cityName ?? _cityName,
);
  String? get stationName => _stationName;
  String? get stationCode => _stationCode;
  String? get cityName => _cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StationName'] = _stationName;
    map['StationCode'] = _stationCode;
    map['CityName'] = _cityName;
    return map;
  }

}