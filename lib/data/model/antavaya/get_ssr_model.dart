class GetSsrModel {
  GetSsrModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetSsrModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetSsrModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetSsrModel(
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
    List<RsFlightSsrs>? rsFlightSsrs,
  }) {
    _rsFlightSsrs = rsFlightSsrs;
  }

  Data.fromJson(dynamic json) {
    if (json['RsFlightSsrs'] != null) {
      _rsFlightSsrs = [];
      json['RsFlightSsrs'].forEach((v) {
        _rsFlightSsrs?.add(RsFlightSsrs.fromJson(v));
      });
    }
  }

  List<RsFlightSsrs>? _rsFlightSsrs;

  Data copyWith({
    List<RsFlightSsrs>? rsFlightSsrs,
  }) =>
      Data(
        rsFlightSsrs: rsFlightSsrs ?? _rsFlightSsrs,
      );

  List<RsFlightSsrs>? get rsFlightSsrs => _rsFlightSsrs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_rsFlightSsrs != null) {
      map['RsFlightSsrs'] = _rsFlightSsrs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RsFlightSsrs {
  RsFlightSsrs({
    int? num,
    int? seq,
    int? airLine,
    String? flightId,
    String? flightNumber,
    String? classId,
    List<Ssrs>? ssrs,
  }) {
    _num = num;
    _seq = seq;
    _airLine = airLine;
    _flightId = flightId;
    _flightNumber = flightNumber;
    _classId = classId;
    _ssrs = ssrs;
  }

  RsFlightSsrs.fromJson(dynamic json) {
    _num = json['Num'];
    _seq = json['Seq'];
    _airLine = json['AirLine'];
    _flightId = json['FlightId'];
    _flightNumber = json['FlightNumber'];
    _classId = json['ClassId'];
    if (json['Ssrs'] != null) {
      _ssrs = [];
      json['Ssrs'].forEach((v) {
        _ssrs?.add(Ssrs.fromJson(v));
      });
    }
  }

  int? _num;
  int? _seq;
  int? _airLine;
  String? _flightId;
  String? _flightNumber;
  String? _classId;
  List<Ssrs>? _ssrs;

  RsFlightSsrs copyWith({
    int? num,
    int? seq,
    int? airLine,
    String? flightId,
    String? flightNumber,
    String? classId,
    List<Ssrs>? ssrs,
  }) =>
      RsFlightSsrs(
        num: num ?? _num,
        seq: seq ?? _seq,
        airLine: airLine ?? _airLine,
        flightId: flightId ?? _flightId,
        flightNumber: flightNumber ?? _flightNumber,
        classId: classId ?? _classId,
        ssrs: ssrs ?? _ssrs,
      );

  int? get num => _num;

  int? get seq => _seq;

  int? get airLine => _airLine;

  String? get flightId => _flightId;

  String? get flightNumber => _flightNumber;

  String? get classId => _classId;

  List<Ssrs>? get ssrs => _ssrs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Num'] = _num;
    map['Seq'] = _seq;
    map['AirLine'] = _airLine;
    map['FlightId'] = _flightId;
    map['FlightNumber'] = _flightNumber;
    map['ClassId'] = _classId;
    if (_ssrs != null) {
      map['Ssrs'] = _ssrs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Ssrs {
  Ssrs({
    String? ssrCode,
    String? originCode,
    String? destinationCode,
    int? ssrFare,
    String? ccy,
    String? ssrName,
    int? ssrType,
    String? flightNumber,
    dynamic paxType,
    String? quantity,
    dynamic image,
    dynamic shortDesc,
    dynamic longDesc,
    int? tax,
  }) {
    _ssrCode = ssrCode;
    _originCode = originCode;
    _destinationCode = destinationCode;
    _ssrFare = ssrFare;
    _ccy = ccy;
    _ssrName = ssrName;
    _ssrType = ssrType;
    _flightNumber = flightNumber;
    _paxType = paxType;
    _quantity = quantity;
    _image = image;
    _shortDesc = shortDesc;
    _longDesc = longDesc;
    _tax = tax;
  }

  Ssrs.fromJson(dynamic json) {
    _ssrCode = json['SsrCode'];
    _originCode = json['OriginCode'];
    _destinationCode = json['DestinationCode'];
    _ssrFare = json['SsrFare'];
    _ccy = json['Ccy'];
    _ssrName = json['SsrName'];
    _ssrType = json['SsrType'];
    _flightNumber = json['FlightNumber'];
    _paxType = json['PaxType'];
    _quantity = json['Quantity'];
    _image = json['Image'];
    _shortDesc = json['ShortDesc'];
    _longDesc = json['LongDesc'];
    _tax = json['Tax'];
  }

  String? _ssrCode;
  String? _originCode;
  String? _destinationCode;
  int? _ssrFare;
  String? _ccy;
  String? _ssrName;
  int? _ssrType;
  String? _flightNumber;
  dynamic _paxType;
  String? _quantity;
  dynamic _image;
  dynamic _shortDesc;
  dynamic _longDesc;
  int? _tax;

  Ssrs copyWith({
    String? ssrCode,
    String? originCode,
    String? destinationCode,
    int? ssrFare,
    String? ccy,
    String? ssrName,
    int? ssrType,
    String? flightNumber,
    dynamic paxType,
    String? quantity,
    dynamic image,
    dynamic shortDesc,
    dynamic longDesc,
    int? tax,
  }) =>
      Ssrs(
        ssrCode: ssrCode ?? _ssrCode,
        originCode: originCode ?? _originCode,
        destinationCode: destinationCode ?? _destinationCode,
        ssrFare: ssrFare ?? _ssrFare,
        ccy: ccy ?? _ccy,
        ssrName: ssrName ?? _ssrName,
        ssrType: ssrType ?? _ssrType,
        flightNumber: flightNumber ?? _flightNumber,
        paxType: paxType ?? _paxType,
        quantity: quantity ?? _quantity,
        image: image ?? _image,
        shortDesc: shortDesc ?? _shortDesc,
        longDesc: longDesc ?? _longDesc,
        tax: tax ?? _tax,
      );

  String? get ssrCode => _ssrCode;

  String? get originCode => _originCode;

  String? get destinationCode => _destinationCode;

  int? get ssrFare => _ssrFare;

  String? get ccy => _ccy;

  String? get ssrName => _ssrName;

  int? get ssrType => _ssrType;

  String? get flightNumber => _flightNumber;

  dynamic get paxType => _paxType;

  String? get quantity => _quantity;

  dynamic get image => _image;

  dynamic get shortDesc => _shortDesc;

  dynamic get longDesc => _longDesc;

  int? get tax => _tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SsrCode'] = _ssrCode;
    map['OriginCode'] = _originCode;
    map['DestinationCode'] = _destinationCode;
    map['SsrFare'] = _ssrFare;
    map['Ccy'] = _ccy;
    map['SsrName'] = _ssrName;
    map['SsrType'] = _ssrType;
    map['FlightNumber'] = _flightNumber;
    map['PaxType'] = _paxType;
    map['Quantity'] = _quantity;
    map['Image'] = _image;
    map['ShortDesc'] = _shortDesc;
    map['LongDesc'] = _longDesc;
    map['Tax'] = _tax;
    return map;
  }
}
