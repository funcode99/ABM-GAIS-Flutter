/// success : true
/// message : "Success Get Data"
/// data : [{"id_zona":1,"zona_name":"A"}]

class GetZonaByidModel {
  GetZonaByidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetZonaByidModel.fromJson(dynamic json) {
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
GetZonaByidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetZonaByidModel(  success: success ?? _success,
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

/// id_zona : 1
/// zona_name : "A"

class Data {
  Data({
      num? idZona, 
      String? zonaName,}){
    _idZona = idZona;
    _zonaName = zonaName;
}

  Data.fromJson(dynamic json) {
    _idZona = json['id_zona'];
    _zonaName = json['zona_name'];
  }
  num? _idZona;
  String? _zonaName;
Data copyWith({  num? idZona,
  String? zonaName,
}) => Data(  idZona: idZona ?? _idZona,
  zonaName: zonaName ?? _zonaName,
);
  num? get idZona => _idZona;
  String? get zonaName => _zonaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_zona'] = _idZona;
    map['zona_name'] = _zonaName;
    return map;
  }

}