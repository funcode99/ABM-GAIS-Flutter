import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageCore {
  static const String userID = "userID";

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
    String idSite,
    String site,
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
    await storage.write(key: 'siteID', value: idSite);
    await storage.write(key: 'site', value: site);
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

  Future<List> readEmployeeInfo() async {
    var employee = [];
    employee.add(await storage.read(key: 'userID'));
    employee.add(await storage.read(key: 'name'));
    employee.add(await storage.read(key: 'phone'));
    employee.add(await storage.read(key: 'sn'));
    employee.add(await storage.read(key: 'email'));
    employee.add(await storage.read(key: 'nik'));
    employee.add(await storage.read(key: 'dob'));
    employee.add(await storage.read(key: 'startDate'));
    employee.add(await storage.read(key: 'endDate'));
    employee.add(await storage.read(key: 'gender'));
    employee.add(await storage.read(key: 'departmentID'));
    employee.add(await storage.read(key: 'companyID'));
    employee.add(await storage.read(key: 'siteID'));
    employee.add(await storage.read(key: 'site'));
    return employee;
  }

  Future<bool> ensureStorageReady() async {
    return await storage.read(key: 'token') != null;
  }

  Future<String> readString(String key)async{
    return await storage.read(key: key) ?? "";
  }
}
