class GetReservationTicketModel {
  GetReservationTicketModel({
      String? id, 
      dynamic airline, 
      String? bookingCode, 
      String? timeLimit, 
      String? created, 
      String? reserved, 
      String? ticketed, 
      String? status, 
      String? bosInvoiceNo, 
      List<RSVSegments>? segments, 
      Contact? contact, 
      List<RSVPassengers>? passengers, 
      List<Payments>? payments, 
      List<FlightDetails>? flightDetails, 
      String? discountInfo, 
      String? paymentTransactionInfo, 
      String? sqlDiscountInfo, 
      String? sqlPaymentInfo, 
      String? histories, 
      String? remarks, 
      String? markupSource, 
      String? errorMessage,}){
    _id = id;
    _airline = airline;
    _bookingCode = bookingCode;
    _timeLimit = timeLimit;
    _created = created;
    _reserved = reserved;
    _ticketed = ticketed;
    _status = status;
    _bosInvoiceNo = bosInvoiceNo;
    _segments = segments;
    _contact = contact;
    _passengers = passengers;
    _payments = payments;
    _flightDetails = flightDetails;
    _discountInfo = discountInfo;
    _paymentTransactionInfo = paymentTransactionInfo;
    _sqlDiscountInfo = sqlDiscountInfo;
    _sqlPaymentInfo = sqlPaymentInfo;
    _histories = histories;
    _remarks = remarks;
    _markupSource = markupSource;
    _errorMessage = errorMessage;
}

