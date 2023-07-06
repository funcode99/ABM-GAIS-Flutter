import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PaginationModel {
  int? currentPage;
  int? from;
  int? lastPage;
  dynamic perPage;
  int? to;
  int? total;
  List<dynamic>? data;

  PaginationModel({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
    this.data,
  });

  static PaginationModel fromJsonModel(Object? json) =>
      PaginationModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(PaginationModel model) =>
      model.toJson();


  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);


}
