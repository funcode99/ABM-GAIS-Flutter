import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';

class PassengersModel {
  PassengersModel({
    int? index,
    String? type,
    String? title,
    String? firstName,
    String? lastName,
    bool? isSeniorCitizen,
    String? email,
    String? birthDate,
    String? gender,
    String? homePhone,
    String? mobilePhone,
    dynamic otherPhone,
    String? nationality,
    String? idNumber,
    Passport? passport,
    String? emergencyName,
    String? emergencyPhone,
    String? emergencyEmail,
    String? ticketNumber,
    List<Ssrs>? ssrs,
    List<FlightSeats>? seats,
    dynamic frequentFlyer,
    dynamic segmentBaggages,
    String? paxType,
    String? sequence,
  }) {
    _index = index;
    _type = type;
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _isSeniorCitizen = isSeniorCitizen;
    _email = email;
    _birthDate = birthDate;
    _gender = gender;
    _homePhone = homePhone;
    _mobilePhone = mobilePhone;
    _otherPhone = otherPhone;
    _nationality = nationality;
    _idNumber = idNumber;
    _passport = passport;
    _emergencyName = emergencyName;
    _emergencyPhone = emergencyPhone;
    _emergencyEmail = emergencyEmail;
    _ticketNumber = ticketNumber;
    _ssrs = ssrs;
    _seats = seats;
    _frequentFlyer = frequentFlyer;
    _segmentBaggages = segmentBaggages;
    _paxType = paxType;
    _sequence = sequence;
  }

  PassengersModel.fromJson(dynamic json) {
    _index = json['Index'];
    _type = json['Type'];
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _isSeniorCitizen = json['IsSeniorCitizen'];
    _email = json['Email'];
    _birthDate = json['BirthDate'];
    _gender = json['Gender'];
    _homePhone = json['HomePhone'];
    _mobilePhone = json['MobilePhone'];
    _otherPhone = json['OtherPhone'];
    _nationality = json['Nationality'];
    _idNumber = json['IdNumber'];
    _passport = json['Passport'] != null ? Passport.fromJson(json['Passport']) : null;
    _emergencyName = json['EmergencyFullName'];
    _emergencyPhone = json['EmergencyPhone'];
    _emergencyEmail = json['EmergencyEmail'];
    _ticketNumber = json['TicketNumber'];
    if (json['Ssrs'] != null) {
      _ssrs = [];
      json['Ssrs'].forEach((v) {
        _ssrs?.add(Ssrs.fromJson(v));
      });
    }
    if (json['Seats'] != null) {
      _seats = [];
      json['Seats'].forEach((v) {
        _seats?.add(FlightSeats.fromJson(v));
      });
    }
    _frequentFlyer = json['FrequentFlyer'];
    _segmentBaggages = json['SegmentBaggages'];
    _paxType = json['paxType'];
    _sequence = json['sequence'];
  }

  int? _index;
  String? _type;
  String? _title;
  String? _firstName;
  String? _lastName;
  bool? _isSeniorCitizen;
  String? _email;
  String? _birthDate;
  String? _gender;
  String? _homePhone;
  String? _mobilePhone;
  dynamic _otherPhone;
  String? _nationality;
  String? _idNumber;
  Passport? _passport;
  String? _emergencyName;
  String? _emergencyPhone;
  String? _emergencyEmail;
  String? _ticketNumber;
  List<Ssrs>? _ssrs;
  List<FlightSeats>? _seats;
  dynamic _frequentFlyer;
  dynamic _segmentBaggages;
  String? _paxType;
  String? _sequence;

