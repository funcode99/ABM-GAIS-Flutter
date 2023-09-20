import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_atk_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RequestATKDetailModel extends Equatable {
  String? key;
  int? id;
  dynamic idAtkRequest;
  dynamic idItem;
  int? idWarehouse;
  int? idBrand;
  int? codeStatusDoc;
  dynamic idUom;
  dynamic qty;
  dynamic qtyApproved;
  dynamic qtyUnsend;
  dynamic qtyDelivered;
  String? remarks;
  String? remarksDetail;
  String? remarksHeader;
  String? notes;
  String? notesDelivered;
  String? notesRejected;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? itemName;
  String? codeItem;
  String? brandName;
  String? uomName;
  String? warehouseName;
  List<dynamic>? arrayWarehouse;

  RequestATKDetailModel({
    this.key,
    this.id,
    this.idWarehouse,
    this.idAtkRequest,
    this.idItem,
    this.idBrand,
    this.idUom,
    this.qty,
    this.qtyApproved,
    this.qtyUnsend,
    this.qtyDelivered,
    this.codeStatusDoc,
    this.remarks,
    this.remarksDetail,
    this.remarksHeader,
    this.notes,
    this.notesDelivered,
    this.notesRejected,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.itemName,
    this.codeItem,
    this.brandName,
    this.uomName,
    this.warehouseName,
    this.arrayWarehouse,
  });

  factory RequestATKDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RequestATKDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestATKDetailModelToJson(this);

  static RequestATKDetailModel fromJsonModel(Object? json) =>
      RequestATKDetailModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(RequestATKDetailModel model) =>
      model.toJson();

  static List<RequestATKDetailModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList
          .map((json) => RequestATKDetailModel.fromJson(json))
          .toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [RequestATKDetailModel.fromJson(jsonList)];
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
    if (list is List<RequestATKDetailModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  @override
  List<Object?> get props => [
          key,
          id,
          idAtkRequest,
          idItem,
          idWarehouse,
          idBrand,
          codeStatusDoc,
          idUom,
          qty,
          qtyApproved,
          qtyUnsend,
          qtyDelivered,
          remarks,
          remarksDetail,
          remarksHeader,
          notes,
          notesDelivered,
          notesRejected,
          createdAt,
          createdBy,
          updatedAt,
          updatedBy,
          itemName,
          codeItem,
          brandName,
          uomName,
          warehouseName,
          arrayWarehouse,
      ];
}
