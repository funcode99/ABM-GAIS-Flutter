enum RoleEnum {
  administrator("ADMTR"),
  superAdmin("SUPADM"),
  admin("ADM"),
  receptionist("RCPTN"),
  employee("EMPLY"),
  driver("DRVR"),
  secretary("SCTR");

  const RoleEnum(this.value);

  final String value;
}