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

  Future<GetDocumentDeliveryByidModel> getByID(int id);

  Future<SaveDocumentDeliveryModel> save(
    int idCompanyReceiver,
    int idSiteReceiver,
    int idEmployeeSender,
    int idEmployeeReceiver,
    int idCompanySender,
    int idSiteSender,
    String subject,
    File? attachment,
    String remarks,
  );

  Future<UpdateDocumentDeliveryModel> update(
    int id,
    int idCompanyReceiver,
    String idSiteReceiver,
    int idEmployeeSender,
    int idEmployeeReceiver,
    int idCompanySender,
    int idSiteSender,
    String subject,
    File? attachment,
    String remarks,
    int codeStatusDoc,
  );

  Future delete(String id);

  Future<SubmitDocumentDeliveryModel> submit(int id);
}
