class GetTrainScheduleModel {
  GetTrainScheduleModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetTrainScheduleModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetTrainScheduleModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetTrainScheduleModel(
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
    List<Schedules>? schedules,
    List<StationDetails>? stationDetails,
  }) {
    _schedules = schedules;
    _stationDetails = stationDetails;
  }

  Data.fromJson(dynamic json) {
    if (json['Schedules'] != null) {
      _schedules = [];
      json['Schedules'].forEach((v) {
        _schedules?.add(Schedules.fromJson(v));
      });
    }
    if (json['StationDetails'] != null) {
      _stationDetails = [];
      json['StationDetails'].forEach((v) {
        _stationDetails?.add(StationDetails.fromJson(v));
      });
    }
  }

  List<Schedules>? _schedules;
  List<StationDetails>? _stationDetails;

  Data copyWith({
    List<Schedules>? schedules,
    List<StationDetails>? stationDetails,
  }) =>
      Data(
        schedules: schedules ?? _schedules,
        stationDetails: stationDetails ?? _stationDetails,
      );

  List<Schedules>? get schedules => _schedules;

  List<StationDetails>? get stationDetails => _stationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_schedules != null) {
      map['Schedules'] = _schedules?.map((v) => v.toJson()).toList();
    }
    if (_stationDetails != null) {
      map['StationDetails'] = _stationDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class StationDetails {
  StationDetails({
    String? code,
    String? countryCode,
    String? cityName,
    String? stationName,
    num? locale,
    bool? active,
    String? countryName,
    String? localView,
  }) {
    _code = code;
    _countryCode = countryCode;
    _cityName = cityName;
    _stationName = stationName;
    _locale = locale;
    _active = active;
    _countryName = countryName;
    _localView = localView;
  }

  StationDetails.fromJson(dynamic json) {
    _code = json['Code'];
    _countryCode = json['CountryCode'];
    _cityName = json['CityName'];
    _stationName = json['StationName'];
    _locale = json['Locale'];
    _active = json['Active'];
    _countryName = json['CountryName'];
    _localView = json['LocalView'];
  }

  String? _code;
  String? _countryCode;
  String? _cityName;
  String? _stationName;
  num? _locale;
  bool? _active;
  String? _countryName;
  String? _localView;

  StationDetails copyWith({
    String? code,
    String? countryCode,
    String? cityName,
    String? stationName,
    num? locale,
    bool? active,
    String? countryName,
    String? localView,
  }) =>
      StationDetails(
        code: code ?? _code,
        countryCode: countryCode ?? _countryCode,
        cityName: cityName ?? _cityName,
        stationName: stationName ?? _stationName,
        locale: locale ?? _locale,
        active: active ?? _active,
        countryName: countryName ?? _countryName,
        localView: localView ?? _localView,
      );

  String? get code => _code;

  String? get countryCode => _countryCode;

  String? get cityName => _cityName;

  String? get stationName => _stationName;

  num? get locale => _locale;

  bool? get active => _active;

  String? get countryName => _countryName;

  String? get localView => _localView;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['CountryCode'] = _countryCode;
    map['CityName'] = _cityName;
    map['StationName'] = _stationName;
    map['Locale'] = _locale;
    map['Active'] = _active;
    map['CountryName'] = _countryName;
    map['LocalView'] = _localView;
    return map;
  }
}

class Schedules {
  Schedules({
    List<Journeys>? journeys,
    String? origin,
    String? destination,
    String? originDisplay,
    String? destinationDisplay,
    bool? available,
    dynamic errorMessages,
    dynamic companyCode,
  }) {
    _journeys = journeys;
    _origin = origin;
    _destination = destination;
    _originDisplay = originDisplay;
    _destinationDisplay = destinationDisplay;
    _available = available;
    _errorMessages = errorMessages;
    _companyCode = companyCode;
  }

  Schedules.fromJson(dynamic json) {
    if (json['Journeys'] != null) {
      _journeys = [];
      json['Journeys'].forEach((v) {
        _journeys?.add(Journeys.fromJson(v));
      });
    }
    _origin = json['Origin'];
    _destination = json['Destination'];
    _originDisplay = json['OriginDisplay'];
    _destinationDisplay = json['DestinationDisplay'];
    _available = json['Available'];
    _errorMessages = json['ErrorMessages'];
    _companyCode = json['CompanyCode'];
  }

