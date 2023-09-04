class GetAirportScheduleModel {
  GetAirportScheduleModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAirportScheduleModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAirportScheduleModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAirportScheduleModel(  success: success ?? _success,
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
      List<Schedules>? schedules, 
      List<AirportDetails>? airportDetails, 
      List<AirportV2Details>? airportV2Details,}){
    _schedules = schedules;
    _airportDetails = airportDetails;
    _airportV2Details = airportV2Details;
}

  Data.fromJson(dynamic json) {
    if (json['Schedules'] != null) {
      _schedules = [];
      json['Schedules'].forEach((v) {
        _schedules?.add(Schedules.fromJson(v));
      });
    }
    if (json['AirportDetails'] != null) {
      _airportDetails = [];
      json['AirportDetails'].forEach((v) {
        _airportDetails?.add(AirportDetails.fromJson(v));
      });
    }
    if (json['AirportV2Details'] != null) {
      _airportV2Details = [];
      json['AirportV2Details'].forEach((v) {
        _airportV2Details?.add(AirportV2Details.fromJson(v));
      });
    }
  }
  List<Schedules>? _schedules;
  List<AirportDetails>? _airportDetails;
  List<AirportV2Details>? _airportV2Details;
Data copyWith({  List<Schedules>? schedules,
  List<AirportDetails>? airportDetails,
  List<AirportV2Details>? airportV2Details,
}) => Data(  schedules: schedules ?? _schedules,
  airportDetails: airportDetails ?? _airportDetails,
  airportV2Details: airportV2Details ?? _airportV2Details,
);
  List<Schedules>? get schedules => _schedules;
  List<AirportDetails>? get airportDetails => _airportDetails;
  List<AirportV2Details>? get airportV2Details => _airportV2Details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_schedules != null) {
      map['Schedules'] = _schedules?.map((v) => v.toJson()).toList();
    }
    if (_airportDetails != null) {
      map['AirportDetails'] = _airportDetails?.map((v) => v.toJson()).toList();
    }
    if (_airportV2Details != null) {
      map['AirportV2Details'] = _airportV2Details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AirportV2Details {
  AirportV2Details({
      String? iata, 
      String? name, 
      String? city, 
      String? country, 
      String? countryName, 
      bool? isGds, 
      bool? isNonGds, 
      num? latitude, 
      num? longitude, 
      String? timeZoneZdb, 
      String? minOffset, 
      String? maxOffset,}){
    _iata = iata;
    _name = name;
    _city = city;
    _country = country;
    _countryName = countryName;
    _isGds = isGds;
    _isNonGds = isNonGds;
    _latitude = latitude;
    _longitude = longitude;
    _timeZoneZdb = timeZoneZdb;
    _minOffset = minOffset;
    _maxOffset = maxOffset;
}

  AirportV2Details.fromJson(dynamic json) {
    _iata = json['Iata'];
    _name = json['Name'];
    _city = json['City'];
    _country = json['Country'];
    _countryName = json['CountryName'];
    _isGds = json['IsGds'];
    _isNonGds = json['IsNonGds'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _timeZoneZdb = json['TimeZoneZdb'];
    _minOffset = json['MinOffset'];
    _maxOffset = json['MaxOffset'];
  }
  String? _iata;
  String? _name;
  String? _city;
  String? _country;
  String? _countryName;
  bool? _isGds;
  bool? _isNonGds;
  num? _latitude;
  num? _longitude;
  String? _timeZoneZdb;
  String? _minOffset;
  String? _maxOffset;
AirportV2Details copyWith({  String? iata,
  String? name,
  String? city,
  String? country,
  String? countryName,
  bool? isGds,
  bool? isNonGds,
  num? latitude,
  num? longitude,
  String? timeZoneZdb,
  String? minOffset,
  String? maxOffset,
}) => AirportV2Details(  iata: iata ?? _iata,
  name: name ?? _name,
  city: city ?? _city,
  country: country ?? _country,
  countryName: countryName ?? _countryName,
  isGds: isGds ?? _isGds,
  isNonGds: isNonGds ?? _isNonGds,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  timeZoneZdb: timeZoneZdb ?? _timeZoneZdb,
  minOffset: minOffset ?? _minOffset,
  maxOffset: maxOffset ?? _maxOffset,
);
  String? get iata => _iata;
  String? get name => _name;
  String? get city => _city;
  String? get country => _country;
  String? get countryName => _countryName;
  bool? get isGds => _isGds;
  bool? get isNonGds => _isNonGds;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  String? get timeZoneZdb => _timeZoneZdb;
  String? get minOffset => _minOffset;
  String? get maxOffset => _maxOffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Iata'] = _iata;
    map['Name'] = _name;
    map['City'] = _city;
    map['Country'] = _country;
    map['CountryName'] = _countryName;
    map['IsGds'] = _isGds;
    map['IsNonGds'] = _isNonGds;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['TimeZoneZdb'] = _timeZoneZdb;
    map['MinOffset'] = _minOffset;
    map['MaxOffset'] = _maxOffset;
    return map;
  }

}

class AirportDetails {
  AirportDetails({
      String? code, 
      String? countryCode, 
      String? cityName, 
      String? airportName, 
      num? locale, 
      bool? active, 
      String? countryName, 
      bool? isNonGds, 
      bool? isGds, 
      dynamic forOverride, 
      String? localView,}){
    _code = code;
    _countryCode = countryCode;
    _cityName = cityName;
    _airportName = airportName;
    _locale = locale;
    _active = active;
    _countryName = countryName;
    _isNonGds = isNonGds;
    _isGds = isGds;
    _forOverride = forOverride;
    _localView = localView;
}

  AirportDetails.fromJson(dynamic json) {
    _code = json['Code'];
    _countryCode = json['CountryCode'];
    _cityName = json['CityName'];
    _airportName = json['AirportName'];
    _locale = json['Locale'];
    _active = json['Active'];
    _countryName = json['CountryName'];
    _isNonGds = json['IsNonGds'];
    _isGds = json['IsGds'];
    _forOverride = json['ForOverride'];
    _localView = json['LocalView'];
  }
  String? _code;
  String? _countryCode;
  String? _cityName;
  String? _airportName;
  num? _locale;
  bool? _active;
  String? _countryName;
  bool? _isNonGds;
  bool? _isGds;
  dynamic _forOverride;
  String? _localView;
AirportDetails copyWith({  String? code,
  String? countryCode,
  String? cityName,
  String? airportName,
  num? locale,
  bool? active,
  String? countryName,
  bool? isNonGds,
  bool? isGds,
  dynamic forOverride,
  String? localView,
}) => AirportDetails(  code: code ?? _code,
  countryCode: countryCode ?? _countryCode,
  cityName: cityName ?? _cityName,
  airportName: airportName ?? _airportName,
  locale: locale ?? _locale,
  active: active ?? _active,
  countryName: countryName ?? _countryName,
  isNonGds: isNonGds ?? _isNonGds,
  isGds: isGds ?? _isGds,
  forOverride: forOverride ?? _forOverride,
  localView: localView ?? _localView,
);
  String? get code => _code;
  String? get countryCode => _countryCode;
  String? get cityName => _cityName;
  String? get airportName => _airportName;
  num? get locale => _locale;
  bool? get active => _active;
  String? get countryName => _countryName;
  bool? get isNonGds => _isNonGds;
  bool? get isGds => _isGds;
  dynamic get forOverride => _forOverride;
  String? get localView => _localView;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['CountryCode'] = _countryCode;
    map['CityName'] = _cityName;
    map['AirportName'] = _airportName;
    map['Locale'] = _locale;
    map['Active'] = _active;
    map['CountryName'] = _countryName;
    map['IsNonGds'] = _isNonGds;
    map['IsGds'] = _isGds;
    map['ForOverride'] = _forOverride;
    map['LocalView'] = _localView;
    return map;
  }

}

