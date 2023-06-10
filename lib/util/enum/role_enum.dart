enum RoleEnum {
  administrator("ADMTR"),
  superAdmin("SUPADM"),
  admin("ADM"),
  receptionist("RCPTN"),
  employee("EMPLY"),
  driver("DRVR");

  const RoleEnum(this.value);

  final String value;
}