  GetReservationTicketModel.fromJson(dynamic json) {
    _id = json['Id'];
    _airline = json['Airline'];
    _bookingCode = json['BookingCode'];
    _timeLimit = json['TimeLimit'];
    _created = json['Created'];
    _reserved = json['Reserved'];
    _ticketed = json['Ticketed'];
    _status = json['Status'];
    _bosInvoiceNo = json['BosInvoiceNo'];
    if (json['Segments'] != null) {
      _segments = [];
      json['Segments'].forEach((v) {
        _segments?.add(RSVSegments.fromJson(v));
      });
    }
    _contact = json['Contact'] != null ? Contact.fromJson(json['Contact']) : null;
    if (json['Passengers'] != null) {
      _passengers = [];
      json['Passengers'].forEach((v) {
        _passengers?.add(RSVPassengers.fromJson(v));
      });
    }
    if (json['Payments'] != null) {
      _payments = [];
      json['Payments'].forEach((v) {
        _payments?.add(Payments.fromJson(v));
      });
    }
    if (json['FlightDetails'] != null) {
      _flightDetails = [];
      json['FlightDetails'].forEach((v) {
        _flightDetails?.add(FlightDetails.fromJson(v));
      });
    }
    _discountInfo = json['DiscountInfo'];
    _paymentTransactionInfo = json['PaymentTransactionInfo'];
    _sqlDiscountInfo = json['SqlDiscountInfo'];
    _sqlPaymentInfo = json['SqlPaymentInfo'];
    _histories = json['Histories'];
    _remarks = json['Remarks'];
    _markupSource = json['MarkupSource'];
    _errorMessage = json['ErrorMessage'];
  }
  String? _id;
  dynamic _airline;
  String? _bookingCode;
  String? _timeLimit;
  String? _created;
  String? _reserved;
  String? _ticketed;
  String? _status;
  String? _bosInvoiceNo;
  List<RSVSegments>? _segments;
  Contact? _contact;
  List<RSVPassengers>? _passengers;
  List<Payments>? _payments;
  List<FlightDetails>? _flightDetails;
  String? _discountInfo;
  String? _paymentTransactionInfo;
  String? _sqlDiscountInfo;
  String? _sqlPaymentInfo;
  String? _histories;
  String? _remarks;
  String? _markupSource;
  String? _errorMessage;
GetReservationTicketModel copyWith({  String? id,
  dynamic airline,
  String? bookingCode,
  String? timeLimit,
  String? created,
  String? reserved,
  String? ticketed,
  String? status,
  String? bosInvoiceNo,
  List<RSVSegments>? segments,
  Contact? contact,
  List<RSVPassengers>? passengers,
  List<Payments>? payments,
  List<FlightDetails>? flightDetails,
  String? discountInfo,
  String? paymentTransactionInfo,
  String? sqlDiscountInfo,
  String? sqlPaymentInfo,
  String? histories,
  String? remarks,
  String? markupSource,
  String? errorMessage,
}) => GetReservationTicketModel(  id: id ?? _id,
  airline: airline ?? _airline,
  bookingCode: bookingCode ?? _bookingCode,
  timeLimit: timeLimit ?? _timeLimit,
  created: created ?? _created,
  reserved: reserved ?? _reserved,
  ticketed: ticketed ?? _ticketed,
  status: status ?? _status,
  bosInvoiceNo: bosInvoiceNo ?? _bosInvoiceNo,
  segments: segments ?? _segments,
  contact: contact ?? _contact,
  passengers: passengers ?? _passengers,
  payments: payments ?? _payments,
  flightDetails: flightDetails ?? _flightDetails,
  discountInfo: discountInfo ?? _discountInfo,
  paymentTransactionInfo: paymentTransactionInfo ?? _paymentTransactionInfo,
  sqlDiscountInfo: sqlDiscountInfo ?? _sqlDiscountInfo,
  sqlPaymentInfo: sqlPaymentInfo ?? _sqlPaymentInfo,
  histories: histories ?? _histories,
  remarks: remarks ?? _remarks,
  markupSource: markupSource ?? _markupSource,
  errorMessage: errorMessage ?? _errorMessage,
);
  String? get id => _id;
  dynamic get airline => _airline;
  String? get bookingCode => _bookingCode;
  String? get timeLimit => _timeLimit;
  String? get created => _created;
  String? get reserved => _reserved;
  String? get ticketed => _ticketed;
  String? get status => _status;
  String? get bosInvoiceNo => _bosInvoiceNo;
  List<RSVSegments>? get segments => _segments;
  Contact? get contact => _contact;
  List<RSVPassengers>? get passengers => _passengers;
  List<Payments>? get payments => _payments;
  List<FlightDetails>? get flightDetails => _flightDetails;
  String? get discountInfo => _discountInfo;
  String? get paymentTransactionInfo => _paymentTransactionInfo;
  String? get sqlDiscountInfo => _sqlDiscountInfo;
  String? get sqlPaymentInfo => _sqlPaymentInfo;
  String? get histories => _histories;
  String? get remarks => _remarks;
  String? get markupSource => _markupSource;
  String? get errorMessage => _errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Airline'] = _airline;
    map['BookingCode'] = _bookingCode;
    map['TimeLimit'] = _timeLimit;
    map['Created'] = _created;
    map['Reserved'] = _reserved;
    map['Ticketed'] = _ticketed;
    map['Status'] = _status;
    map['BosInvoiceNo'] = _bosInvoiceNo;
    if (_segments != null) {
      map['Segments'] = _segments?.map((v) => v.toJson()).toList();
    }
    if (_contact != null) {
      map['Contact'] = _contact?.toJson();
    }
    if (_passengers != null) {
      map['Passengers'] = _passengers?.map((v) => v.toJson()).toList();
    }
    if (_payments != null) {
      map['Payments'] = _payments?.map((v) => v.toJson()).toList();
    }
    if (_flightDetails != null) {
      map['FlightDetails'] = _flightDetails?.map((v) => v.toJson()).toList();
    }
    map['DiscountInfo'] = _discountInfo;
    map['PaymentTransactionInfo'] = _paymentTransactionInfo;
    map['SqlDiscountInfo'] = _sqlDiscountInfo;
    map['SqlPaymentInfo'] = _sqlPaymentInfo;
    map['Histories'] = _histories;
    map['Remarks'] = _remarks;
    map['MarkupSource'] = _markupSource;
    map['ErrorMessage'] = _errorMessage;
    return map;
  }

}

class FlightDetails {
  FlightDetails({
      dynamic airline, 
      String? flightNumber, 
      String? operatingFlightNumber, 
      String? operatingAirline, 
      String? carrierCode, 
      String? origin, 
      String? destination, 
      String? departDate, 
      String? departTime, 
      String? arriveDate, 
      String? arriveTime, 
      String? duration, 
      dynamic num, 
      dynamic seq, 
      String? rsvclass, 
      String? category, 
      String? airlineImageUrl, 
      String? operatingAirlineImageUrl,}){
    _airline = airline;
    _flightNumber = flightNumber;
    _operatingFlightNumber = operatingFlightNumber;
    _operatingAirline = operatingAirline;
    _carrierCode = carrierCode;
    _origin = origin;
    _destination = destination;
    _departDate = departDate;
    _departTime = departTime;
    _arriveDate = arriveDate;
    _arriveTime = arriveTime;
    _duration = duration;
    _num = num;
    _seq = seq;
    _class = rsvclass;
    _category = category;
    _airlineImageUrl = airlineImageUrl;
    _operatingAirlineImageUrl = operatingAirlineImageUrl;
}

