import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/document_delivery/get_document_delivery_byid_model.dart';
import 'package:gais/data/model/document_delivery/get_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/save_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/submit_document_delivery_model.dart';
import 'package:gais/data/model/document_delivery/update_document_delivery_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/document_delivery/document_delivery_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class DocumentDeliveryImpl implements DocumentDeliveryRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future delete(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/document_delivery/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetDocumentDeliveryModel> getList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
    String? codeStatusDoc,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo(info: "search");
    startDate.printInfo(info: "star date");
    endDate.printInfo(info: "end date");
    codeStatusDoc.printInfo(info: "filter");
    try {
      Response response = await network.dio.get(
        "/api/document_delivery/get",
        queryParameters: {
          "perPage": perPage,
          "page": page,
          "search": search,
          "start_date": startDate,
          "end_date": endDate,
          "code_status_doc": codeStatusDoc
        },
      );
      GetDocumentDeliveryModel.fromJson(response.data).data?.total.printInfo();
      return GetDocumentDeliveryModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.response?.data;
    }
  }

  @override
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
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_employee_receiver": idEmployeeReceiver,
      "id_company_receiver": idCompanyReceiver,
      "id_site_receiver": idSiteReceiver,
      "id_employee_sender": idEmployeeSender,
      "id_company": idCompanySender,
      "id_site": idSiteSender,
      "subject": subject,
      "remarks": remarks
    });

    if (attachment != null) {
      formData.files.addAll([MapEntry("attachment", await MultipartFile.fromFile(attachment.path))]);
    }

    try {
      Response response = await network.dio.post(
        "/api/document_delivery/store/",
        data: formData,
      );
      return SaveDocumentDeliveryModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return SaveDocumentDeliveryModel.fromJson(e.message);
      // return e.error;
      // throw Exception();
    }
  }

  @override
  Future<SubmitDocumentDeliveryModel> submit(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/document_delivery/submit/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
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
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_employee_receiver": idEmployeeReceiver,
      "id_company_receiver": idCompanyReceiver,
      "id_site_receiver": idSiteReceiver,
      "id_employee_sender": idEmployeeSender,
      "id_company": idCompanySender,
      "id_site": idSiteSender,
      "subject": subject,
      "remarks": remarks,
      "code_status_doc": codeStatusDoc.toString(),
    });

    if (attachment != null) {
      formData.files.addAll([MapEntry("attachment", await MultipartFile.fromFile(attachment.path))]);
    } else {
      formData.fields.add(MapEntry("attachment", "no attachment"));
    }

    try {
      Response response = await network.dio.post(
        "/api/document_delivery/update_data/$id",
        data: formData,
      );
      return UpdateDocumentDeliveryModel.fromJson(response.data);
    } on DioError catch (e) {
      return UpdateDocumentDeliveryModel.fromJson(e.message);
      // return e.error;
      // throw Exception();
    }
  }

  @override
  Future<GetDocumentDeliveryByidModel> getByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.get(
        "/api/document_delivery/get/$id",
      );
      return GetDocumentDeliveryByidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<bool> cancel(dynamic id, String? notes) async{
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/document_delivery/cancelled/$id",
        data: {
          "notes" : notes
        }
      );
      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      return result["success"] ?? false;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<bool> received(dynamic id) async{
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/document_delivery/received/$id",
      );
      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      return result["success"] ?? false;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<bool> delivering(dynamic id) async{
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/document_delivery/delivering/$id",
      );
      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      return result["success"] ?? false;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<bool> delivered(dynamic id) async{
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/document_delivery/delivered/$id",
      );
      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      return result["success"] ?? false;
    } on DioError catch (e) {
      return e.error;
    }
  }

}