class Schedules {
  Schedules({
      String? origin, 
      String? destination, 
      bool? isInternational, 
      List<Flights>? flights, 
      num? haveUpdate,}){
    _origin = origin;
    _destination = destination;
    _isInternational = isInternational;
    _flights = flights;
    _haveUpdate = haveUpdate;
}

  Schedules.fromJson(dynamic json) {
    _origin = json['Origin'];
    _destination = json['Destination'];
    _isInternational = json['IsInternational'];
    if (json['Flights'] != null) {
      _flights = [];
      json['Flights'].forEach((v) {
        _flights?.add(Flights.fromJson(v));
      });
    }
    _haveUpdate = json['HaveUpdate'];
  }
  String? _origin;
  String? _destination;
  bool? _isInternational;
  List<Flights>? _flights;
  num? _haveUpdate;
Schedules copyWith({  String? origin,
  String? destination,
  bool? isInternational,
  List<Flights>? flights,
  num? haveUpdate,
}) => Schedules(  origin: origin ?? _origin,
  destination: destination ?? _destination,
  isInternational: isInternational ?? _isInternational,
  flights: flights ?? _flights,
  haveUpdate: haveUpdate ?? _haveUpdate,
);
  String? get origin => _origin;
  String? get destination => _destination;
  bool? get isInternational => _isInternational;
  List<Flights>? get flights => _flights;
  num? get haveUpdate => _haveUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Origin'] = _origin;
    map['Destination'] = _destination;
    map['IsInternational'] = _isInternational;
    if (_flights != null) {
      map['Flights'] = _flights?.map((v) => v.toJson()).toList();
    }
    map['HaveUpdate'] = _haveUpdate;
    return map;
  }

}