  FlightDetails.fromJson(dynamic json) {
    _airline = json['Airline'];
    _flightNumber = json['FlightNumber'];
    _operatingFlightNumber = json['OperatingFlightNumber'];
    _operatingAirline = json['OperatingAirline'];
    _carrierCode = json['CarrierCode'];
    _origin = json['Origin'];
    _destination = json['Destination'];
    _departDate = json['DepartDate'];
    _departTime = json['DepartTime'];
    _arriveDate = json['ArriveDate'];
    _arriveTime = json['ArriveTime'];
    _duration = json['Duration'];
    _num = json['Num'];
    _seq = json['Seq'];
    _class = json['Class'];
    _category = json['Category'];
    _airlineImageUrl = json['AirlineImageUrl'];
    _operatingAirlineImageUrl = json['OperatingAirlineImageUrl'];
  }
  dynamic _airline;
  String? _flightNumber;
  String? _operatingFlightNumber;
  String? _operatingAirline;
  String? _carrierCode;
  String? _origin;
  String? _destination;
  String? _departDate;
  String? _departTime;
  String? _arriveDate;
  String? _arriveTime;
  String? _duration;
  dynamic _num;
  dynamic _seq;
  String? _class;
  String? _category;
  String? _airlineImageUrl;
  String? _operatingAirlineImageUrl;
FlightDetails copyWith({  dynamic airline,
  String? flightNumber,
  String? operatingFlightNumber,
  String? operatingAirline,
  String? carrierCode,
  String? origin,
  String? destination,
  String? departDate,
  String? departTime,
  String? arriveDate,
  String? arriveTime,
  String? duration,
  dynamic num,
  dynamic seq,
  String? rsvclass,
  String? category,
  String? airlineImageUrl,
  String? operatingAirlineImageUrl,
}) => FlightDetails(  airline: airline ?? _airline,
  flightNumber: flightNumber ?? _flightNumber,
  operatingFlightNumber: operatingFlightNumber ?? _operatingFlightNumber,
  operatingAirline: operatingAirline ?? _operatingAirline,
  carrierCode: carrierCode ?? _carrierCode,
  origin: origin ?? _origin,
  destination: destination ?? _destination,
  departDate: departDate ?? _departDate,
  departTime: departTime ?? _departTime,
  arriveDate: arriveDate ?? _arriveDate,
  arriveTime: arriveTime ?? _arriveTime,
  duration: duration ?? _duration,
  num: num ?? _num,
  seq: seq ?? _seq,
  rsvclass: rsvclass ?? _class,
  category: category ?? _category,
  airlineImageUrl: airlineImageUrl ?? _airlineImageUrl,
  operatingAirlineImageUrl: operatingAirlineImageUrl ?? _operatingAirlineImageUrl,
);
  dynamic get airline => _airline;
  String? get flightNumber => _flightNumber;
  String? get operatingFlightNumber => _operatingFlightNumber;
  String? get operatingAirline => _operatingAirline;
  String? get carrierCode => _carrierCode;
  String? get origin => _origin;
  String? get destination => _destination;
  String? get departDate => _departDate;
  String? get departTime => _departTime;
  String? get arriveDate => _arriveDate;
  String? get arriveTime => _arriveTime;
  String? get duration => _duration;
  dynamic get num => _num;
  dynamic get seq => _seq;
  String? get rsvclass => _class;
  String? get category => _category;
  String? get airlineImageUrl => _airlineImageUrl;
  String? get operatingAirlineImageUrl => _operatingAirlineImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Airline'] = _airline;
    map['FlightNumber'] = _flightNumber;
    map['OperatingFlightNumber'] = _operatingFlightNumber;
    map['OperatingAirline'] = _operatingAirline;
    map['CarrierCode'] = _carrierCode;
    map['Origin'] = _origin;
    map['Destination'] = _destination;
    map['DepartDate'] = _departDate;
    map['DepartTime'] = _departTime;
    map['ArriveDate'] = _arriveDate;
    map['ArriveTime'] = _arriveTime;
    map['Duration'] = _duration;
    map['Num'] = _num;
    map['Seq'] = _seq;
    map['Class'] = _class;
    map['Category'] = _category;
    map['AirlineImageUrl'] = _airlineImageUrl;
    map['OperatingAirlineImageUrl'] = _operatingAirlineImageUrl;
    return map;
  }

}

