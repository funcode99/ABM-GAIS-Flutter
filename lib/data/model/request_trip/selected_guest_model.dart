class SelectedGuestModel {
  bool? isSelected;
  String name;
  String? value;
  String? gender;
  String? sn;
  String? phone;
  String? departmentID;
  String? department;
  String? companyID;
  String? company;
  String? maxFareValue;
  String? maxFare;
  String? flightValue;
  String? flightEntitlement;
  String? nik;

  SelectedGuestModel({
    required this.name,
    this.value,
    this.isSelected,
    this.gender,
    this.sn,
    this.phone,
    this.departmentID,
    this.department,
    this.companyID,
    this.company,
    this.maxFareValue,
    this.maxFare,
    this.flightValue,
    this.flightEntitlement,
    this.nik,
  });
}