class Flights {
  Flights({
      String? id, 
      dynamic groupingId, 
      num? airline, 
      String? airlineImageUrl, 
      String? airlineName, 
      String? number, 
      dynamic operatingNumber, 
      dynamic operatingAirlineImageUrl, 
      dynamic operatingAirlineName, 
      String? origin, 
      dynamic originTerminal, 
      String? destination, 
      dynamic destinationTerminal, 
      num? fare, 
      dynamic fareType, 
      bool? isMultiClass, 
      bool? isConnecting, 
      bool? isAvailable, 
      String? flightType, 
      String? departDate, 
      String? departTime, 
      String? arriveDate, 
      String? arriveTime, 
      String? duration, 
      num? totalTransit, 
      List<ClassObjects>? classObjects, 
      List<ConnectingFlights>? connectingFlights, 
      dynamic fareBreakdowns, 
      dynamic facilities, 
      dynamic priceFare, 
      bool? isOpenJawTransit, 
      dynamic note, 
      dynamic aircraft, 
      dynamic extraData,}){
    _id = id;
    _groupingId = groupingId;
    _airline = airline;
    _airlineImageUrl = airlineImageUrl;
    _airlineName = airlineName;
    _number = number;
    _operatingNumber = operatingNumber;
    _operatingAirlineImageUrl = operatingAirlineImageUrl;
    _operatingAirlineName = operatingAirlineName;
    _origin = origin;
    _originTerminal = originTerminal;
    _destination = destination;
    _destinationTerminal = destinationTerminal;
    _fare = fare;
    _fareType = fareType;
    _isMultiClass = isMultiClass;
    _isConnecting = isConnecting;
    _isAvailable = isAvailable;
    _flightType = flightType;
    _departDate = departDate;
    _departTime = departTime;
    _arriveDate = arriveDate;
    _arriveTime = arriveTime;
    _duration = duration;
    _totalTransit = totalTransit;
    _classObjects = classObjects;
    _connectingFlights = connectingFlights;
    _fareBreakdowns = fareBreakdowns;
    _facilities = facilities;
    _priceFare = priceFare;
    _isOpenJawTransit = isOpenJawTransit;
    _note = note;
    _aircraft = aircraft;
    _extraData = extraData;
}