class Payments {
  Payments({
      String? code, 
      String? title, 
      double? amount, 
      String? currency, 
      double? foreignAmount, 
      String? foreignCurrency,}){
    _code = code;
    _title = title;
    _amount = amount;
    _currency = currency;
    _foreignAmount = foreignAmount;
    _foreignCurrency = foreignCurrency;
}

  Payments.fromJson(dynamic json) {
    _code = json['Code'];
    _title = json['Title'];
    _amount = json['Amount'];
    _currency = json['Currency'];
    _foreignAmount = json['ForeignAmount'];
    _foreignCurrency = json['ForeignCurrency'];
  }
  String? _code;
  String? _title;
  double? _amount;
  String? _currency;
  double? _foreignAmount;
  String? _foreignCurrency;
Payments copyWith({  String? code,
  String? title,
  double? amount,
  String? currency,
  double? foreignAmount,
  String? foreignCurrency,
}) => Payments(  code: code ?? _code,
  title: title ?? _title,
  amount: amount ?? _amount,
  currency: currency ?? _currency,
  foreignAmount: foreignAmount ?? _foreignAmount,
  foreignCurrency: foreignCurrency ?? _foreignCurrency,
);
  String? get code => _code;
  String? get title => _title;
  double? get amount => _amount;
  String? get currency => _currency;
  double? get foreignAmount => _foreignAmount;
  String? get foreignCurrency => _foreignCurrency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['Title'] = _title;
    map['Amount'] = _amount;
    map['Currency'] = _currency;
    map['ForeignAmount'] = _foreignAmount;
    map['ForeignCurrency'] = _foreignCurrency;
    return map;
  }

}

class RSVPassengers {
  RSVPassengers({
      dynamic index, 
      String? type, 
      String? title, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? birthDate, 
      String? gender, 
      String? homePhone, 
      String? mobilePhone, 
      String? otherPhone, 
      String? nationality, 
      String? idNumber, 
      Passport? passport, 
      String? ticketNumber, 
      List<RSVSsrs>? ssrs, 
      String? seats, 
      dynamic frequentFlyer, 
      String? segmentBaggages,}){
    _index = index;
    _type = type;
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _birthDate = birthDate;
    _gender = gender;
    _homePhone = homePhone;
    _mobilePhone = mobilePhone;
    _otherPhone = otherPhone;
    _nationality = nationality;
    _idNumber = idNumber;
    _passport = passport;
    _ticketNumber = ticketNumber;
    _ssrs = ssrs;
    _seats = seats;
    _frequentFlyer = frequentFlyer;
    _segmentBaggages = segmentBaggages;
}