  List<Journeys>? _journeys;
  String? _origin;
  String? _destination;
  String? _originDisplay;
  String? _destinationDisplay;
  bool? _available;
  dynamic _errorMessages;
  dynamic _companyCode;

  Schedules copyWith({
    List<Journeys>? journeys,
    String? origin,
    String? destination,
    String? originDisplay,
    String? destinationDisplay,
    bool? available,
    dynamic errorMessages,
    dynamic companyCode,
  }) =>
      Schedules(
        journeys: journeys ?? _journeys,
        origin: origin ?? _origin,
        destination: destination ?? _destination,
        originDisplay: originDisplay ?? _originDisplay,
        destinationDisplay: destinationDisplay ?? _destinationDisplay,
        available: available ?? _available,
        errorMessages: errorMessages ?? _errorMessages,
        companyCode: companyCode ?? _companyCode,
      );

  List<Journeys>? get journeys => _journeys;

  String? get origin => _origin;

  String? get destination => _destination;

  String? get originDisplay => _originDisplay;

  String? get destinationDisplay => _destinationDisplay;

  bool? get available => _available;

  dynamic get errorMessages => _errorMessages;

  dynamic get companyCode => _companyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_journeys != null) {
      map['Journeys'] = _journeys?.map((v) => v.toJson()).toList();
    }
    map['Origin'] = _origin;
    map['Destination'] = _destination;
    map['OriginDisplay'] = _originDisplay;
    map['DestinationDisplay'] = _destinationDisplay;
    map['Available'] = _available;
    map['ErrorMessages'] = _errorMessages;
    map['CompanyCode'] = _companyCode;
    return map;
  }
}

class Journeys {
  Journeys({
    String? trainName,
    String? origin,
    String? arrivalTime,
    String? arrivalDate,
    String? destination,
    String? departureTime,
    String? departureDate,
    String? journeyCode,
    String? carrierNumber,
    String? duration,
    num? provider,
    num? sequence,
    List<TrainSegments>? segments,
  }) {
    _trainName = trainName;
    _origin = origin;
    _arrivalTime = arrivalTime;
    _arrivalDate = arrivalDate;
    _destination = destination;
    _departureTime = departureTime;
    _departureDate = departureDate;
    _journeyCode = journeyCode;
    _carrierNumber = carrierNumber;
    _duration = duration;
    _provider = provider;
    _sequence = sequence;
    _segments = segments;
  }

  Journeys.fromJson(dynamic json) {
    _trainName = json['TrainName'];
    _origin = json['Origin'];
    _arrivalTime = json['ArrivalTime'];
    _arrivalDate = json['ArrivalDate'];
    _destination = json['Destination'];
    _departureTime = json['DepartureTime'];
    _departureDate = json['DepartureDate'];
    _journeyCode = json['JourneyCode'];
    _carrierNumber = json['CarrierNumber'];
    _duration = json['Duration'];
    _provider = json['Provider'];
    _sequence = json['Sequence'];
    if (json['Segments'] != null) {
      _segments = [];
      json['Segments'].forEach((v) {
        _segments?.add(TrainSegments.fromJson(v));
      });
    }
  }

  String? _trainName;
  String? _origin;
  String? _arrivalTime;
  String? _arrivalDate;
  String? _destination;
  String? _departureTime;
  String? _departureDate;
  String? _journeyCode;
  String? _carrierNumber;
  String? _duration;
  num? _provider;
  num? _sequence;
  List<TrainSegments>? _segments;

