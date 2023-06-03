import 'package:json_annotation/json_annotation.dart';

part 'site_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SiteModel {
  int? no;
  int? id;
  String? siteName;
  String? siteCode;
  int? idCompany;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? companyName;
  String? companyCode;

  SiteModel({
    this.no,
    this.id,
    this.siteName,
    this.siteCode,
    this.idCompany,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.companyName,
    this.companyCode,
  });

  static SiteModel fromJsonModel(Object? json) =>
      SiteModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(SiteModel model) =>
      model.toJson();

  static List<SiteModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => SiteModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [SiteModel.fromJson(jsonList)];
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
    if (list is List<SiteModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory SiteModel.fromJson(Map<String, dynamic> json) =>
      _$SiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteModelToJson(this);
}