  Flights.fromJson(dynamic json) {
    _id = json['Id'];
    _groupingId = json['GroupingId'];
    _airline = json['Airline'];
    _airlineImageUrl = json['AirlineImageUrl'];
    _airlineName = json['AirlineName'];
    _number = json['Number'];
    _operatingNumber = json['OperatingNumber'];
    _operatingAirlineImageUrl = json['OperatingAirlineImageUrl'];
    _operatingAirlineName = json['OperatingAirlineName'];
    _origin = json['Origin'];
    _originTerminal = json['OriginTerminal'];
    _destination = json['Destination'];
    _destinationTerminal = json['DestinationTerminal'];
    _fare = json['Fare'];
    _fareType = json['FareType'];
    _isMultiClass = json['IsMultiClass'];
    _isConnecting = json['IsConnecting'];
    _isAvailable = json['IsAvailable'];
    _flightType = json['FlightType'];
    _departDate = json['DepartDate'];
    _departTime = json['DepartTime'];
    _arriveDate = json['ArriveDate'];
    _arriveTime = json['ArriveTime'];
    _duration = json['Duration'];
    _totalTransit = json['TotalTransit'];
    if (json['ClassObjects'] != null) {
      _classObjects = [];
      json['ClassObjects'].forEach((v) {
        _classObjects?.add(ClassObjects.fromJson(v));
      });
    }
    if (json['ConnectingFlights'] != null) {
      _connectingFlights = [];
      json['ConnectingFlights'].forEach((v) {
        _connectingFlights?.add(ConnectingFlights.fromJson(v));
      });
    }
    _fareBreakdowns = json['FareBreakdowns'];
    _facilities = json['Facilities'];
    _priceFare = json['PriceFare'];
    _isOpenJawTransit = json['IsOpenJawTransit'];
    _note = json['Note'];
    _aircraft = json['Aircraft'];
    _extraData = json['ExtraData'];
  }
  String? _id;
  dynamic _groupingId;
  num? _airline;
  String? _airlineImageUrl;
  String? _airlineName;
  String? _number;
  dynamic _operatingNumber;
  dynamic _operatingAirlineImageUrl;
  dynamic _operatingAirlineName;
  String? _origin;
  dynamic _originTerminal;
  String? _destination;
  dynamic _destinationTerminal;
  num? _fare;
  dynamic _fareType;
  bool? _isMultiClass;
  bool? _isConnecting;
  bool? _isAvailable;
  String? _flightType;
  String? _departDate;
  String? _departTime;
  String? _arriveDate;
  String? _arriveTime;
  String? _duration;
  num? _totalTransit;
  List<ClassObjects>? _classObjects;
  List<ConnectingFlights>? _connectingFlights;
  dynamic _fareBreakdowns;
  dynamic _facilities;
  dynamic _priceFare;
  bool? _isOpenJawTransit;
  dynamic _note;
  dynamic _aircraft;
  dynamic _extraData;
Flights copyWith({  String? id,
  dynamic groupingId,
  num? airline,
  String? airlineImageUrl,
  String? airlineName,
  String? number,
  dynamic operatingNumber,
  dynamic operatingAirlineImageUrl,
  dynamic operatingAirlineName,
  String? origin,
  dynamic originTerminal,
  String? destination,
  dynamic destinationTerminal,
  num? fare,
  dynamic fareType,
  bool? isMultiClass,
  bool? isConnecting,
  bool? isAvailable,
  String? flightType,
  String? departDate,
  String? departTime,
  String? arriveDate,
  String? arriveTime,
  String? duration,
  num? totalTransit,
  List<ClassObjects>? classObjects,
  List<ConnectingFlights>? connectingFlights,
  dynamic fareBreakdowns,
  dynamic facilities,
  dynamic priceFare,
  bool? isOpenJawTransit,
  dynamic note,
  dynamic aircraft,
  dynamic extraData,
}) => Flights(  id: id ?? _id,
  groupingId: groupingId ?? _groupingId,
  airline: airline ?? _airline,
  airlineImageUrl: airlineImageUrl ?? _airlineImageUrl,
  airlineName: airlineName ?? _airlineName,
  number: number ?? _number,
  operatingNumber: operatingNumber ?? _operatingNumber,
  operatingAirlineImageUrl: operatingAirlineImageUrl ?? _operatingAirlineImageUrl,
  operatingAirlineName: operatingAirlineName ?? _operatingAirlineName,
  origin: origin ?? _origin,
  originTerminal: originTerminal ?? _originTerminal,
  destination: destination ?? _destination,
  destinationTerminal: destinationTerminal ?? _destinationTerminal,
  fare: fare ?? _fare,
  fareType: fareType ?? _fareType,
  isMultiClass: isMultiClass ?? _isMultiClass,
  isConnecting: isConnecting ?? _isConnecting,
  isAvailable: isAvailable ?? _isAvailable,
  flightType: flightType ?? _flightType,
  departDate: departDate ?? _departDate,
  departTime: departTime ?? _departTime,
  arriveDate: arriveDate ?? _arriveDate,
  arriveTime: arriveTime ?? _arriveTime,
  duration: duration ?? _duration,
  totalTransit: totalTransit ?? _totalTransit,
  classObjects: classObjects ?? _classObjects,
  connectingFlights: connectingFlights ?? _connectingFlights,
  fareBreakdowns: fareBreakdowns ?? _fareBreakdowns,
  facilities: facilities ?? _facilities,
  priceFare: priceFare ?? _priceFare,
  isOpenJawTransit: isOpenJawTransit ?? _isOpenJawTransit,
  note: note ?? _note,
  aircraft: aircraft ?? _aircraft,
  extraData: extraData ?? _extraData,
);
  String? get id => _id;
  dynamic get groupingId => _groupingId;
  num? get airline => _airline;
  String? get airlineImageUrl => _airlineImageUrl;
  String? get airlineName => _airlineName;
  String? get number => _number;
  dynamic get operatingNumber => _operatingNumber;
  dynamic get operatingAirlineImageUrl => _operatingAirlineImageUrl;
  dynamic get operatingAirlineName => _operatingAirlineName;
  String? get origin => _origin;
  dynamic get originTerminal => _originTerminal;
  String? get destination => _destination;
  dynamic get destinationTerminal => _destinationTerminal;
  num? get fare => _fare;
  dynamic get fareType => _fareType;
  bool? get isMultiClass => _isMultiClass;
  bool? get isConnecting => _isConnecting;
  bool? get isAvailable => _isAvailable;
  String? get flightType => _flightType;
  String? get departDate => _departDate;
  String? get departTime => _departTime;
  String? get arriveDate => _arriveDate;
  String? get arriveTime => _arriveTime;
  String? get duration => _duration;
  num? get totalTransit => _totalTransit;
  List<ClassObjects>? get classObjects => _classObjects;
  List<ConnectingFlights>? get connectingFlights => _connectingFlights;
  dynamic get fareBreakdowns => _fareBreakdowns;
  dynamic get facilities => _facilities;
  dynamic get priceFare => _priceFare;
  bool? get isOpenJawTransit => _isOpenJawTransit;
  dynamic get note => _note;
  dynamic get aircraft => _aircraft;
  dynamic get extraData => _extraData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['GroupingId'] = _groupingId;
    map['Airline'] = _airline;
    map['AirlineImageUrl'] = _airlineImageUrl;
    map['AirlineName'] = _airlineName;
    map['Number'] = _number;
    map['OperatingNumber'] = _operatingNumber;
    map['OperatingAirlineImageUrl'] = _operatingAirlineImageUrl;
    map['OperatingAirlineName'] = _operatingAirlineName;
    map['Origin'] = _origin;
    map['OriginTerminal'] = _originTerminal;
    map['Destination'] = _destination;
    map['DestinationTerminal'] = _destinationTerminal;
    map['Fare'] = _fare;
    map['FareType'] = _fareType;
    map['IsMultiClass'] = _isMultiClass;
    map['IsConnecting'] = _isConnecting;
    map['IsAvailable'] = _isAvailable;
    map['FlightType'] = _flightType;
    map['DepartDate'] = _departDate;
    map['DepartTime'] = _departTime;
    map['ArriveDate'] = _arriveDate;
    map['ArriveTime'] = _arriveTime;
    map['Duration'] = _duration;
    map['TotalTransit'] = _totalTransit;
    if (_classObjects != null) {
      map['ClassObjects'] = _classObjects?.map((v) => v.toJson()).toList();
    }
    if (_connectingFlights != null) {
      map['ConnectingFlights'] = _connectingFlights?.map((v) => v.toJson()).toList();
    }
    map['FareBreakdowns'] = _fareBreakdowns;
    map['Facilities'] = _facilities;
    map['PriceFare'] = _priceFare;
    map['IsOpenJawTransit'] = _isOpenJawTransit;
    map['Note'] = _note;
    map['Aircraft'] = _aircraft;
    map['ExtraData'] = _extraData;
    return map;
  }

}

