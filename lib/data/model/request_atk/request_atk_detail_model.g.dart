// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_atk_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestATKDetailModel _$RequestATKDetailModelFromJson(
        Map<String, dynamic> json) =>
    RequestATKDetailModel(
      key: json['key'] as String?,
      id: json['id'],
      idWarehouse: json['id_warehouse'] as int?,
      idAtkRequest: json['id_atk_request'],
      idItem: json['id_item'],
      idBrand: json['id_brand'] as int?,
      idUom: json['id_uom'],
      qty: json['qty'],
      qtyApproved: json['qty_approved'],
      qtyUnsend: json['qty_unsend'],
      qtyDelivered: json['qty_delivered'],
      codeStatusDoc: json['code_status_doc'] as int?,
      remarks: json['remarks'] as String?,
      remarksDetail: json['remarks_detail'] as String?,
      remarksHeader: json['remarks_header'] as String?,
      notes: json['notes'] as String?,
      notesDelivered: json['notes_delivered'] as String?,
      notesRejected: json['notes_rejected'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      itemName: json['item_name'] as String?,
      codeItem: json['code_item'] as String?,
      brandName: json['brand_name'] as String?,
      uomName: json['uom_name'] as String?,
      warehouseName: json['warehouse_name'] as String?,
      arrayWarehouse: json['array_warehouse'] as List<dynamic>?,
    );

Map<String, dynamic> _$RequestATKDetailModelToJson(
        RequestATKDetailModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'id_atk_request': instance.idAtkRequest,
      'id_item': instance.idItem,
      'id_warehouse': instance.idWarehouse,
      'id_brand': instance.idBrand,
      'code_status_doc': instance.codeStatusDoc,
      'id_uom': instance.idUom,
      'qty': instance.qty,
      'qty_approved': instance.qtyApproved,
      'qty_unsend': instance.qtyUnsend,
      'qty_delivered': instance.qtyDelivered,
      'remarks': instance.remarks,
      'remarks_detail': instance.remarksDetail,
      'remarks_header': instance.remarksHeader,
      'notes': instance.notes,
      'notes_delivered': instance.notesDelivered,
      'notes_rejected': instance.notesRejected,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'item_name': instance.itemName,
      'code_item': instance.codeItem,
      'brand_name': instance.brandName,
      'uom_name': instance.uomName,
      'warehouse_name': instance.warehouseName,
      'array_warehouse': instance.arrayWarehouse,
    };
