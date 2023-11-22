class GetHotelsModel {
  GetHotelsModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetHotelsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetHotelsModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetHotelsModel(
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
    int? count,
    int? maxPage,
    List<Stars>? stars,
    List<Areas>? areas,
    List<Hotel>? hotel,
    bool? allowIssued,
    bool? isShowSupplier,
    String? correlationId,
    bool? isError,
    String? message,
    dynamic errorCode,
    dynamic warning,
  }) {
    _count = count;
    _maxPage = maxPage;
    _stars = stars;
    _areas = areas;
    _hotel = hotel;
    _allowIssued = allowIssued;
    _isShowSupplier = isShowSupplier;
    _correlationId = correlationId;
    _isError = isError;
    _message = message;
    _errorCode = errorCode;
    _warning = warning;
  }

  Data.fromJson(dynamic json) {
    _count = json['Count'];
    _maxPage = json['MaxPage'];
    if (json['Stars'] != null) {
      _stars = [];
      json['Stars'].forEach((v) {
        _stars?.add(Stars.fromJson(v));
      });
    }
    if (json['Areas'] != null) {
      _areas = [];
      json['Areas'].forEach((v) {
        _areas?.add(Areas.fromJson(v));
      });
    }
    if (json['Hotel'] != null) {
      _hotel = [];
      json['Hotel'].forEach((v) {
        _hotel?.add(Hotel.fromJson(v));
      });
    }
    _allowIssued = json['AllowIssued'];
    _isShowSupplier = json['IsShowSupplier'];
    _correlationId = json['CorrelationId'];
    _isError = json['IsError'];
    _message = json['Message'];
    _errorCode = json['ErrorCode'];
    _warning = json['Warning'];
  }

  int? _count;
  int? _maxPage;
  List<Stars>? _stars;
  List<Areas>? _areas;
  List<Hotel>? _hotel;
  bool? _allowIssued;
  bool? _isShowSupplier;
  String? _correlationId;
  bool? _isError;
  String? _message;
  dynamic _errorCode;
  dynamic _warning;

  Data copyWith({
    int? count,
    int? maxPage,
    List<Stars>? stars,
    List<Areas>? areas,
    List<Hotel>? hotel,
    bool? allowIssued,
    bool? isShowSupplier,
    String? correlationId,
    bool? isError,
    String? message,
    dynamic errorCode,
    dynamic warning,
  }) =>
      Data(
        count: count ?? _count,
        maxPage: maxPage ?? _maxPage,
        stars: stars ?? _stars,
        areas: areas ?? _areas,
        hotel: hotel ?? _hotel,
        allowIssued: allowIssued ?? _allowIssued,
        isShowSupplier: isShowSupplier ?? _isShowSupplier,
        correlationId: correlationId ?? _correlationId,
        isError: isError ?? _isError,
        message: message ?? _message,
        errorCode: errorCode ?? _errorCode,
        warning: warning ?? _warning,
      );

  int? get count => _count;

  int? get maxPage => _maxPage;

  List<Stars>? get stars => _stars;

  List<Areas>? get areas => _areas;

  List<Hotel>? get hotel => _hotel;

  bool? get allowIssued => _allowIssued;

  bool? get isShowSupplier => _isShowSupplier;

  String? get correlationId => _correlationId;

  bool? get isError => _isError;

  String? get message => _message;

  dynamic get errorCode => _errorCode;

  dynamic get warning => _warning;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Count'] = _count;
    map['MaxPage'] = _maxPage;
    if (_stars != null) {
      map['Stars'] = _stars?.map((v) => v.toJson()).toList();
    }
    if (_areas != null) {
      map['Areas'] = _areas?.map((v) => v.toJson()).toList();
    }
    if (_hotel != null) {
      map['Hotel'] = _hotel?.map((v) => v.toJson()).toList();
    }
    map['AllowIssued'] = _allowIssued;
    map['IsShowSupplier'] = _isShowSupplier;
    map['CorrelationId'] = _correlationId;
    map['IsError'] = _isError;
    map['Message'] = _message;
    map['ErrorCode'] = _errorCode;
    map['Warning'] = _warning;
    return map;
  }
}

