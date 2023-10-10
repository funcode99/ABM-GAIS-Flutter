class ContactModel {
  ContactModel({
    String? title,
    String? firstName,
    String? lastName,
    String? email,
    String? mobilePhone,
    String? homePhone,
    String? workPhone,
    String? otherPhone,
    String? address,
    String? city,
    String? provinceState,
    String? postalCode,
  }) {
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobilePhone = mobilePhone;
    _homePhone = homePhone;
    _workPhone = workPhone;
    _otherPhone = otherPhone;
    _address = address;
    _city = city;
    _provinceState = provinceState;
    _postalCode = postalCode;
  }

  ContactModel.fromJson(dynamic json) {
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _email = json['Email'];
    _mobilePhone = json['MobilePhone'];
    _homePhone = json['HomePhone'];
    _workPhone = json['WorkPhone'];
    _otherPhone = json['OtherPhone'];
    _address = json['Address'];
    _city = json['City'];
    _provinceState = json['ProvinceState'];
    _postalCode = json['PostalCode'];
  }

  String? _title;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobilePhone;
  String? _homePhone;
  String? _workPhone;
  String? _otherPhone;
  String? _address;
  String? _city;
  String? _provinceState;
  String? _postalCode;

  ContactModel copyWith({
    String? title,
    String? firstName,
    String? lastName,
    String? email,
    String? mobilePhone,
    String? homePhone,
    String? workPhone,
    String? otherPhone,
    String? address,
    String? city,
    String? provinceState,
    String? postalCode,
  }) =>
      ContactModel(
        title: title ?? _title,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        mobilePhone: mobilePhone ?? _mobilePhone,
        homePhone: homePhone ?? _homePhone,
        workPhone: workPhone ?? _workPhone,
        otherPhone: otherPhone ?? _otherPhone,
        address: address ?? _address,
        city: city ?? _city,
        provinceState: provinceState ?? _provinceState,
        postalCode: postalCode ?? _postalCode,
      );

  String? get title => _title;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get mobilePhone => _mobilePhone;

  String? get homePhone => _homePhone;

  String? get workPhone => _workPhone;

  String? get otherPhone => _otherPhone;

  String? get address => _address;

  String? get city => _city;

  String? get provinceState => _provinceState;

  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Email'] = _email;
    map['MobilePhone'] = _mobilePhone;
    map['HomePhone'] = _homePhone;
    map['WorkPhone'] = _workPhone;
    map['OtherPhone'] = _otherPhone;
    map['Address'] = _address;
    map['City'] = _city;
    map['ProvinceState'] = _provinceState;
    map['PostalCode'] = _postalCode;
    return map;
  }
}
