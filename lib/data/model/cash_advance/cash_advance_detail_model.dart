import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cash_advance_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CashAdvanceDetailModel extends Equatable {
  String? key;
  int? id;
  int? idCa;
  int? idItemCa;
  int? idCostCenter;
  int? frequency;
  String? nominal;
  String? total;
  String? itemName;
  String? remarks;
  String? costCenterName;

  CashAdvanceDetailModel(
      {this.id,
      this.key,
      this.idCa,
      this.idItemCa,
      this.frequency,
      this.nominal,
      this.itemName,
      this.remarks,
      this.idCostCenter,
      this.costCenterName,
      this.total});

  factory CashAdvanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CashAdvanceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CashAdvanceDetailModelToJson(this);

  static CashAdvanceDetailModel fromJsonModel(Object? json) =>
      CashAdvanceDetailModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CashAdvanceDetailModel model) =>
      model.toJson();

  static List<CashAdvanceDetailModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList
          .map((json) => CashAdvanceDetailModel.fromJson(json))
          .toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CashAdvanceDetailModel.fromJson(jsonList)];
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
    if (list is List<CashAdvanceDetailModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  @override
  List<Object?> get props => [
        key,
        id,
        idCa,
        idItemCa,
        idCostCenter,
        frequency,
        nominal,
        total,
        itemName,
        remarks,
        costCenterName,
      ];
}