class Hotel {
  Hotel({
    String? hotelKey,
    String? hotelName,
    dynamic chainCode,
    dynamic chainName,
    String? providerCode,
    String? providerHotelCode,
    int? starRating,
    String? isoCountryCode,
    String? countryName,
    String? cityKey,
    String? cityName,
    String? area,
    double? latitude,
    double? longitude,
    String? address,
    String? mapImageUri,
    String? phone,
    dynamic facsimile,
    String? email,
    String? website,
    String? imageUri,
    String? thumbUri,
    int? status,
    String? currency,
    int? currencyRate,
    int? lowestRoomPrice,
    int? pricePerRoomNight,
    List<String>? facilities,
    int? averagePrice,
    bool? havePromoFare,
    List<Rooms>? rooms,
  }) {
    _hotelKey = hotelKey;
    _hotelName = hotelName;
    _chainCode = chainCode;
    _chainName = chainName;
    _providerCode = providerCode;
    _providerHotelCode = providerHotelCode;
    _starRating = starRating;
    _isoCountryCode = isoCountryCode;
    _countryName = countryName;
    _cityKey = cityKey;
    _cityName = cityName;
    _area = area;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _mapImageUri = mapImageUri;
    _phone = phone;
    _facsimile = facsimile;
    _email = email;
    _website = website;
    _imageUri = imageUri;
    _thumbUri = thumbUri;
    _status = status;
    _currency = currency;
    _currencyRate = currencyRate;
    _lowestRoomPrice = lowestRoomPrice;
    _pricePerRoomNight = pricePerRoomNight;
    _facilities = facilities;
    _averagePrice = averagePrice;
    _havePromoFare = havePromoFare;
    _rooms = rooms;
  }

