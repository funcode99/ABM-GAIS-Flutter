// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      employeeName: json['employee_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      snEmployee: json['sn_employee'] as String?,
      email: json['email'] as String?,
      nik: json['nik'] as String?,
      dob: json['dob'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      jenkel: json['jenkel'] as String?,
      idDepartment: json['id_department'] as int?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idJobBand: json['id_job_band'],
      foto: json['foto'] as String?,
      fotoPath: json['foto_path'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      snAtasan1: json['sn_atasan1'] as String?,
      snAtasan2: json['sn_atasan2'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      bandJobName: json['band_job_name'] as String?,
      departementName: json['departement_name'] as String?,
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'employee_name': instance.employeeName,
      'phone_number': instance.phoneNumber,
      'sn_employee': instance.snEmployee,
      'email': instance.email,
      'nik': instance.nik,
      'dob': instance.dob,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'jenkel': instance.jenkel,
      'id_department': instance.idDepartment,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_job_band': instance.idJobBand,
      'foto': instance.foto,
      'foto_path': instance.fotoPath,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'sn_atasan1': instance.snAtasan1,
      'sn_atasan2': instance.snAtasan2,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'band_job_name': instance.bandJobName,
      'departement_name': instance.departementName,
      'company_name': instance.companyName,
    };