class ConnectingFlights {
  ConnectingFlights({
      String? id, 
      dynamic groupingId, 
      num? airline, 
      String? airlineImageUrl, 
      String? airlineName, 
      String? number, 
      dynamic operatingNumber, 
      dynamic operatingAirlineImageUrl, 
      dynamic operatingAirlineName, 
      String? origin, 
      dynamic originTerminal, 
      String? destination, 
      dynamic destinationTerminal, 
      num? fare, 
      dynamic fareType, 
      bool? isMultiClass, 
      bool? isConnecting, 
      bool? isAvailable, 
      String? flightType, 
      String? departDate, 
      String? departTime, 
      String? arriveDate, 
      String? arriveTime, 
      String? duration, 
      num? totalTransit, 
      List<ClassObjects>? classObjects, 
      dynamic fareBreakdowns, 
      dynamic facilities, 
      dynamic priceFare, 
      bool? isOpenJawTransit, 
      dynamic note, 
      dynamic aircraft, 
      dynamic extraData,}){
    _id = id;
    _groupingId = groupingId;
    _airline = airline;
    _airlineImageUrl = airlineImageUrl;
    _airlineName = airlineName;
    _number = number;
    _operatingNumber = operatingNumber;
    _operatingAirlineImageUrl = operatingAirlineImageUrl;
    _operatingAirlineName = operatingAirlineName;
    _origin = origin;
    _originTerminal = originTerminal;
    _destination = destination;
    _destinationTerminal = destinationTerminal;
    _fare = fare;
    _fareType = fareType;
    _isMultiClass = isMultiClass;
    _isConnecting = isConnecting;
    _isAvailable = isAvailable;
    _flightType = flightType;
    _departDate = departDate;
    _departTime = departTime;
    _arriveDate = arriveDate;
    _arriveTime = arriveTime;
    _duration = duration;
    _totalTransit = totalTransit;
    _classObjects = classObjects;
    _fareBreakdowns = fareBreakdowns;
    _facilities = facilities;
    _priceFare = priceFare;
    _isOpenJawTransit = isOpenJawTransit;
    _note = note;
    _aircraft = aircraft;
    _extraData = extraData;
}