  Journeys copyWith({
    String? trainName,
    String? origin,
    String? arrivalTime,
    String? arrivalDate,
    String? destination,
    String? departureTime,
    String? departureDate,
    String? journeyCode,
    String? carrierNumber,
    String? duration,
    num? provider,
    num? sequence,
    List<TrainSegments>? segments,
  }) =>
      Journeys(
        trainName: trainName ?? _trainName,
        origin: origin ?? _origin,
        arrivalTime: arrivalTime ?? _arrivalTime,
        arrivalDate: arrivalDate ?? _arrivalDate,
        destination: destination ?? _destination,
        departureTime: departureTime ?? _departureTime,
        departureDate: departureDate ?? _departureDate,
        journeyCode: journeyCode ?? _journeyCode,
        carrierNumber: carrierNumber ?? _carrierNumber,
        duration: duration ?? _duration,
        provider: provider ?? _provider,
        sequence: sequence ?? _sequence,
        segments: segments ?? _segments,
      );

  String? get trainName => _trainName;

  String? get origin => _origin;

  String? get arrivalTime => _arrivalTime;

  String? get arrivalDate => _arrivalDate;

  String? get destination => _destination;

  String? get departureTime => _departureTime;

  String? get departureDate => _departureDate;

  String? get journeyCode => _journeyCode;

  String? get carrierNumber => _carrierNumber;

  String? get duration => _duration;

  num? get provider => _provider;

  num? get sequence => _sequence;

  List<TrainSegments>? get segments => _segments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TrainName'] = _trainName;
    map['Origin'] = _origin;
    map['ArrivalTime'] = _arrivalTime;
    map['ArrivalDate'] = _arrivalDate;
    map['Destination'] = _destination;
    map['DepartureTime'] = _departureTime;
    map['DepartureDate'] = _departureDate;
    map['JourneyCode'] = _journeyCode;
    map['CarrierNumber'] = _carrierNumber;
    map['Duration'] = _duration;
    map['Provider'] = _provider;
    map['Sequence'] = _sequence;
    if (_segments != null) {
      map['Segments'] = _segments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TrainSegments {
  TrainSegments({
    String? subClass,
    String? classTrain,
    String? className,
    num? seat,
    num? fare,
    String? fareBasisCode,
    List<PaxFares>? paxFares,
    bool? active,
    String? classKey,
  }) {
    _subClass = subClass;
    _classTrain = classTrain;
    _className = className;
    _seat = seat;
    _fare = fare;
    _fareBasisCode = fareBasisCode;
    _paxFares = paxFares;
    _active = active;
    _classKey = classKey;
  }

  TrainSegments.fromJson(dynamic json) {
    _subClass = json['SubClass'];
    _classTrain = json['Class'];
    _className = json['ClassName'];
    _seat = json['Seat'];
    _fare = json['Fare'];
    _fareBasisCode = json['FareBasisCode'];
    if (json['PaxFares'] != null) {
      _paxFares = [];
      json['PaxFares'].forEach((v) {
        _paxFares?.add(PaxFares.fromJson(v));
      });
    }
    _active = json['Active'];
    _classKey = json['ClassKey'];
  }

  String? _subClass;
  String? _classTrain;
  String? _className;
  num? _seat;
  num? _fare;
  String? _fareBasisCode;
  List<PaxFares>? _paxFares;
  bool? _active;
  String? _classKey;

  TrainSegments copyWith({
    String? subClass,
    String? classTrain,
    String? className,
    num? seat,
    num? fare,
    String? fareBasisCode,
    List<PaxFares>? paxFares,
    bool? active,
    String? classKey,
  }) =>
      TrainSegments(
        subClass: subClass ?? _subClass,
        classTrain: classTrain ?? _classTrain,
        className: className ?? _className,
        seat: seat ?? _seat,
        fare: fare ?? _fare,
        fareBasisCode: fareBasisCode ?? _fareBasisCode,
        paxFares: paxFares ?? _paxFares,
        active: active ?? _active,
        classKey: classKey ?? _classKey,
      );

  String? get subClass => _subClass;

  String? get classTrain => _classTrain;

  String? get className => _className;

  num? get seat => _seat;

  num? get fare => _fare;

  String? get fareBasisCode => _fareBasisCode;

  List<PaxFares>? get paxFares => _paxFares;

  bool? get active => _active;

  String? get classKey => _classKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SubClass'] = _subClass;
    map['Class'] = _classTrain;
    map['ClassName'] = _className;
    map['Seat'] = _seat;
    map['Fare'] = _fare;
    map['FareBasisCode'] = _fareBasisCode;
    if (_paxFares != null) {
      map['PaxFares'] = _paxFares?.map((v) => v.toJson()).toList();
    }
    map['Active'] = _active;
    map['ClassKey'] = _classKey;
    return map;
  }
}

class PaxFares {
  PaxFares({
    String? paxType,
    List<Charges>? charges,
    num? index,
  }) {
    _paxType = paxType;
    _charges = charges;
    _index = index;
  }