  RSVPassengers.fromJson(dynamic json) {
    _index = json['Index'];
    _type = json['Type'];
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _email = json['Email'];
    _birthDate = json['BirthDate'];
    _gender = json['Gender'];
    _homePhone = json['HomePhone'];
    _mobilePhone = json['MobilePhone'];
    _otherPhone = json['OtherPhone'];
    _nationality = json['Nationality'];
    _idNumber = json['IdNumber'];
    _passport = json['Passport'] != null ? Passport.fromJson(json['Passport']) : null;
    _ticketNumber = json['TicketNumber'];
    if (json['Ssrs'] != null) {
      _ssrs = [];
      json['Ssrs'].forEach((v) {
        _ssrs?.add(RSVSsrs.fromJson(v));
      });
    }
    _seats = json['Seats'];
    _frequentFlyer = json['FrequentFlyer'];
    _segmentBaggages = json['SegmentBaggages'];
  }
  dynamic _index;
  String? _type;
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _birthDate;
  String? _gender;
  String? _homePhone;
  String? _mobilePhone;
  String? _otherPhone;
  String? _nationality;
  String? _idNumber;
  Passport? _passport;
  String? _ticketNumber;
  List<RSVSsrs>? _ssrs;
  String? _seats;
  dynamic _frequentFlyer;
  String? _segmentBaggages;
RSVPassengers copyWith({  dynamic index,
  String? type,
  String? title,
  String? firstName,
  String? lastName,
  String? email,
  String? birthDate,
  String? gender,
  String? homePhone,
  String? mobilePhone,
  String? otherPhone,
  String? nationality,
  String? idNumber,
  Passport? passport,
  String? ticketNumber,
  List<RSVSsrs>? ssrs,
  String? seats,
  dynamic frequentFlyer,
  String? segmentBaggages,
}) => RSVPassengers(  index: index ?? _index,
  type: type ?? _type,
  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  birthDate: birthDate ?? _birthDate,
  gender: gender ?? _gender,
  homePhone: homePhone ?? _homePhone,
  mobilePhone: mobilePhone ?? _mobilePhone,
  otherPhone: otherPhone ?? _otherPhone,
  nationality: nationality ?? _nationality,
  idNumber: idNumber ?? _idNumber,
  passport: passport ?? _passport,
  ticketNumber: ticketNumber ?? _ticketNumber,
  ssrs: ssrs ?? _ssrs,
  seats: seats ?? _seats,
  frequentFlyer: frequentFlyer ?? _frequentFlyer,
  segmentBaggages: segmentBaggages ?? _segmentBaggages,
);
  dynamic get index => _index;
  String? get type => _type;
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get birthDate => _birthDate;
  String? get gender => _gender;
  String? get homePhone => _homePhone;
  String? get mobilePhone => _mobilePhone;
  String? get otherPhone => _otherPhone;
  String? get nationality => _nationality;
  String? get idNumber => _idNumber;
  Passport? get passport => _passport;
  String? get ticketNumber => _ticketNumber;
  List<RSVSsrs>? get ssrs => _ssrs;
  String? get seats => _seats;
  dynamic get frequentFlyer => _frequentFlyer;
  String? get segmentBaggages => _segmentBaggages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Index'] = _index;
    map['Type'] = _type;
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Email'] = _email;
    map['BirthDate'] = _birthDate;
    map['Gender'] = _gender;
    map['HomePhone'] = _homePhone;
    map['MobilePhone'] = _mobilePhone;
    map['OtherPhone'] = _otherPhone;
    map['Nationality'] = _nationality;
    map['IdNumber'] = _idNumber;
    if (_passport != null) {
      map['Passport'] = _passport?.toJson();
    }
    map['TicketNumber'] = _ticketNumber;
    if (_ssrs != null) {
      map['Ssrs'] = _ssrs?.map((v) => v.toJson()).toList();
    }
    map['Seats'] = _seats;
    map['FrequentFlyer'] = _frequentFlyer;
    map['SegmentBaggages'] = _segmentBaggages;
    return map;
  }

}

