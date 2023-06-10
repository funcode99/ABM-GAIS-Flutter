import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/employee_info_model.dart' as info;
import 'package:gais/data/model/temp_filled_model.dart';

class StorageCore {
  static const String userID = "userID";
  static const String companyID = "companyID";
  static const String departmentID = "departmentID";
  static const String employeeName = "employeeName";
  static const String companyName = "companyName";
  static const String siteName = "site";
  static const String siteID = "siteID";
  static const String roleName = "roleName";
  static const String codeRole = "codeRole";

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
      String idSite,
      String site,
      String idJobBand,
      String? foto,
      String? fotoPath,
      String bandJobName,
      String flightClass) async {
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
    await storage.write(key: 'siteID', value: idSite);
    await storage.write(key: 'site', value: site);
    await storage.write(key: 'jobBandID', value: idJobBand);
    await storage.write(key: 'jobBand', value: bandJobName);
    await storage.write(key: 'foto', value: foto);
    await storage.write(key: 'fotoPath', value: fotoPath);
    await storage.write(key: 'flightClass', value: flightClass);
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
        idSite: int.parse(await storage.read(key: 'siteID') ?? "0"),
        siteName: await storage.read(key: 'site'),
        idJobBand: int.parse(await storage.read(key: 'jobBandID') ?? "0"),
        bandJobName: await storage.read(key: 'jobBand'),
        foto: await storage.read(key: 'foto'),
        fotoPath: await storage.read(key: 'fotoPath'),
        flightClass: await storage.read(key: 'flightClass')));
    return employee;
  }

  Future<bool> ensureStorageReady() async {
    return await storage.read(key: 'token') != null;
  }

  Future<void> writeString(String key, String value)async{
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