  ConnectingFlights.fromJson(dynamic json) {
    _id = json['Id'];
    _groupingId = json['GroupingId'];
    _airline = json['Airline'];
    _airlineImageUrl = json['AirlineImageUrl'];
    _airlineName = json['AirlineName'];
    _number = json['Number'];
    _operatingNumber = json['OperatingNumber'];
    _operatingAirlineImageUrl = json['OperatingAirlineImageUrl'];
    _operatingAirlineName = json['OperatingAirlineName'];
    _origin = json['Origin'];
    _originTerminal = json['OriginTerminal'];
    _destination = json['Destination'];
    _destinationTerminal = json['DestinationTerminal'];
    _fare = json['Fare'];
    _fareType = json['FareType'];
    _isMultiClass = json['IsMultiClass'];
    _isConnecting = json['IsConnecting'];
    _isAvailable = json['IsAvailable'];
    _flightType = json['FlightType'];
    _departDate = json['DepartDate'];
    _departTime = json['DepartTime'];
    _arriveDate = json['ArriveDate'];
    _arriveTime = json['ArriveTime'];
    _duration = json['Duration'];
    _totalTransit = json['TotalTransit'];
    if (json['ClassObjects'] != null) {
      _classObjects = [];
      json['ClassObjects'].forEach((v) {
        _classObjects?.add(ClassObjects.fromJson(v));
      });
    }
    _fareBreakdowns = json['FareBreakdowns'];
    _facilities = json['Facilities'];
    _priceFare = json['PriceFare'];
    _isOpenJawTransit = json['IsOpenJawTransit'];
    _note = json['Note'];
    _aircraft = json['Aircraft'];
    _extraData = json['ExtraData'];
  }
  String? _id;
  dynamic _groupingId;
  num? _airline;
  String? _airlineImageUrl;
  String? _airlineName;
  String? _number;
  dynamic _operatingNumber;
  dynamic _operatingAirlineImageUrl;
  dynamic _operatingAirlineName;
  String? _origin;
  dynamic _originTerminal;
  String? _destination;
  dynamic _destinationTerminal;
  num? _fare;
  dynamic _fareType;
  bool? _isMultiClass;
  bool? _isConnecting;
  bool? _isAvailable;
  String? _flightType;
  String? _departDate;
  String? _departTime;
  String? _arriveDate;
  String? _arriveTime;
  String? _duration;
  num? _totalTransit;
  List<ClassObjects>? _classObjects;
  dynamic _fareBreakdowns;
  dynamic _facilities;
  dynamic _priceFare;
  bool? _isOpenJawTransit;
  dynamic _note;
  dynamic _aircraft;
  dynamic _extraData;
ConnectingFlights copyWith({  String? id,
  dynamic groupingId,
  num? airline,
  String? airlineImageUrl,
  String? airlineName,
  String? number,
  dynamic operatingNumber,
  dynamic operatingAirlineImageUrl,
  dynamic operatingAirlineName,
  String? origin,
  dynamic originTerminal,
  String? destination,
  dynamic destinationTerminal,
  num? fare,
  dynamic fareType,
  bool? isMultiClass,
  bool? isConnecting,
  bool? isAvailable,
  String? flightType,
  String? departDate,
  String? departTime,
  String? arriveDate,
  String? arriveTime,
  String? duration,
  num? totalTransit,
  List<ClassObjects>? classObjects,
  dynamic fareBreakdowns,
  dynamic facilities,
  dynamic priceFare,
  bool? isOpenJawTransit,
  dynamic note,
  dynamic aircraft,
  dynamic extraData,
}) => ConnectingFlights(  id: id ?? _id,
  groupingId: groupingId ?? _groupingId,
  airline: airline ?? _airline,
  airlineImageUrl: airlineImageUrl ?? _airlineImageUrl,
  airlineName: airlineName ?? _airlineName,
  number: number ?? _number,
  operatingNumber: operatingNumber ?? _operatingNumber,
  operatingAirlineImageUrl: operatingAirlineImageUrl ?? _operatingAirlineImageUrl,
  operatingAirlineName: operatingAirlineName ?? _operatingAirlineName,
  origin: origin ?? _origin,
  originTerminal: originTerminal ?? _originTerminal,
  destination: destination ?? _destination,
  destinationTerminal: destinationTerminal ?? _destinationTerminal,
  fare: fare ?? _fare,
  fareType: fareType ?? _fareType,
  isMultiClass: isMultiClass ?? _isMultiClass,
  isConnecting: isConnecting ?? _isConnecting,
  isAvailable: isAvailable ?? _isAvailable,
  flightType: flightType ?? _flightType,
  departDate: departDate ?? _departDate,
  departTime: departTime ?? _departTime,
  arriveDate: arriveDate ?? _arriveDate,
  arriveTime: arriveTime ?? _arriveTime,
  duration: duration ?? _duration,
  totalTransit: totalTransit ?? _totalTransit,
  classObjects: classObjects ?? _classObjects,
  fareBreakdowns: fareBreakdowns ?? _fareBreakdowns,
  facilities: facilities ?? _facilities,
  priceFare: priceFare ?? _priceFare,
  isOpenJawTransit: isOpenJawTransit ?? _isOpenJawTransit,
  note: note ?? _note,
  aircraft: aircraft ?? _aircraft,
  extraData: extraData ?? _extraData,
);
  String? get id => _id;
  dynamic get groupingId => _groupingId;
  num? get airline => _airline;
  String? get airlineImageUrl => _airlineImageUrl;
  String? get airlineName => _airlineName;
  String? get number => _number;
  dynamic get operatingNumber => _operatingNumber;
  dynamic get operatingAirlineImageUrl => _operatingAirlineImageUrl;
  dynamic get operatingAirlineName => _operatingAirlineName;
  String? get origin => _origin;
  dynamic get originTerminal => _originTerminal;
  String? get destination => _destination;
  dynamic get destinationTerminal => _destinationTerminal;
  num? get fare => _fare;
  dynamic get fareType => _fareType;
  bool? get isMultiClass => _isMultiClass;
  bool? get isConnecting => _isConnecting;
  bool? get isAvailable => _isAvailable;
  String? get flightType => _flightType;
  String? get departDate => _departDate;
  String? get departTime => _departTime;
  String? get arriveDate => _arriveDate;
  String? get arriveTime => _arriveTime;
  String? get duration => _duration;
  num? get totalTransit => _totalTransit;
  List<ClassObjects>? get classObjects => _classObjects;
  dynamic get fareBreakdowns => _fareBreakdowns;
  dynamic get facilities => _facilities;
  dynamic get priceFare => _priceFare;
  bool? get isOpenJawTransit => _isOpenJawTransit;
  dynamic get note => _note;
  dynamic get aircraft => _aircraft;
  dynamic get extraData => _extraData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['GroupingId'] = _groupingId;
    map['Airline'] = _airline;
    map['AirlineImageUrl'] = _airlineImageUrl;
    map['AirlineName'] = _airlineName;
    map['Number'] = _number;
    map['OperatingNumber'] = _operatingNumber;
    map['OperatingAirlineImageUrl'] = _operatingAirlineImageUrl;
    map['OperatingAirlineName'] = _operatingAirlineName;
    map['Origin'] = _origin;
    map['OriginTerminal'] = _originTerminal;
    map['Destination'] = _destination;
    map['DestinationTerminal'] = _destinationTerminal;
    map['Fare'] = _fare;
    map['FareType'] = _fareType;
    map['IsMultiClass'] = _isMultiClass;
    map['IsConnecting'] = _isConnecting;
    map['IsAvailable'] = _isAvailable;
    map['FlightType'] = _flightType;
    map['DepartDate'] = _departDate;
    map['DepartTime'] = _departTime;
    map['ArriveDate'] = _arriveDate;
    map['ArriveTime'] = _arriveTime;
    map['Duration'] = _duration;
    map['TotalTransit'] = _totalTransit;
    if (_classObjects != null) {
      map['ClassObjects'] = _classObjects?.map((v) => v.toJson()).toList();
    }
    map['FareBreakdowns'] = _fareBreakdowns;
    map['Facilities'] = _facilities;
    map['PriceFare'] = _priceFare;
    map['IsOpenJawTransit'] = _isOpenJawTransit;
    map['Note'] = _note;
    map['Aircraft'] = _aircraft;
    map['ExtraData'] = _extraData;
    return map;
  }

}

