import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CompanyModel {
  int? no;
  dynamic id;
  String? companyCode;
  String? companyName;
  String? shortName;
  String? groupCompany;
  String? codeErp;
  String? logo;
  String? logoPath;
  int? idVendor;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? vendor;

  CompanyModel({
    this.no,
    this.id,
    this.companyCode,
    this.companyName,
    this.shortName,
    this.groupCompany,
    this.codeErp,
    this.logo,
    this.logoPath,
    this.idVendor,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.vendor,
  });

  static CompanyModel fromJsonModel(Object? json) =>
      CompanyModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CompanyModel model) =>
      model.toJson();

  static List<CompanyModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CompanyModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CompanyModel.fromJson(jsonList)];
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
    if (list is List<CompanyModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}