  PassengersModel copyWith({
    int? index,
    String? type,
    String? title,
    String? firstName,
    String? lastName,
    bool? isSeniorCitizen,
    String? email,
    String? birthDate,
    String? gender,
    String? homePhone,
    String? mobilePhone,
    dynamic otherPhone,
    String? nationality,
    String? idNumber,
    Passport? passport,
    String? emergencyName,
    String? emergencyPhone,
    String? emergencyEmail,
    String? ticketNumber,
    List<Ssrs>? ssrs,
    List<FlightSeats>? seats,
    dynamic frequentFlyer,
    dynamic segmentBaggages,
    String? paxType,
    String? sequence,
  }) =>
      PassengersModel(
        index: index ?? _index,
        type: type ?? _type,
        title: title ?? _title,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        isSeniorCitizen: isSeniorCitizen ?? _isSeniorCitizen,
        email: email ?? _email,
        birthDate: birthDate ?? _birthDate,
        gender: gender ?? _gender,
        homePhone: homePhone ?? _homePhone,
        mobilePhone: mobilePhone ?? _mobilePhone,
        otherPhone: otherPhone ?? _otherPhone,
        nationality: nationality ?? _nationality,
        idNumber: idNumber ?? _idNumber,
        passport: passport ?? _passport,
        emergencyName: emergencyName ?? _emergencyName,
        emergencyPhone: emergencyPhone ?? _emergencyPhone,
        emergencyEmail: emergencyEmail ?? _emergencyEmail,
        ticketNumber: ticketNumber ?? _ticketNumber,
        ssrs: ssrs ?? _ssrs,
        seats: seats ?? _seats,
        frequentFlyer: frequentFlyer ?? _frequentFlyer,
        segmentBaggages: segmentBaggages ?? _segmentBaggages,
        paxType: paxType ?? _paxType,
        sequence: sequence ?? _sequence,
      );

  int? get index => _index;

  String? get type => _type;

  String? get title => _title;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  bool? get isSeniorCitizen => _isSeniorCitizen;

  String? get email => _email;

  String? get birthDate => _birthDate;

  String? get gender => _gender;

  String? get homePhone => _homePhone;

  String? get mobilePhone => _mobilePhone;

  dynamic get otherPhone => _otherPhone;

  String? get nationality => _nationality;

  String? get idNumber => _idNumber;

  Passport? get passport => _passport;

  String? get emergencyName => _emergencyName;

  String? get emergencyPhone => _emergencyPhone;

  String? get emergencyEmail => _emergencyEmail;

  String? get ticketNumber => _ticketNumber;

  List<Ssrs>? get ssrs => _ssrs;

  List<FlightSeats>? get seats => _seats;

  dynamic get frequentFlyer => _frequentFlyer;

  dynamic get segmentBaggages => _segmentBaggages;

  String? get paxType => _paxType;

  String? get sequence => _sequence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Index'] = _index;
    map['Type'] = _type;
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['IsSeniorCitizen'] = _isSeniorCitizen;
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
    map['EmergencyFullName'] = _emergencyName;
    map['EmergencyPhone'] = _emergencyPhone;
    map['EmergencyEmail'] = _emergencyEmail;
    map['TicketNumber'] = _ticketNumber;
    if (_ssrs != null) {
      map['Ssrs'] = _ssrs?.map((v) => v.toJson()).toList();
    }
    if (_seats != null) {
      map['Seats'] = _seats?.map((v) => v.toJson()).toList();
    }
    map['FrequentFlyer'] = _frequentFlyer;
    map['SegmentBaggages'] = _segmentBaggages;
    map['paxType'] = _paxType;
    map['sequence'] = _sequence;
    return map;
  }
}

class Passport {
  Passport({
    String? number,
    String? originCountry,
    String? firstName,
    String? lastName,
    dynamic expire,
  }) {
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
  dynamic _expire;

  Passport copyWith({
    String? number,
    String? originCountry,
    String? firstName,
    String? lastName,
    dynamic expire,
  }) =>
      Passport(
        number: number ?? _number,
        originCountry: originCountry ?? _originCountry,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        expire: expire ?? _expire,
      );

  String? get number => _number;

  String? get originCountry => _originCountry;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  dynamic get expire => _expire;

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
