import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EmployeeModel extends Equatable{
  int? no;
  dynamic id;
  String? employeeName;
  String? phoneNumber;
  String? snEmployee;
  String? email;
  String? nik;
  String? dob;
  String? startDate;
  String? endDate;
  String? jenkel;
  int? idDepartment;
  int? idCompany;
  int? idSite;
  dynamic idJobBand;
  String? foto;
  dynamic fotoPath;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  String? snAtasan1;
  String? snAtasan2;
  String? companyCode;
  String? siteName;
  String? siteCode;
  String? bandJobName;
  String? departementName;
  String? companyName;

  EmployeeModel({
    this.no,
    this.id,
    this.employeeName,
    this.phoneNumber,
    this.snEmployee,
    this.email,
    this.nik,
    this.dob,
    this.startDate,
    this.endDate,
    this.jenkel,
    this.idDepartment,
    this.idCompany,
    this.idSite,
    this.idJobBand,
    this.foto,
    this.fotoPath,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.snAtasan1,
    this.snAtasan2,
    this.companyCode,
    this.siteName,
    this.siteCode,
    this.bandJobName,
    this.departementName,
    this.companyName,
  });

  static EmployeeModel fromJsonModel(Object? json) =>
      EmployeeModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(EmployeeModel model) =>
      model.toJson();

  static List<EmployeeModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => EmployeeModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [EmployeeModel.fromJson(jsonList)];
    }

    // We really shouldn't be here
    throw ArgumentError.value(
        jsonList,
        'jsonList',
        'fromJsonModelList cannot handle'
            ' this JSON payload. Please add a handler for this input or use the correct '
            'helper method.');
  }

  static List<Map<String, dynamic>> toJsonModelList(Object list) {
    if (list is List<EmployeeModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
    no,
    id,
    employeeName,
    phoneNumber,
    snEmployee,
    email,
    nik,
    dob,
    startDate,
    endDate,
    jenkel,
    idDepartment,
    idCompany,
    idSite,
    idJobBand,
    foto,
    fotoPath,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
    deletedAt,
    snAtasan1,
    snAtasan2,
    companyCode,
    siteName,
    siteCode,
    bandJobName,
    departementName,
    companyName,
  ];
}