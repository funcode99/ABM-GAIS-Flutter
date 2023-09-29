import 'dart:io';
import 'package:gais/data/model/document_delivery/get_document_delivery_byid_model.dart';
import 'package:gais/data/model/document_delivery/get_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/save_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/submit_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/update_document_delivery_model.dart';

abstract class DocumentDeliveryRepository {
  Future<GetDocumentDeliveryModel> getList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
    String? codeStatusDoc,
  );

  Future<GetDocumentDeliveryByidModel> getByID(String id);

  Future<SaveDocumentDeliveryModel> save(
    String idCompanyReceiver,
    String idSiteReceiver,
    String idEmployeeSender,
    String idEmployeeReceiver,
    String idCompanySender,
    String idSiteSender,
    String subject,
    File? attachment,
    String remarks,
  );

  Future<UpdateDocumentDeliveryModel> update(
    String id,
    String idCompanyReceiver,
    String idSiteReceiver,
    String idEmployeeSender,
    String idEmployeeReceiver,
    String idCompanySender,
    String idSiteSender,
    String subject,
    File? attachment,
    String remarks,
    String codeStatusDoc,
  );

  Future delete(String id);

  Future<SubmitDocumentDeliveryModel> submit(String id);

  Future<bool> cancel(dynamic id, String? notes);

  Future<bool> received(dynamic id);

  Future<bool> delivering(dynamic id);

}
