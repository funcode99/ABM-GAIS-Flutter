class EmployeeInfoModel {
  EmployeeInfoModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  EmployeeInfoModel.fromJson(dynamic json) {
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

  EmployeeInfoModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      EmployeeInfoModel(
        success: success ?? _success,
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
    int? id,
    String? employeeName,
    String? name,
    String? phoneNumber,
    String? snEmployee,
    String? email,
    String? nik,
    String? dob,
    String? startDate,
    String? endDate,
    String? jenkel,
    int? idDepartment,
    int? idCompany,
    int? idSite,
    dynamic foto,
    dynamic fotoPath,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
    dynamic deletedAt,
    dynamic snAtasan1,
    dynamic snAtasan2,
    dynamic isRegistered,
    int? idCostCenter,
    dynamic isTerminated,
    dynamic positionCode,
    dynamic positionLevel,
    dynamic positionTittle,
    dynamic positionTitle,
    int? idJobBand,
    String? bandJobName,
    int? idUsers,
    String? siteName,
    String? siteCode,
    String? companyName,
    String? companyCode,
    String? companyLogoPath,
    String? costCenterName,
    String? costCenterCode,
    dynamic departementName,
    dynamic departementCode,
    String? groupCompanyCode,
    String? groupCompanyName,
    String? groupCompanyLogo,
    String? groupCompanyLogoPath,
    String? hotelFare,
    String? mealsRate,
    List<TlkRate>? tlkRate,
    List<FlightClass>? flightClass,
  }) {
    _id = id;
    _employeeName = employeeName;
    _name = name;
    _phoneNumber = phoneNumber;
    _snEmployee = snEmployee;
    _email = email;
    _nik = nik;
    _dob = dob;
    _startDate = startDate;
    _endDate = endDate;
    _jenkel = jenkel;
    _idDepartment = idDepartment;
    _idCompany = idCompany;
    _idSite = idSite;
    _foto = foto;
    _fotoPath = fotoPath;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _snAtasan1 = snAtasan1;
    _snAtasan2 = snAtasan2;
    _isRegistered = isRegistered;
    _idCostCenter = idCostCenter;
    _isTerminated = isTerminated;
    _positionCode = positionCode;
    _positionLevel = positionLevel;
    _positionTittle = positionTittle;
    _positionTitle = positionTitle;
    _idJobBand = idJobBand;
    _bandJobName = bandJobName;
    _idUsers = idUsers;
    _siteName = siteName;
    _siteCode = siteCode;
    _companyName = companyName;
    _companyCode = companyCode;
    _companyLogoPath = companyLogoPath;
    _costCenterName = costCenterName;
    _costCenterCode = costCenterCode;
    _departementName = departementName;
    _departementCode = departementCode;
    _groupCompanyCode = groupCompanyCode;
    _groupCompanyName = groupCompanyName;
    _groupCompanyLogo = groupCompanyLogo;
    _groupCompanyLogoPath = groupCompanyLogoPath;
    _hotelFare = hotelFare;
    _mealsRate = mealsRate;
    _tlkRate = tlkRate;
    _flightClass = flightClass;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _employeeName = json['employee_name'];
    _name = json['name'];
    _phoneNumber = json['phone_number'];
    _snEmployee = json['sn_employee'];
    _email = json['email'];
    _nik = json['nik'];
    _dob = json['dob'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _jenkel = json['jenkel'];
    _idDepartment = json['id_department'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _foto = json['foto'];
    _fotoPath = json['foto_path'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _snAtasan1 = json['sn_atasan_1'];
    _snAtasan2 = json['sn_atasan_2'];
    _isRegistered = json['is_registered'];
    _idCostCenter = json['id_cost_center'];
    _isTerminated = json['is_terminated'];
    _positionCode = json['position_code'];
    _positionLevel = json['position_level'];
    _positionTittle = json['position_tittle'];
    _positionTitle = json['position_title'];
    _idJobBand = json['id_job_band'];
    _bandJobName = json['band_job_name'];
    _idUsers = json['id_users'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _companyLogoPath = json['company_logo_path'];
    _costCenterName = json['cost_center_name'];
    _costCenterCode = json['cost_center_code'];
    _departementName = json['departement_name'];
    _departementCode = json['departement_code'];
    _groupCompanyCode = json['group_company_code'];
    _groupCompanyName = json['group_company_name'];
    _groupCompanyLogo = json['group_company_logo'];
    _groupCompanyLogoPath = json['group_company_logo_path'];
    _hotelFare = json['hotel_fare'];
    _mealsRate = json['meals_rate'];
    if (json['tlk_rate'] != null) {
      _tlkRate = [];
      json['tlk_rate'].forEach((v) {
        _tlkRate?.add(TlkRate.fromJson(v));
      });
    }
    if (json['flight_class'] != null) {
      _flightClass = [];
      json['flight_class'].forEach((v) {
        _flightClass?.add(FlightClass.fromJson(v));
      });
    }
  }

  int? _id;
  String? _employeeName;
  String? _name;
  String? _phoneNumber;
  String? _snEmployee;
  String? _email;
  String? _nik;
  String? _dob;
  String? _startDate;
  String? _endDate;
  String? _jenkel;
  int? _idDepartment;
  int? _idCompany;
  int? _idSite;
  dynamic _foto;
  dynamic _fotoPath;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  dynamic _snAtasan1;
  dynamic _snAtasan2;
  dynamic _isRegistered;
  int? _idCostCenter;
  dynamic _isTerminated;
  dynamic _positionCode;
  dynamic _positionLevel;
  dynamic _positionTittle;
  dynamic _positionTitle;
  int? _idJobBand;
  String? _bandJobName;
  int? _idUsers;
  String? _siteName;
  String? _siteCode;
  String? _companyName;
  String? _companyCode;
  String? _companyLogoPath;
  String? _costCenterName;
  String? _costCenterCode;
  dynamic _departementName;
  dynamic _departementCode;
  String? _groupCompanyCode;
  String? _groupCompanyName;
  String? _groupCompanyLogo;
  String? _groupCompanyLogoPath;
  String? _hotelFare;
  String? _mealsRate;
  List<TlkRate>? _tlkRate;
  List<FlightClass>? _flightClass;

  Data copyWith({
    int? id,
    String? employeeName,
    String? phoneNumber,
    String? snEmployee,
    String? email,
    String? nik,
    String? dob,
    String? startDate,
    String? endDate,
    String? jenkel,
    int? idDepartment,
    int? idCompany,
    int? idSite,
    dynamic foto,
    dynamic fotoPath,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
    dynamic deletedAt,
    dynamic snAtasan1,
    dynamic snAtasan2,
    dynamic isRegistered,
    int? idCostCenter,
    dynamic isTerminated,
    dynamic positionCode,
    dynamic positionLevel,
    dynamic positionTittle,
    int? idJobBand,
    String? bandJobName,
    int? idUsers,
    String? siteName,
    String? siteCode,
    String? companyName,
    String? companyCode,
    String? companyLogoPath,
    String? costCenterName,
    String? costCenterCode,
    dynamic departementName,
    dynamic departementCode,
    String? groupCompanyCode,
    String? groupCompanyName,
    String? groupCompanyLogo,
    String? groupCompanyLogoPath,
    String? hotelFare,
    String? mealsRate,
    List<TlkRate>? tlkRate,
    List<FlightClass>? flightClass,
  }) =>
      Data(
        id: id ?? _id,
        employeeName: employeeName ?? _employeeName,
        name: name ?? _name,
        phoneNumber: phoneNumber ?? _phoneNumber,
        snEmployee: snEmployee ?? _snEmployee,
        email: email ?? _email,
        nik: nik ?? _nik,
        dob: dob ?? _dob,
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        jenkel: jenkel ?? _jenkel,
        idDepartment: idDepartment ?? _idDepartment,
        idCompany: idCompany ?? _idCompany,
        idSite: idSite ?? _idSite,
        foto: foto ?? _foto,
        fotoPath: fotoPath ?? _fotoPath,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
        deletedAt: deletedAt ?? _deletedAt,
        snAtasan1: snAtasan1 ?? _snAtasan1,
        snAtasan2: snAtasan2 ?? _snAtasan2,
        isRegistered: isRegistered ?? _isRegistered,
        idCostCenter: idCostCenter ?? _idCostCenter,
        isTerminated: isTerminated ?? _isTerminated,
        positionCode: positionCode ?? _positionCode,
        positionLevel: positionLevel ?? _positionLevel,
        positionTittle: positionTittle ?? _positionTittle,
        positionTitle: positionTitle ?? _positionTitle,
        idJobBand: idJobBand ?? _idJobBand,
        bandJobName: bandJobName ?? _bandJobName,
        idUsers: idUsers ?? _idUsers,
        siteName: siteName ?? _siteName,
        siteCode: siteCode ?? _siteCode,
        companyName: companyName ?? _companyName,
        companyCode: companyCode ?? _companyCode,
        companyLogoPath: companyLogoPath ?? _companyLogoPath,
        costCenterName: costCenterName ?? _costCenterName,
        costCenterCode: costCenterCode ?? _costCenterCode,
        departementName: departementName ?? _departementName,
        departementCode: departementCode ?? _departementCode,
        groupCompanyCode: groupCompanyCode ?? _groupCompanyCode,
        groupCompanyName: groupCompanyName ?? _groupCompanyName,
        groupCompanyLogo: groupCompanyLogo ?? _groupCompanyLogo,
        groupCompanyLogoPath: groupCompanyLogoPath ?? _groupCompanyLogoPath,
        hotelFare: hotelFare ?? _hotelFare,
        mealsRate: mealsRate ?? _mealsRate,
        tlkRate: tlkRate ?? _tlkRate,
        flightClass: flightClass ?? _flightClass,
      );

  int? get id => _id;

  String? get employeeName => _employeeName;

  String? get name => _name;

  String? get phoneNumber => _phoneNumber;

  String? get snEmployee => _snEmployee;

  String? get email => _email;

  String? get nik => _nik;

  String? get dob => _dob;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get jenkel => _jenkel;

  int? get idDepartment => _idDepartment;

  int? get idCompany => _idCompany;

  int? get idSite => _idSite;

  dynamic get foto => _foto;

  dynamic get fotoPath => _fotoPath;

  dynamic get createdAt => _createdAt;

  dynamic get createdBy => _createdBy;

  dynamic get updatedAt => _updatedAt;

  dynamic get updatedBy => _updatedBy;

  dynamic get deletedAt => _deletedAt;

  dynamic get snAtasan1 => _snAtasan1;

  dynamic get snAtasan2 => _snAtasan2;

  dynamic get isRegistered => _isRegistered;

  int? get idCostCenter => _idCostCenter;

  dynamic get isTerminated => _isTerminated;

  dynamic get positionCode => _positionCode;

  dynamic get positionLevel => _positionLevel;

  dynamic get positionTittle => _positionTittle;

  dynamic get positionTitle => _positionTitle;

  int? get idJobBand => _idJobBand;

  String? get bandJobName => _bandJobName;

  int? get idUsers => _idUsers;

  String? get siteName => _siteName;

  String? get siteCode => _siteCode;

  String? get companyName => _companyName;

  String? get companyCode => _companyCode;

  String? get companyLogoPath => _companyLogoPath;

  String? get costCenterName => _costCenterName;

  String? get costCenterCode => _costCenterCode;

  dynamic get departementName => _departementName;

  dynamic get departementCode => _departementCode;

  String? get groupCompanyCode => _groupCompanyCode;

  String? get groupCompanyName => _groupCompanyName;

  String? get groupCompanyLogo => _groupCompanyLogo;

  String? get groupCompanyLogoPath => _groupCompanyLogoPath;

  String? get hotelFare => _hotelFare;

  String? get mealsRate => _mealsRate;

  List<TlkRate>? get tlkRate => _tlkRate;

  List<FlightClass>? get flightClass => _flightClass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['employee_name'] = _employeeName;
    map['name'] = _name;
    map['phone_number'] = _phoneNumber;
    map['sn_employee'] = _snEmployee;
    map['email'] = _email;
    map['nik'] = _nik;
    map['dob'] = _dob;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['jenkel'] = _jenkel;
    map['id_department'] = _idDepartment;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['foto'] = _foto;
    map['foto_path'] = _fotoPath;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['sn_atasan_1'] = _snAtasan1;
    map['sn_atasan_2'] = _snAtasan2;
    map['is_registered'] = _isRegistered;
    map['id_cost_center'] = _idCostCenter;
    map['is_terminated'] = _isTerminated;
    map['position_code'] = _positionCode;
    map['position_level'] = _positionLevel;
    map['position_tittle'] = _positionTittle;
    map['position_title'] = _positionTitle;
    map['id_job_band'] = _idJobBand;
    map['band_job_name'] = _bandJobName;
    map['id_users'] = _idUsers;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['company_logo_path'] = _companyLogoPath;
    map['cost_center_name'] = _costCenterName;
    map['cost_center_code'] = _costCenterCode;
    map['departement_name'] = _departementName;
    map['departement_code'] = _departementCode;
    map['group_company_code'] = _groupCompanyCode;
    map['group_company_name'] = _groupCompanyName;
    map['group_company_logo'] = _groupCompanyLogo;
    map['group_company_logo_path'] = _groupCompanyLogoPath;
    map['hotel_fare'] = _hotelFare;
    map['meals_rate'] = _mealsRate;
    if (_tlkRate != null) {
      map['tlk_rate'] = _tlkRate?.map((v) => v.toJson()).toList();
    }
    if (_flightClass != null) {
      map['flight_class'] = _flightClass?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FlightClass {
  FlightClass({
    int? idFlightClass,
    String? flightClass,
  }) {
    _idFlightClass = idFlightClass;
    _flightClass = flightClass;
  }

  set idFlightClass(int value) {
    _idFlightClass = value;
  }

  FlightClass.fromJson(dynamic json) {
    _idFlightClass = json['id_flight_class'];
    _flightClass = json['flight_class'];
  }

  int? _idFlightClass;
  String? _flightClass;

  FlightClass copyWith({
    int? idFlightClass,
    String? flightClass,
  }) =>
      FlightClass(
        idFlightClass: idFlightClass ?? _idFlightClass,
        flightClass: flightClass ?? _flightClass,
      );

  int get idFlightClass => _idFlightClass!;

  String get flightClass => _flightClass!;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_flight_class'] = _idFlightClass;
    map['flight_class'] = _flightClass;
    return map;
  }

  set flightClass(String value) {
    _flightClass = value;
  }
}

class TlkRate {
  TlkRate({
    String? tlk,
    String? zonaName,
  }) {
    _tlk = tlk;
    _zonaName = zonaName;
  }

  TlkRate.fromJson(dynamic json) {
    _tlk = json['tlk'];
    _zonaName = json['zona_name'];
  }

  String? _tlk;
  String? _zonaName;

  TlkRate copyWith({
    String? tlk,
    String? zonaName,
  }) =>
      TlkRate(
        tlk: tlk ?? _tlk,
        zonaName: zonaName ?? _zonaName,
      );

  String? get tlk => _tlk;

  String? get zonaName => _zonaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tlk'] = _tlk;
    map['zona_name'] = _zonaName;
    return map;
  }
}
