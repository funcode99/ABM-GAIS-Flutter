import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BrandModel {
  int? id;
  String? brandName;
  int? idCompany;
  int? idSite;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;

  BrandModel({
    this.id,
    this.brandName,
    this.idCompany,
    this.idSite,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.companyName,
    this.companyCode,
    this.siteName,
    this.siteCode,
  });

  static BrandModel fromJsonModel(Object? json) =>
      BrandModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(BrandModel model) =>
      model.toJson();

  static List<BrandModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => BrandModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [BrandModel.fromJson(jsonList)];
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
    if (list is List<BrandModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}