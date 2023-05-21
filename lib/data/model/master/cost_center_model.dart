import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cost_center_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CostCenterModel extends Equatable{
  final int? id;
  final String? costCenterName;

  const CostCenterModel({this.id, this.costCenterName});

  @override
  List<Object?> get props => [id, costCenterName];
}