class ClassObjects {
  ClassObjects({
      String? id, 
      String? flightId, 
      String? code, 
      String? category, 
      num? seat, 
      num? fare, 
      num? tax, 
      dynamic fareBasisCode, 
      dynamic fareRuleKeys, 
      dynamic segmentSellKey, 
      String? extraData, 
      num? variant, 
      String? classGroupId, 
      String? transitTime,}){
    _id = id;
    _flightId = flightId;
    _code = code;
    _category = category;
    _seat = seat;
    _fare = fare;
    _tax = tax;
    _fareBasisCode = fareBasisCode;
    _fareRuleKeys = fareRuleKeys;
    _segmentSellKey = segmentSellKey;
    _extraData = extraData;
    _variant = variant;
    _classGroupId = classGroupId;
    _transitTime = transitTime;
}

  ClassObjects.fromJson(dynamic json) {
    _id = json['Id'];
    _flightId = json['FlightId'];
    _code = json['Code'];
    _category = json['Category'];
    _seat = json['Seat'];
    _fare = json['Fare'];
    _tax = json['Tax'];
    _fareBasisCode = json['FareBasisCode'];
    _fareRuleKeys = json['FareRuleKeys'];
    _segmentSellKey = json['SegmentSellKey'];
    _extraData = json['ExtraData'];
    _variant = json['Variant'];
    _classGroupId = json['ClassGroupId'];
    _transitTime = json['TransitTime'];
  }
  String? _id;
  String? _flightId;
  String? _code;
  String? _category;
  num? _seat;
  num? _fare;
  num? _tax;
  dynamic _fareBasisCode;
  dynamic _fareRuleKeys;
  dynamic _segmentSellKey;
  String? _extraData;
  num? _variant;
  String? _classGroupId;
  String? _transitTime;
ClassObjects copyWith({  String? id,
  String? flightId,
  String? code,
  String? category,
  num? seat,
  num? fare,
  num? tax,
  dynamic fareBasisCode,
  dynamic fareRuleKeys,
  dynamic segmentSellKey,
  String? extraData,
  num? variant,
  String? classGroupId,
  String? transitTime,
}) => ClassObjects(  id: id ?? _id,
  flightId: flightId ?? _flightId,
  code: code ?? _code,
  category: category ?? _category,
  seat: seat ?? _seat,
  fare: fare ?? _fare,
  tax: tax ?? _tax,
  fareBasisCode: fareBasisCode ?? _fareBasisCode,
  fareRuleKeys: fareRuleKeys ?? _fareRuleKeys,
  segmentSellKey: segmentSellKey ?? _segmentSellKey,
  extraData: extraData ?? _extraData,
  variant: variant ?? _variant,
  classGroupId: classGroupId ?? _classGroupId,
  transitTime: transitTime ?? _transitTime,
);
  String? get id => _id;
  String? get flightId => _flightId;
  String? get code => _code;
  String? get category => _category;
  num? get seat => _seat;
  num? get fare => _fare;
  num? get tax => _tax;
  dynamic get fareBasisCode => _fareBasisCode;
  dynamic get fareRuleKeys => _fareRuleKeys;
  dynamic get segmentSellKey => _segmentSellKey;
  String? get extraData => _extraData;
  num? get variant => _variant;
  String? get classGroupId => _classGroupId;
  String? get transitTime => _transitTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['FlightId'] = _flightId;
    map['Code'] = _code;
    map['Category'] = _category;
    map['Seat'] = _seat;
    map['Fare'] = _fare;
    map['Tax'] = _tax;
    map['FareBasisCode'] = _fareBasisCode;
    map['FareRuleKeys'] = _fareRuleKeys;
    map['SegmentSellKey'] = _segmentSellKey;
    map['ExtraData'] = _extraData;
    map['Variant'] = _variant;
    map['ClassGroupId'] = _classGroupId;
    map['TransitTime'] = _transitTime;
    return map;
  }

}

