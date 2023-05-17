import 'package:json_annotation/json_annotation.dart';

part 'cash_advance_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CashAdvanceDetailModel {
  int? id;
  int? idCa;
  int? idItemCa;
  int? frequency;
  String? nominal;
  String? total;

  CashAdvanceDetailModel(
      {this.id,
        this.idCa,
        this.idItemCa,
        this.frequency,
        this.nominal,
        this.total})
  ;

  factory CashAdvanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CashAdvanceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CashAdvanceDetailModelToJson(this);
}
