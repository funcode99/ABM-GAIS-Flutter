import 'package:gais/base/base_controller.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/enum/role_enum.dart';

class MenuGaisController extends BaseController {
  bool approvalAuth = false;
  bool receptionis = false;
  bool isAdmin = false;
  bool isAdministrator = false;
  bool isSuperAdmin = false;
  bool isEmployee = false;
  bool isPayroll = false;

  @override
  void onInit() {
    super.onInit();
    cekRole();
  }

  Future<void> cekRole() async {
    String codeRole = await storage.readString(StorageCore.codeRole);

    approvalAuth = await storage.readRole() == "1" || await storage.readRole() == "2" || await storage.readRole() == "3" ? true : false;
    receptionis = await storage.readRole() == "4" ? true : false;
    isAdministrator = await storage.readRole() == "1"  ? true : false;
    isSuperAdmin = await storage.readRole() == "2" ? true : false;
    isEmployee = await storage.readRole() == "5" ? true : false;
    isAdmin = await storage.readRole() == "3" ? true : false;

    isPayroll = codeRole == RoleEnum.payroll.value;

    update();
  }
}
