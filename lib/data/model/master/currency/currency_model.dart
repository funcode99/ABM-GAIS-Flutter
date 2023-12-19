import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrencyModel {
  int? no;
  int? id;
  String? currencyName;
  String? currencySymbol;
  String? currencyCode;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  CurrencyModel({
    this.no,
    this.id,
    this.currencyName,
    this.currencySymbol,
    this.currencyCode,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy
  });

  static CurrencyModel fromJsonModel(Object? json) =>
      CurrencyModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CurrencyModel model) =>
      model.toJson();

  static List<CurrencyModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CurrencyModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CurrencyModel.fromJson(jsonList)];
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
    if (list is List<CurrencyModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}