  Hotel.fromJson(dynamic json) {
    _hotelKey = json['HotelKey'];
    _hotelName = json['HotelName'];
    _chainCode = json['ChainCode'];
    _chainName = json['ChainName'];
    _providerCode = json['ProviderCode'];
    _providerHotelCode = json['ProviderHotelCode'];
    _starRating = json['StarRating'];
    _isoCountryCode = json['IsoCountryCode'];
    _countryName = json['CountryName'];
    _cityKey = json['CityKey'];
    _cityName = json['CityName'];
    _area = json['Area'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _address = json['Address'];
    _mapImageUri = json['MapImageUri'];
    _phone = json['Phone'];
    _facsimile = json['Facsimile'];
    _email = json['Email'];
    _website = json['Website'];
    _imageUri = json['ImageUri'];
    _thumbUri = json['ThumbUri'];
    _status = json['Status'];
    _currency = json['Currency'];
    _currencyRate = json['CurrencyRate'];
    _lowestRoomPrice = json['LowestRoomPrice'];
    _pricePerRoomNight = json['PricePerRoomNight'];
    _facilities = json['Facilities'] != null ? json['Facilities'].cast<String>() : [];
    _averagePrice = json['AveragePrice'];
    _havePromoFare = json['HavePromoFare'];
    if (json['Rooms'] != null) {
      _rooms = [];
      json['Rooms'].forEach((v) {
        _rooms?.add(Rooms.fromJson(v));
      });
    }
  }

  String? _hotelKey;
  String? _hotelName;
  dynamic _chainCode;
  dynamic _chainName;
  String? _providerCode;
  String? _providerHotelCode;
  int? _starRating;
  String? _isoCountryCode;
  String? _countryName;
  String? _cityKey;
  String? _cityName;
  String? _area;
  double? _latitude;
  double? _longitude;
  String? _address;
  String? _mapImageUri;
  String? _phone;
  dynamic _facsimile;
  String? _email;
  String? _website;
  String? _imageUri;
  String? _thumbUri;
  int? _status;
  String? _currency;
  int? _currencyRate;
  int? _lowestRoomPrice;
  int? _pricePerRoomNight;
  List<String>? _facilities;
  int? _averagePrice;
  bool? _havePromoFare;
  List<Rooms>? _rooms;

  Hotel copyWith({
    String? hotelKey,
    String? hotelName,
    dynamic chainCode,
    dynamic chainName,
    String? providerCode,
    String? providerHotelCode,
    int? starRating,
    String? isoCountryCode,
    String? countryName,
    String? cityKey,
    String? cityName,
    String? area,
    double? latitude,
    double? longitude,
    String? address,
    String? mapImageUri,
    String? phone,
    dynamic facsimile,
    String? email,
    String? website,
    String? imageUri,
    String? thumbUri,
    int? status,
    String? currency,
    int? currencyRate,
    int? lowestRoomPrice,
    int? pricePerRoomNight,
    List<String>? facilities,
    int? averagePrice,
    bool? havePromoFare,
    List<Rooms>? rooms,
  }) =>
      Hotel(
        hotelKey: hotelKey ?? _hotelKey,
        hotelName: hotelName ?? _hotelName,
        chainCode: chainCode ?? _chainCode,
        chainName: chainName ?? _chainName,
        providerCode: providerCode ?? _providerCode,
        providerHotelCode: providerHotelCode ?? _providerHotelCode,
        starRating: starRating ?? _starRating,
        isoCountryCode: isoCountryCode ?? _isoCountryCode,
        countryName: countryName ?? _countryName,
        cityKey: cityKey ?? _cityKey,
        cityName: cityName ?? _cityName,
        area: area ?? _area,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        address: address ?? _address,
        mapImageUri: mapImageUri ?? _mapImageUri,
        phone: phone ?? _phone,
        facsimile: facsimile ?? _facsimile,
        email: email ?? _email,
        website: website ?? _website,
        imageUri: imageUri ?? _imageUri,
        thumbUri: thumbUri ?? _thumbUri,
        status: status ?? _status,
        currency: currency ?? _currency,
        currencyRate: currencyRate ?? _currencyRate,
        lowestRoomPrice: lowestRoomPrice ?? _lowestRoomPrice,
        pricePerRoomNight: pricePerRoomNight ?? _pricePerRoomNight,
        facilities: facilities ?? _facilities,
        averagePrice: averagePrice ?? _averagePrice,
        havePromoFare: havePromoFare ?? _havePromoFare,
        rooms: rooms ?? _rooms,
      );

  String? get hotelKey => _hotelKey;

  String? get hotelName => _hotelName;

  dynamic get chainCode => _chainCode;

  dynamic get chainName => _chainName;

  String? get providerCode => _providerCode;

  String? get providerHotelCode => _providerHotelCode;

  int? get starRating => _starRating;

  String? get isoCountryCode => _isoCountryCode;

  String? get countryName => _countryName;

  String? get cityKey => _cityKey;

  String? get cityName => _cityName;

  String? get area => _area;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  String? get address => _address;

  String? get mapImageUri => _mapImageUri;

  String? get phone => _phone;

  dynamic get facsimile => _facsimile;

  String? get email => _email;

  String? get website => _website;

  String? get imageUri => _imageUri;

  String? get thumbUri => _thumbUri;

  int? get status => _status;

  String? get currency => _currency;

  int? get currencyRate => _currencyRate;

  int? get lowestRoomPrice => _lowestRoomPrice;

  int? get pricePerRoomNight => _pricePerRoomNight;

  List<String>? get facilities => _facilities;

  int? get averagePrice => _averagePrice;

  bool? get havePromoFare => _havePromoFare;

  List<Rooms>? get rooms => _rooms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HotelKey'] = _hotelKey;
    map['HotelName'] = _hotelName;
    map['ChainCode'] = _chainCode;
    map['ChainName'] = _chainName;
    map['ProviderCode'] = _providerCode;
    map['ProviderHotelCode'] = _providerHotelCode;
    map['StarRating'] = _starRating;
    map['IsoCountryCode'] = _isoCountryCode;
    map['CountryName'] = _countryName;
    map['CityKey'] = _cityKey;
    map['CityName'] = _cityName;
    map['Area'] = _area;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['Address'] = _address;
    map['MapImageUri'] = _mapImageUri;
    map['Phone'] = _phone;
    map['Facsimile'] = _facsimile;
    map['Email'] = _email;
    map['Website'] = _website;
    map['ImageUri'] = _imageUri;
    map['ThumbUri'] = _thumbUri;
    map['Status'] = _status;
    map['Currency'] = _currency;
    map['CurrencyRate'] = _currencyRate;
    map['LowestRoomPrice'] = _lowestRoomPrice;
    map['PricePerRoomNight'] = _pricePerRoomNight;
    map['Facilities'] = _facilities;
    map['AveragePrice'] = _averagePrice;
    map['HavePromoFare'] = _havePromoFare;
    if (_rooms != null) {
      map['Rooms'] = _rooms?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Rooms {
  Rooms({
    String? providerCode,
    String? roomKey,
    String? roomHash,
    String? roomName,
    String? roomSubText,
    dynamic rateCode,
    dynamic rateName,
    String? mealType,
    String? mealTypeName,
    bool? includeBreakfast,
    String? currency,
    int? totalPrice,
    int? orderPriority,
    int? status,
    bool? isPromoFare,
    dynamic promoFareFor,
    dynamic subProviderCode,
    List<PriceDetails>? priceDetails,
    List<dynamic>? additionalPrice,
    int? averagePrice,
  }) {
    _providerCode = providerCode;
    _roomKey = roomKey;
    _roomHash = roomHash;
    _roomName = roomName;
    _roomSubText = roomSubText;
    _rateCode = rateCode;
    _rateName = rateName;
    _mealType = mealType;
    _mealTypeName = mealTypeName;
    _includeBreakfast = includeBreakfast;
    _currency = currency;
    _totalPrice = totalPrice;
    _orderPriority = orderPriority;
    _status = status;
    _isPromoFare = isPromoFare;
    _promoFareFor = promoFareFor;
    _subProviderCode = subProviderCode;
    _priceDetails = priceDetails;
    _additionalPrice = additionalPrice;
    _averagePrice = averagePrice;
  }

  Rooms.fromJson(dynamic json) {
    _providerCode = json['ProviderCode'];
    _roomKey = json['RoomKey'];
    _roomHash = json['RoomHash'];
    _roomName = json['RoomName'];
    _roomSubText = json['RoomSubText'];
    _rateCode = json['RateCode'];
    _rateName = json['RateName'];
    _mealType = json['MealType'];
    _mealTypeName = json['MealTypeName'];
    _includeBreakfast = json['IncludeBreakfast'];
    _currency = json['Currency'];
    _totalPrice = json['TotalPrice'];
    _orderPriority = json['OrderPriority'];
    _status = json['Status'];
    _isPromoFare = json['IsPromoFare'];
    _promoFareFor = json['PromoFareFor'];
    _subProviderCode = json['SubProviderCode'];
    if (json['PriceDetails'] != null) {
      _priceDetails = [];
      json['PriceDetails'].forEach((v) {
        _priceDetails?.add(PriceDetails.fromJson(v));
      });
    }
    if (json['AdditionalPrice'] != null) {
      _additionalPrice = [];
      // json['AdditionalPrice'].forEach((v) {
      //   _additionalPrice?.add(Dynamic.fromJson(v));
      // });
      _additionalPrice = json['AdditionalPrice'];
    }
    _averagePrice = json['AveragePrice'];
  }

  String? _providerCode;
  String? _roomKey;
  String? _roomHash;
  String? _roomName;
  String? _roomSubText;
  dynamic _rateCode;
  dynamic _rateName;
  String? _mealType;
  String? _mealTypeName;
  bool? _includeBreakfast;
  String? _currency;
  int? _totalPrice;
  int? _orderPriority;
  int? _status;
  bool? _isPromoFare;
  dynamic _promoFareFor;
  dynamic _subProviderCode;
  List<PriceDetails>? _priceDetails;
  List<dynamic>? _additionalPrice;
  int? _averagePrice;

  Rooms copyWith({
    String? providerCode,
    String? roomKey,
    String? roomHash,
    String? roomName,
    String? roomSubText,
    dynamic rateCode,
    dynamic rateName,
    String? mealType,
    String? mealTypeName,
    bool? includeBreakfast,
    String? currency,
    int? totalPrice,
    int? orderPriority,
    int? status,
    bool? isPromoFare,
    dynamic promoFareFor,
    dynamic subProviderCode,
    List<PriceDetails>? priceDetails,
    List<dynamic>? additionalPrice,
    int? averagePrice,
  }) =>
      Rooms(
        providerCode: providerCode ?? _providerCode,
        roomKey: roomKey ?? _roomKey,
        roomHash: roomHash ?? _roomHash,
        roomName: roomName ?? _roomName,
        roomSubText: roomSubText ?? _roomSubText,
        rateCode: rateCode ?? _rateCode,
        rateName: rateName ?? _rateName,
        mealType: mealType ?? _mealType,
        mealTypeName: mealTypeName ?? _mealTypeName,
        includeBreakfast: includeBreakfast ?? _includeBreakfast,
        currency: currency ?? _currency,
        totalPrice: totalPrice ?? _totalPrice,
        orderPriority: orderPriority ?? _orderPriority,
        status: status ?? _status,
        isPromoFare: isPromoFare ?? _isPromoFare,
        promoFareFor: promoFareFor ?? _promoFareFor,
        subProviderCode: subProviderCode ?? _subProviderCode,
        priceDetails: priceDetails ?? _priceDetails,
        additionalPrice: additionalPrice ?? _additionalPrice,
        averagePrice: averagePrice ?? _averagePrice,
      );

  String? get providerCode => _providerCode;

  String? get roomKey => _roomKey;

  String? get roomHash => _roomHash;

  String? get roomName => _roomName;

  String? get roomSubText => _roomSubText;

  dynamic get rateCode => _rateCode;

  dynamic get rateName => _rateName;

  String? get mealType => _mealType;

  String? get mealTypeName => _mealTypeName;

  bool? get includeBreakfast => _includeBreakfast;

  String? get currency => _currency;

  int? get totalPrice => _totalPrice;

  int? get orderPriority => _orderPriority;

  int? get status => _status;

  bool? get isPromoFare => _isPromoFare;

  dynamic get promoFareFor => _promoFareFor;

  dynamic get subProviderCode => _subProviderCode;

  List<PriceDetails>? get priceDetails => _priceDetails;

  List<dynamic>? get additionalPrice => _additionalPrice;

  int? get averagePrice => _averagePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProviderCode'] = _providerCode;
    map['RoomKey'] = _roomKey;
    map['RoomHash'] = _roomHash;
    map['RoomName'] = _roomName;
    map['RoomSubText'] = _roomSubText;
    map['RateCode'] = _rateCode;
    map['RateName'] = _rateName;
    map['MealType'] = _mealType;
    map['MealTypeName'] = _mealTypeName;
    map['IncludeBreakfast'] = _includeBreakfast;
    map['Currency'] = _currency;
    map['TotalPrice'] = _totalPrice;
    map['OrderPriority'] = _orderPriority;
    map['Status'] = _status;
    map['IsPromoFare'] = _isPromoFare;
    map['PromoFareFor'] = _promoFareFor;
    map['SubProviderCode'] = _subProviderCode;
    if (_priceDetails != null) {
      map['PriceDetails'] = _priceDetails?.map((v) => v.toJson()).toList();
    }
    if (_additionalPrice != null) {
      map['AdditionalPrice'] = _additionalPrice?.map((v) => v.toJson()).toList();
    }
    map['AveragePrice'] = _averagePrice;
    return map;
  }
}

class PriceDetails {
  PriceDetails({
    int? nightIndex,
    int? countAdult,
    int? countChild,
    int? countInfant,
    int? totalRoom,
    int? totalPrice,
    RoomTypePrice? roomTypePrice,
  }) {
    _nightIndex = nightIndex;
    _countAdult = countAdult;
    _countChild = countChild;
    _countInfant = countInfant;
    _totalRoom = totalRoom;
    _totalPrice = totalPrice;
    _roomTypePrice = roomTypePrice;
  }

  PriceDetails.fromJson(dynamic json) {
    _nightIndex = json['NightIndex'];
    _countAdult = json['CountAdult'];
    _countChild = json['CountChild'];
    _countInfant = json['CountInfant'];
    _totalRoom = json['TotalRoom'];
    _totalPrice = json['TotalPrice'];
    _roomTypePrice = json['RoomTypePrice'] != null ? RoomTypePrice.fromJson(json['RoomTypePrice']) : null;
  }

  int? _nightIndex;
  int? _countAdult;
  int? _countChild;
  int? _countInfant;
  int? _totalRoom;
  int? _totalPrice;
  RoomTypePrice? _roomTypePrice;

  PriceDetails copyWith({
    int? nightIndex,
    int? countAdult,
    int? countChild,
    int? countInfant,
    int? totalRoom,
    int? totalPrice,
    RoomTypePrice? roomTypePrice,
  }) =>
      PriceDetails(
        nightIndex: nightIndex ?? _nightIndex,
        countAdult: countAdult ?? _countAdult,
        countChild: countChild ?? _countChild,
        countInfant: countInfant ?? _countInfant,
        totalRoom: totalRoom ?? _totalRoom,
        totalPrice: totalPrice ?? _totalPrice,
        roomTypePrice: roomTypePrice ?? _roomTypePrice,
      );

  int? get nightIndex => _nightIndex;

  int? get countAdult => _countAdult;

  int? get countChild => _countChild;

  int? get countInfant => _countInfant;

  int? get totalRoom => _totalRoom;

  int? get totalPrice => _totalPrice;

  RoomTypePrice? get roomTypePrice => _roomTypePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['NightIndex'] = _nightIndex;
    map['CountAdult'] = _countAdult;
    map['CountChild'] = _countChild;
    map['CountInfant'] = _countInfant;
    map['TotalRoom'] = _totalRoom;
    map['TotalPrice'] = _totalPrice;
    if (_roomTypePrice != null) {
      map['RoomTypePrice'] = _roomTypePrice?.toJson();
    }
    return map;
  }
}

class RoomTypePrice {
  RoomTypePrice({
    DoubleRoomType? doubleRoomType,
  }) {
    _doubleRoomType = doubleRoomType;
  }

