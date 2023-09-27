import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_travel_model.dart';
import 'package:gais/data/model/reference/get_flight_schedule_model.dart';
import 'package:gais/data/model/reference/get_type_transportation_model.dart';
import 'package:gais/data/model/request_trip/get_accommodation_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_model.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_byid_model.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart';
import 'package:gais/data/model/request_trip/get_detailca_bycashid_model.dart';
import 'package:gais/data/model/request_trip/get_guest_byid_model.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart';
import 'package:gais/data/model/request_trip/get_other_transport_model.dart';
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/get_trainTrip_model.dart';
import 'package:gais/data/model/request_trip/get_train_trip_bytripid_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/data/model/request_trip/save_accommodation_model.dart';
import 'package:gais/data/model/request_trip/save_airlines_model.dart';
import 'package:gais/data/model/request_trip/save_other_transportation_model.dart';
import 'package:gais/data/model/request_trip/save_purpose_of_trip_model.dart';
import 'package:gais/data/model/request_trip/save_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/save_train_trip_model.dart';
import 'package:gais/data/model/request_trip/save_traveller_guest_model.dart';
import 'package:gais/data/model/request_trip/submit_request_trip_model.dart';
import 'package:gais/data/model/request_trip/update_accommodation_model.dart';
import 'package:gais/data/model/request_trip/update_airliness_model.dart';
import 'package:gais/data/model/request_trip/update_cash_advance_travel_model.dart';
import 'package:gais/data/model/request_trip/update_other_transport_model.dart';
import 'package:gais/data/model/request_trip/update_purpose_of_trip_model.dart';
import 'package:gais/data/model/request_trip/update_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/update_train_trip_model.dart';
import 'package:gais/data/model/request_trip/update_traveller_guest_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/request_trip/request_trip_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class RequestTripImpl implements RequestTripRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  /// Request Trip
  @override
  Future<RequestTripListModel> getRequestTripList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo();
    startDate.printInfo();
    endDate.printInfo();
    try {
      Response response = await network.dio.get(
        "/api/request_trip/get",
        queryParameters: {
          "perPage": perPage,
          "page": page,
          "search": search,
          "start_date": startDate,
          "end_date": endDate,
        },
      );
      RequestTripListModel.fromJson(response.data).data?.total.printInfo(info: "=> response info");
      return RequestTripListModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return RequestTripListModel.fromJson(e.response?.data);
    }
  }

  @override
  Future<GetRequestTripByidModel> getRequestTripByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/request_trip/get/$id",
      );
      return GetRequestTripByidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SavePurposeOfTripModel> saveRequestTrip(
    String employeeID,
    String noRequestTrip,
    String codeDocument,
    String siteID,
    String notes,
    String fromCity,
    String toCity,
    String departureDate,
    String arrivalDate,
    String zonaID,
    int tlkDay,
    String tlkTotal,
    File? file,
    String daNumber,
    String costCenterID,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_employee": employeeID,
      "code_document": codeDocument,
      "id_site": siteID,
      "notes": notes,
      "id_city_from": fromCity,
      "id_city_to": toCity,
      "date_departure": departureDate,
      "date_arrival": arrivalDate,
      "id_zona": zonaID,
      "tlk_per_day": tlkDay,
      "total_tlk": tlkTotal,
      "id_cost_center": costCenterID,
      "number_da": daNumber,
    });

    if (file != null) {
      formData.files.addAll([MapEntry("file", await MultipartFile.fromFile(file.path))]);
    }

    try {
      Response response = await network.dio.post(
        "/api/request_trip/store",
        data: formData,
      );
      return SavePurposeOfTripModel.fromJson(response.data);
    } on DioError catch (e) {
      // print("response save error: ${SavePurposeOfTripModel.fromJson(e.response?.data).message}");
      return SavePurposeOfTripModel.fromJson(e.response?.data);
    }
  }

  @override
  Future<UpdatePurposeOfTripModel> updateRequestTrip(
    String id,
    String employeeID,
    String noRequestTrip,
    String codeDocument,
    String siteID,
    String notes,
    String fromCity,
    String toCity,
    String departureDate,
    String arrivalDate,
    String zonaID,
    String tlkDay,
    String tlkTotal,
    String daNumber,
    File? file,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_employee": employeeID,
      "code_document": codeDocument,
      "id_site": siteID,
      "notes": notes,
      "id_city_from": fromCity,
      "id_city_to": toCity,
      "date_departure": departureDate,
      "date_arrival": arrivalDate,
      "id_zona": zonaID,
      "tlk_per_day": double.parse(tlkDay),
      "total_tlk": tlkTotal,
      "number_da": daNumber,
    });

    if (file != null) {
      formData.files.addAll([MapEntry("file", await MultipartFile.fromFile(file.path))]);
    }

    try {
      Response response = await network.dio.post(
        "/api/request_trip/update_data/$id",
        data: formData,
      );
      return UpdatePurposeOfTripModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return UpdatePurposeOfTripModel.fromJson(e.message);
      // return e.error;
      // throw Exception();
    }
  }

  @override
  Future<SaveTravellerGuestModel> saveTravellerGuest(
    String nameGuest,
    String idrequesttrip,
    String idcompany,
    String company,
    String idtypetraveller,
    String nik,
    String contact,
    String departement,
    String hotelfare,
    String idflightclass,
    String notes,
    String gender,
  ) async {
    try {
      var formData = FormData.fromMap({
        "name_guest": nameGuest,
        "id_request_trip": idrequesttrip,
        "company": company,
        "id_type_traveller": idtypetraveller,
        "nik": nik,
        "contact_no": contact,
        "departement": departement,
        "hotel_fare": hotelfare,
        "id_flight_class": idflightclass,
        "notes": notes,
        "gender": gender,
      });

      var token = await storageSecure.read(key: "token");
      network.dio.options.headers['Authorization'] = 'Bearer $token';

      Response response = await network.dio.post(
        "/api/travel_guest/store",
        data: formData,
      );
      return SaveTravellerGuestModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateTravellerGuestModel> updateTravellerGuest(
    String id,
    String nameGuest,
    String idrequesttrip,
    int idcompany,
    String company,
    String idtypetraveller,
    String nik,
    String contact,
    String departement,
    String hotelfare,
    int idflightclass,
    String notes,
    String gender,
  ) async {
    try {
      var formData = FormData.fromMap({
        "name_guest": nameGuest,
        "id_request_trip": idrequesttrip,
        "company": company,
        "id_type_traveller": idtypetraveller,
        "nik": nik,
        "contact_no": contact,
        "departement": departement,
        "hotel_fare": hotelfare,
        "id_flight_class": idflightclass,
        "notes": notes,
        "gender": gender,
      });

      var token = await storageSecure.read(key: "token");
      network.dio.options.headers['Authorization'] = 'Bearer $token';

      Response response = await network.dio.post(
        "/api/travel_guest/update_data/$id",
        data: formData,
      );
      return UpdateTravellerGuestModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetGuestBytripModel> getGuestBytripList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/travel_guest/get_by_travel_id/trip_id/$id",
      );
      return GetGuestBytripModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetGuestByidModel> getGuestByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/travel_guest/get/$id",
      );
      return GetGuestByidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteTravellerGuest(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/travel_guest/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SaveTaxiVoucherModel> saveTaxiVoucher(
    String tripID,
    String amount,
    String accountName,
    String departureID,
    String arrivalID,
    String remarks,
    String date,
    String voucher,
  ) async {
    try {
      var formData = FormData.fromMap({
        "id_request_trip": tripID,
        "amount": amount,
        "account_name": accountName,
        "remarks": remarks,
        "id_departure_city": departureID,
        "id_arrival_city": arrivalID,
        "date": date,
      });

      var token = await storageSecure.read(key: "token");
      network.dio.options.headers['Authorization'] = 'Bearer $token';

      Response response = await network.dio.post(
        "/api/taxi_voucher/store",
        data: formData,
      );
      return SaveTaxiVoucherModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateTaxiVoucherModel> updateTaxiVoucher(
    String id,
    String tripID,
    String amount,
    String accountName,
    String departureID,
    String arrivalID,
    String remarks,
    String date,
    String voucher,
  ) async {
    try {
      var formData = FormData.fromMap({
        "id_request_trip": tripID,
        "amount": amount,
        "account_name": accountName,
        "remarks": remarks,
        "id_departure_city": departureID,
        "id_arrival_city": arrivalID,
        "date": date,
      });

      var token = await storageSecure.read(key: "token");
      network.dio.options.headers['Authorization'] = 'Bearer $token';

      Response response = await network.dio.post(
        "/api/taxi_voucher/update_data/$id",
        data: formData,
      );
      return UpdateTaxiVoucherModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTaxiVoucherModel> getTaxiVoucherBytripList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/taxi_voucher/",
      );
      return GetTaxiVoucherModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTaxiVoucherModel> getTaxiVoucherByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/taxi_voucher/$id",
      );
      return GetTaxiVoucherModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteTaxiVoucher(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/taxi_voucher/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteRequestTrip(dynamic id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/request_trip/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SaveAirlinesModel> saveAirlines(
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
    String pnrID,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_vendor": idVendor,
      "flight_no": flightNo,
      "code_airlines": codeAirlines,
      "ticket_price": ticketPrice,
      "pnrid": pnrID,
    });

    try {
      Response response = await network.dio.post(
        "/api/flight_trip/store",
        data: formData,
      );
      return SaveAirlinesModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateAirlinessModel> updateAirlines(
    String id,
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
    String pnrID,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_vendor": idVendor,
      "flight_no": flightNo,
      "code_airlines": codeAirlines,
      "ticket_price": ticketPrice,
      "pnrid": pnrID,
    });

    try {
      Response response = await network.dio.post(
        "/api/flight_trip/update_data/$id",
        data: formData,
      );
      return UpdateAirlinessModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteAirliness(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/flight_trip/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetFlightScheduleModel> getFlightScheduleList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/flight_schedule",
      );
      return GetFlightScheduleModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetAirlinessModel> getAirlinessBytripList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/flight_trip/get_by_travel_id/trip_id/$id",
      );
      return GetAirlinessModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetAirlinessModel> getAirlinessByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/flight_trip/get/$id",
      );
      return GetAirlinessModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SaveOtherTransportationModel> saveOtherTransportation(
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_type_transportation": typeTransportation,
      "from_date": fromDate,
      "to_date": toDate,
      "id_city": idCity,
      "qty": qty,
      "remarks": remarks,
    });

    try {
      Response response = await network.dio.post(
        "/api/other_transport/store",
        data: formData,
      );
      return SaveOtherTransportationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateOtherTransportModel> updateOtherTransportation(
    String id,
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_type_transportation": typeTransportation,
      "from_date": fromDate,
      "to_date": toDate,
      "id_city": idCity,
      "qty": qty,
      "remarks": remarks,
    });

    try {
      Response response = await network.dio.post(
        "/api/other_transport/update_data/$id",
        data: formData,
      );
      return UpdateOtherTransportModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetOtherTransportModel> getOtherTransportBytripList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/other_transport/get",
      );
      return GetOtherTransportModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetOtherTransportModel> getOtherTransportByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/other_transport/get/$id",
      );
      return GetOtherTransportModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTypeTransportationModel> getTypeTransportation() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/other_transport/get_type_transport",
      );
      return GetTypeTransportationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteOtherTransportation(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/other_transport/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future deleteAccommodation(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/accomodation_trip/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetAccommodationModel> getAccommodationByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/accomodation_trip/$id",
      );
      return GetAccommodationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetAccommodationModel> getAccommodationBytripList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/accomodation_trip/",
      );
      return GetAccommodationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SaveAccommodationModel> saveAccommodation(
    String idRequestTrip,
    String idTypeAccommodation,
    String checkInDate,
    String checkoutDate,
    String idVendor,
    String useGL,
    String idCity,
    String sharingWithName,
    String remarks,
    String price,
    String codeHotel,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_type_accomodation": idTypeAccommodation,
      "check_in_date": checkInDate,
      "check_out_date": checkoutDate,
      "id_vendor": idVendor,
      "use_gl": useGL,
      "id_city": idCity,
      "sharing_w_name": sharingWithName,
      "remarks": remarks,
      "price": price,
      "code_hotel": codeHotel,
    });

    try {
      Response response = await network.dio.post(
        "/api/accomodation_trip/store",
        data: formData,
      );
      return SaveAccommodationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateAccommodationModel> updateAccommodation(
    String id,
    String idRequestTrip,
    String idTypeAccommodation,
    String checkInDate,
    String checkoutDate,
    String idVendor,
    String useGL,
    String idCity,
    String sharingWithName,
    String remarks,
    String price,
    String codeHotel,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "id_type_accomodation": idTypeAccommodation,
      "check_in_date": checkInDate,
      "check_out_date": checkoutDate,
      "id_vendor": idVendor,
      "use_gl": useGL,
      "id_city": idCity,
      "sharing_w_name": sharingWithName,
      "remarks": remarks,
      "price": price,
      "code_hotel": codeHotel,
    });

    try {
      Response response = await network.dio.post(
        "/api/accomodation_trip/update_data/$id",
        data: formData,
      );
      return UpdateAccommodationModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetCashAdvanceTravelModel> getCashAdvanceTravelList(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/cash_advance/get_by_trip_id/$id",
      );
      GetCashAdvanceTravelModel.fromJson(response.data).data?.first.noCa.printInfo();
      return GetCashAdvanceTravelModel.fromJson(response.data);
    } on DioError catch (e) {
      // print("response error cash advance: ${e.response?.data}");
      return e.response?.data;
    }
  }

  @override
  Future<GetCashAdvanceByidModel> getCashAdvanceTravelByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/cash_advance/travel/$id",
      );
      return GetCashAdvanceByidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetDetailcaBycashidModel> getDetailCashAdvanceTravelByid(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/cash_advance/get_by_cash_id/$id",
      );
      return GetDetailcaBycashidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateCashAdvanceTravelModel> updateCashAdvanceTravel(
    String id,
    String idEmployee,
    String idRequestTrip,
    String idCurrency,
    String remarks,
    String grandTotal,
    String typeCa,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_employee": idEmployee,
      "id_request_trip": idRequestTrip,
      "id_currency": idCurrency,
      "remarks": remarks,
      "grand_total": grandTotal,
      "type_ca": typeCa,
    });
    try {
      Response response = await network.dio.post(
        "/api/cash_advance/update_data/$id",
        data: formData,
      );
      return UpdateCashAdvanceTravelModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      e.error.printError();
      return e.error;
    }
  }

  @override
  Future<GetCashAdvanceTravelModel> deleteCashAdvanceTravel(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/cash_advance/delete_data/$id",
      );
      return GetCashAdvanceTravelModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<ItemCashAdvanceTravelModel> getItemCATravel() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/cash_advance/get_type_item_ca",
      );
      return ItemCashAdvanceTravelModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SubmitRequestTripModel> submitRequestTrip(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/request_trip/submit/$id",
      );
      return SubmitRequestTripModel.fromJson(response.data);
    } on DioError catch (e) {
      e.printError();
      SubmitRequestTripModel.fromJson(e.response?.data).message.printError();
      //print("response error: ${e.response?.data}");
      return SubmitRequestTripModel.fromJson(e.response?.data);
    }
  }

  @override
  Future deleteTrainTrip(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/train_trip/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTrainTripModel> getTrainTripByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/train_trip/get/$id",
      );
      return GetTrainTripModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTrainTripBytripidModel> getTrainTripByTrip(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/train_trip/get_by_travel_id/trip_id/$id",
      );
      return GetTrainTripBytripidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<SaveTrainTripModel> saveTrainTrip(
    String idRequestTrip,
    String travellerName,
    String pnrID,
    String idVendor,
    String originStation,
    String originStationName,
    String destinationStation,
    String destinationStationName,
    String departureDate,
    String adult,
    String childs,
    String trainName,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "traveler_name": travellerName,
      "pnrid": pnrID,
      "id_vendor": idVendor,
      "code_station": originStation,
      "name_station": originStationName,
      "code_station_to": destinationStation,
      "name_station_to": destinationStationName,
      "depart_date": departureDate,
      "adult": adult,
      "child": childs,
    });

    try {
      Response response = await network.dio.post(
        "/api/train_trip/store",
        data: formData,
      );
      return SaveTrainTripModel.fromJson(response.data);
    } on DioError catch (e) {
      // print("response save error: ${SavePurposeOfTripModel.fromJson(e.response?.data).message}");
      return SaveTrainTripModel.fromJson(e.response?.data);
    }
  }

  @override
  Future<UpdateTrainTripModel> updateTrainTrip(
    String id,
    String idRequestTrip,
    String travellerName,
    String pnrID,
    String idVendor,
    String originStation,
    String originStationName,
    String destinationStation,
    String destinationStationName,
    String departureDate,
    String adult,
    String childs,
    String trainName,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "traveler_name": travellerName,
      "pnrid": pnrID,
      "id_vendor": idVendor,
      "code_station": originStation,
      "name_station": originStationName,
      "code_station_to": destinationStation,
      "name_station_to": destinationStationName,
      "depart_date": departureDate,
      "adult": adult,
      "child": childs,
    });

    try {
      Response response = await network.dio.post(
        "/api/train_trip/update_data/$id",
        data: formData,
      );
      return UpdateTrainTripModel.fromJson(response.data);
    } on DioError catch (e) {
      // print("response save error: ${SavePurposeOfTripModel.fromJson(e.response?.data).message}");
      return UpdateTrainTripModel.fromJson(e.response?.data);
    }
  }
}