class RSVSsrs {
  RSVSsrs({
      String? ssrCode, 
      String? originCode, 
      String? destinationCode, 
      double? ssrFare, 
      String? ccy, 
      String? ssrName, 
      dynamic ssrType, 
      String? flightNumber, 
      dynamic paxType, 
      dynamic quantity, 
      dynamic image, 
      dynamic shortDesc, 
      dynamic longDesc, 
      double? tax,}){
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

  RSVSsrs.fromJson(dynamic json) {
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
  double? _ssrFare;
  String? _ccy;
  String? _ssrName;
  dynamic _ssrType;
  String? _flightNumber;
  dynamic _paxType;
  dynamic _quantity;
  dynamic _image;
  dynamic _shortDesc;
  dynamic _longDesc;
  double? _tax;
RSVSsrs copyWith({  String? ssrCode,
  String? originCode,
  String? destinationCode,
  double? ssrFare,
  String? ccy,
  String? ssrName,
  dynamic ssrType,
  String? flightNumber,
  dynamic paxType,
  dynamic quantity,
  dynamic image,
  dynamic shortDesc,
  dynamic longDesc,
  double? tax,
}) => RSVSsrs(  ssrCode: ssrCode ?? _ssrCode,
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
  double? get ssrFare => _ssrFare;
  String? get ccy => _ccy;
  String? get ssrName => _ssrName;
  dynamic get ssrType => _ssrType;
  String? get flightNumber => _flightNumber;
  dynamic get paxType => _paxType;
  dynamic get quantity => _quantity;
  dynamic get image => _image;
  dynamic get shortDesc => _shortDesc;
  dynamic get longDesc => _longDesc;
  double? get tax => _tax;

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

class Passport {
  Passport({
      String? number, 
      String? originCountry, 
      String? firstName, 
      String? lastName, 
      String? expire,}){
    _number = number;
    _originCountry = originCountry;
    _firstName = firstName;
    _lastName = lastName;
    _expire = expire;
}

  Passport.fromJson(dynamic json) {
    _number = json['Number'];
    _originCountry = json['OriginCountry'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _expire = json['Expire'];
  }
  String? _number;
  String? _originCountry;
  String? _firstName;
  String? _lastName;
  String? _expire;
Passport copyWith({  String? number,
  String? originCountry,
  String? firstName,
  String? lastName,
  String? expire,
}) => Passport(  number: number ?? _number,
  originCountry: originCountry ?? _originCountry,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  expire: expire ?? _expire,
);
  String? get number => _number;
  String? get originCountry => _originCountry;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get expire => _expire;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Number'] = _number;
    map['OriginCountry'] = _originCountry;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Expire'] = _expire;
    return map;
  }

}

class Contact {
  Contact({
      String? title, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? mobilePhone, 
      String? homePhone,}){
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobilePhone = mobilePhone;
    _homePhone = homePhone;
}

  Contact.fromJson(dynamic json) {
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _email = json['Email'];
    _mobilePhone = json['MobilePhone'];
    _homePhone = json['HomePhone'];
  }
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobilePhone;
  String? _homePhone;
Contact copyWith({  String? title,
  String? firstName,
  String? lastName,
  String? email,
  String? mobilePhone,
  String? homePhone,
}) => Contact(  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobilePhone: mobilePhone ?? _mobilePhone,
  homePhone: homePhone ?? _homePhone,
);
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobilePhone => _mobilePhone;
  String? get homePhone => _homePhone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Email'] = _email;
    map['MobilePhone'] = _mobilePhone;
    map['HomePhone'] = _homePhone;
    return map;
  }

}

class RSVSegments {
  RSVSegments({
      String? airlineName, 
      String? origin, 
      String? destination, 
      String? originAirport, 
      String? destinationAirport, 
      String? airlineBookingCode, 
      dynamic num, 
      dynamic seq,}){
    _airlineName = airlineName;
    _origin = origin;
    _destination = destination;
    _originAirport = originAirport;
    _destinationAirport = destinationAirport;
    _airlineBookingCode = airlineBookingCode;
    _num = num;
    _seq = seq;
}

  RSVSegments.fromJson(dynamic json) {
    _airlineName = json['AirlineName'];
    _origin = json['Origin'];
    _destination = json['Destination'];
    _originAirport = json['OriginAirport'];
    _destinationAirport = json['DestinationAirport'];
    _airlineBookingCode = json['AirlineBookingCode'];
    _num = json['Num'];
    _seq = json['Seq'];
  }
  String? _airlineName;
  String? _origin;
  String? _destination;
  String? _originAirport;
  String? _destinationAirport;
  String? _airlineBookingCode;
  dynamic _num;
  dynamic _seq;
RSVSegments copyWith({  String? airlineName,
  String? origin,
  String? destination,
  String? originAirport,
  String? destinationAirport,
  String? airlineBookingCode,
  dynamic num,
  dynamic seq,
}) => RSVSegments(  airlineName: airlineName ?? _airlineName,
  origin: origin ?? _origin,
  destination: destination ?? _destination,
  originAirport: originAirport ?? _originAirport,
  destinationAirport: destinationAirport ?? _destinationAirport,
  airlineBookingCode: airlineBookingCode ?? _airlineBookingCode,
  num: num ?? _num,
  seq: seq ?? _seq,
);
  String? get airlineName => _airlineName;
  String? get origin => _origin;
  String? get destination => _destination;
  String? get originAirport => _originAirport;
  String? get destinationAirport => _destinationAirport;
  String? get airlineBookingCode => _airlineBookingCode;
  dynamic get num => _num;
  dynamic get seq => _seq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AirlineName'] = _airlineName;
    map['Origin'] = _origin;
    map['Destination'] = _destination;
    map['OriginAirport'] = _originAirport;
    map['DestinationAirport'] = _destinationAirport;
    map['AirlineBookingCode'] = _airlineBookingCode;
    map['Num'] = _num;
    map['Seq'] = _seq;
    return map;
  }

}