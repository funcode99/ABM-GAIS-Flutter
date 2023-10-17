import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/employee_info_model.dart' as info;
import 'package:gais/data/model/temp_filled_model.dart';
import 'package:gais/util/ext/string_ext.dart';

class StorageCore {
  static const String userID = "userID";
  static const String companyID = "companyID";
  static const String departmentID = "departmentID";
  static const String employeeName = "name";
  static const String companyName = "companyName";
  static const String siteName = "site";
  static const String siteID = "siteID";
  static const String roleName = "roleName";
  static const String roleID = "roleID";
  static const String costCenterID = "costCenterID";
  static const String codeRole = "codeRole";
  static const String snEmployee = "sn";
  static const String tlkRate = 'tlkRate';
  static const String isEmployee = 'isEmployee';
  static const String isCrewing = 'isCrewing';
  static const String filePath = 'filePath';
  static const String jobBandName = 'jobBand';
  static const String jobBandID = 'jobBandID';

  final storage = const FlutterSecureStorage();

  void saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  void saveId(String id) async {
    await storage.write(key: 'id', value: id);
  }

  void saveRole(String roleID, String isEmployee, String idApprovalAuth) async {
    await storage.write(key: 'roleID', value: roleID);
    await storage.write(key: 'isEmployee', value: isEmployee);
    await storage.write(key: 'ApprovalAuthID', value: idApprovalAuth);
  }

  void saveUser(
    String id,
    String name,
    String phone,
    String sn,
    String email,
    String nik,
    String dob,
    String startDate,
    String endDate,
    String gender,
    String idDepartment,
    String idCompany,
    String companyName,
    String companyCode,
    String idSite,
    String site,
    String siteCode,
    String idJobBand,
    String bandJobName,
    String? foto,
    String? fotoPath,
    String idFlightClass,
    String flightClass,
    String hotelFare,
    String mealsFare,
    String idCostCenter,
    String tlkRate,
  ) async {
    await storage.write(key: 'userID', value: id);
    await storage.write(key: 'name', value: name);
    await storage.write(key: 'phone', value: phone);
    await storage.write(key: 'sn', value: sn);
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'nik', value: nik);
    await storage.write(key: 'dob', value: dob);
    await storage.write(key: 'startDate', value: startDate);
    await storage.write(key: 'endDate', value: endDate);
    await storage.write(key: 'gender', value: gender);
    await storage.write(key: 'departmentID', value: idDepartment);
    await storage.write(key: 'companyID', value: idCompany);
    await storage.write(key: 'companyName', value: companyName);
    await storage.write(key: 'companyCode', value: companyCode);
    await storage.write(key: 'siteID', value: idSite);
    await storage.write(key: 'site', value: site);
    await storage.write(key: 'siteCode', value: siteCode);
    await storage.write(key: 'jobBandID', value: idJobBand);
    await storage.write(key: 'jobBand', value: bandJobName);
    await storage.write(key: 'foto', value: foto);
    await storage.write(key: 'fotoPath', value: fotoPath);
    await storage.write(key: 'flightClassID', value: idFlightClass);
    await storage.write(key: 'flightClass', value: flightClass);
    await storage.write(key: 'hotelFare', value: hotelFare);
    await storage.write(key: 'mealsFare', value: mealsFare);
    await storage.write(key: 'costCenterID', value: idCostCenter);
    await storage.write(key: 'tlkRate', value: tlkRate);
  }

  void deleteToken() async {
    await storage.delete(key: 'token');
    await storage.deleteAll();
  }

  Future<String?> readToken() async {
    var token = await storage.read(key: 'token');
    return token;
  }

  Future<String?> readRole() async {
    var role = await storage.read(key: 'roleID');
    return role;
  }

  Future<int?> readID() async {
    var id = await storage.read(key: 'userID');
    return id!.toInt();
  }

  Future<List<info.Data>> readEmployeeInfo() async {
    List<info.Data> employee = [];
    employee.add(info.Data(
      id: int.parse(await storage.read(key: 'userID') ?? "0"),
      employeeName: await storage.read(key: 'name'),
      snEmployee: await storage.read(key: 'sn'),
      phoneNumber: await storage.read(key: 'phone'),
      email: await storage.read(key: 'email'),
      nik: await storage.read(key: 'nik'),
      dob: await storage.read(key: 'dob'),
      startDate: await storage.read(key: 'startDate'),
      endDate: await storage.read(key: 'endDate'),
      jenkel: await storage.read(key: 'gender'),
      idDepartment: int.parse(await storage.read(key: 'departmentID') ?? "0"),
      idCompany: int.parse(await storage.read(key: 'companyID') ?? "0"),
      companyName: await storage.read(key: "companyName"),
      companyCode: await storage.read(key: 'companyCode'),
      idSite: int.parse(await storage.read(key: 'siteID') ?? "0"),
      siteName: await storage.read(key: 'site'),
      siteCode: await storage.read(key: 'siteCode'),
      idJobBand: int.parse(await storage.read(key: 'jobBandID') ?? "0"),
      bandJobName: await storage.read(key: 'jobBand'),
      foto: await storage.read(key: 'foto'),
      fotoPath: await storage.read(key: 'fotoPath'),
      // idFlightClass: int.parse(await storage.read(key: 'flightClassID') ?? "0"),
      // flightClass: await storage.read(key: 'flightClass'),
      hotelFare: await storage.read(key: 'hotelFare'),
      mealsRate: await storage.read(key: 'mealsFare'),
    ));
    return employee;
  }

  Future<List<info.FlightClass>> readEmployeeFlight() async {
    List<info.FlightClass> flight = [];
    flight.add(info.FlightClass(
      idFlightClass: int.parse(await storage.read(key: 'flightClassID') ?? "0"),
      flightClass: await storage.read(key: 'flightClass'),
    ));
    return flight;
  }

  Future<bool> ensureStorageReady() async {
    return await storage.read(key: 'token') != null;
  }

  Future<void> writeString(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  Future<String> readString(String key) async {
    return await storage.read(key: key) ?? "";
  }

  void tempIsFilled(
    String? purposeOfTrip,
    String? traveller,
    String? airliness,
    String? taxiVoucher,
    String? otherTransport,
    String? accommodation,
    String? cashAdvance,
  ) async {
    await storage.write(key: "purposeOfTrip", value: purposeOfTrip);
    await storage.write(key: "traveller", value: traveller);
    await storage.write(key: "airliness", value: airliness);
    await storage.write(key: "taxiVoucher", value: taxiVoucher);
    await storage.write(key: "otherTransport", value: otherTransport);
    await storage.write(key: "accommodation", value: accommodation);
    await storage.write(key: "cashAdvance", value: cashAdvance);
  }

  Future<List<TempFilledModel>> getFilledProgress() async {
    return [];
  }
}