  PaxFares.fromJson(dynamic json) {
    _paxType = json['PaxType'];
    if (json['Charges'] != null) {
      _charges = [];
      json['Charges'].forEach((v) {
        _charges?.add(Charges.fromJson(v));
      });
    }
    _index = json['Index'];
  }

  String? _paxType;
  List<Charges>? _charges;
  num? _index;

  PaxFares copyWith({
    String? paxType,
    List<Charges>? charges,
    num? index,
  }) =>
      PaxFares(
        paxType: paxType ?? _paxType,
        charges: charges ?? _charges,
        index: index ?? _index,
      );

  String? get paxType => _paxType;

  List<Charges>? get charges => _charges;

  num? get index => _index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PaxType'] = _paxType;
    if (_charges != null) {
      map['Charges'] = _charges?.map((v) => v.toJson()).toList();
    }
    map['Index'] = _index;
    return map;
  }
}

class Charges {
  Charges({
    dynamic chargeTypeString,
    String? chargeCode,
    num? amount,
    String? currencyCode,
    num? foreignAmount,
    dynamic foreignCurrencyCode,
    dynamic chargeDetail,
  }) {
    _chargeTypeString = chargeTypeString;
    _chargeCode = chargeCode;
    _amount = amount;
    _currencyCode = currencyCode;
    _foreignAmount = foreignAmount;
    _foreignCurrencyCode = foreignCurrencyCode;
    _chargeDetail = chargeDetail;
  }

  Charges.fromJson(dynamic json) {
    _chargeTypeString = json['ChargeTypeString'];
    _chargeCode = json['ChargeCode'];
    _amount = json['Amount'];
    _currencyCode = json['CurrencyCode'];
    _foreignAmount = json['ForeignAmount'];
    _foreignCurrencyCode = json['ForeignCurrencyCode'];
    _chargeDetail = json['ChargeDetail'];
  }

  dynamic _chargeTypeString;
  String? _chargeCode;
  num? _amount;
  String? _currencyCode;
  num? _foreignAmount;
  dynamic _foreignCurrencyCode;
  dynamic _chargeDetail;

  Charges copyWith({
    dynamic chargeTypeString,
    String? chargeCode,
    num? amount,
    String? currencyCode,
    num? foreignAmount,
    dynamic foreignCurrencyCode,
    dynamic chargeDetail,
  }) =>
      Charges(
        chargeTypeString: chargeTypeString ?? _chargeTypeString,
        chargeCode: chargeCode ?? _chargeCode,
        amount: amount ?? _amount,
        currencyCode: currencyCode ?? _currencyCode,
        foreignAmount: foreignAmount ?? _foreignAmount,
        foreignCurrencyCode: foreignCurrencyCode ?? _foreignCurrencyCode,
        chargeDetail: chargeDetail ?? _chargeDetail,
      );

  dynamic get chargeTypeString => _chargeTypeString;

  String? get chargeCode => _chargeCode;

  num? get amount => _amount;

  String? get currencyCode => _currencyCode;

  num? get foreignAmount => _foreignAmount;

  dynamic get foreignCurrencyCode => _foreignCurrencyCode;

  dynamic get chargeDetail => _chargeDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChargeTypeString'] = _chargeTypeString;
    map['ChargeCode'] = _chargeCode;
    map['Amount'] = _amount;
    map['CurrencyCode'] = _currencyCode;
    map['ForeignAmount'] = _foreignAmount;
    map['ForeignCurrencyCode'] = _foreignCurrencyCode;
    map['ChargeDetail'] = _chargeDetail;
    return map;
  }
}