  RoomTypePrice.fromJson(dynamic json) {
    // _doubleRoomType = json['double'];
    DoubleRoomType;
  }

  DoubleRoomType? _doubleRoomType;

  RoomTypePrice copyWith({
    DoubleRoomType? doubleRoomType,
  }) =>
      RoomTypePrice(
        doubleRoomType: doubleRoomType ?? _doubleRoomType,
      );

  DoubleRoomType? get doubleRoomType => _doubleRoomType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['double'] = _doubleRoomType;
    return map;
  }
}

class DoubleRoomType {
  DoubleRoomType({
    String? typeCode,
    String? typeName,
    int? countRoom,
    int? pricePerRoom,
  }) {
    _typeCode = typeCode;
    _typeName = typeName;
    _countRoom = countRoom;
    _pricePerRoom = pricePerRoom;
  }

  DoubleRoomType.fromJson(dynamic json) {
    _typeCode = json['TypeCode'];
    _typeName = json['TypeName'];
    _countRoom = json['CountRoom'];
    _pricePerRoom = json['PricePerRoom'];
  }

  String? _typeCode;
  String? _typeName;
  int? _countRoom;
  int? _pricePerRoom;

  DoubleRoomType copyWith({
    String? typeCode,
    String? typeName,
    int? countRoom,
    int? pricePerRoom,
  }) =>
      DoubleRoomType(
        typeCode: typeCode ?? _typeCode,
        typeName: typeName ?? _typeName,
        countRoom: countRoom ?? _countRoom,
        pricePerRoom: pricePerRoom ?? _pricePerRoom,
      );

  String? get typeCode => _typeCode;

  String? get typeName => _typeName;

  int? get countRoom => _countRoom;

  int? get pricePerRoom => _pricePerRoom;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TypeCode'] = _typeCode;
    map['TypeName'] = _typeName;
    map['CountRoom'] = _countRoom;
    map['PricePerRoom'] = _pricePerRoom;
    return map;
  }
}

class Areas {
  Areas({
    String? area,
    int? count,
  }) {
    _area = area;
    _count = count;
  }

  Areas.fromJson(dynamic json) {
    _area = json['Area'];
    _count = json['Count'];
  }

  String? _area;
  int? _count;

  Areas copyWith({
    String? area,
    int? count,
  }) =>
      Areas(
        area: area ?? _area,
        count: count ?? _count,
      );

  String? get area => _area;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Area'] = _area;
    map['Count'] = _count;
    return map;
  }
}

class Stars {
  Stars({
    int? rating,
    int? count,
  }) {
    _rating = rating;
    _count = count;
  }

  Stars.fromJson(dynamic json) {
    _rating = json['Rating'];
    _count = json['Count'];
  }

  int? _rating;
  int? _count;

  Stars copyWith({
    int? rating,
    int? count,
  }) =>
      Stars(
        rating: rating ?? _rating,
        count: count ?? _count,
      );

  int? get rating => _rating;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Rating'] = _rating;
    map['Count'] = _count;
    return map;
  }
}
