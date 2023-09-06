import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/antavaya/get_airport_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/save_reservation_flight_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/antavaya/antavaya_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class AntavayaImpl implements AntavayaRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetAirportModel> getairport() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/flight/get_airport",
      );
      return GetAirportModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetAirportScheduleModel> getAirportSchedule(
    String origin,
    String destination,
    String departDate,
    String adult,
    String infant,
    String child,
    List airliness,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "routes[0][Origin]": origin,
      "routes[0][Destination]": destination,
      "routes[0][DepartDate]": departDate,
      "Airlines[]": airliness,
      "Adult": adult,
      "Infant": infant,
      "Child": child,
    });
    try {
      Response response = await network.dio.post(
        "/api/antavaya/flight/get_trip",
        data: formData,
      );
      return GetAirportScheduleModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<SaveReservationFlightModel> saveFlightReservation(
    String contactTitle,
    String contactFirstName,
    String contactLastName,
    String contactEmail,
    String contactHomePhone,
    String contactMobilePhone,
    List<Passengers> passengers,
    List<Segments> segments,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "Contact[Email]": contactEmail,
      "Contact[Title]": contactTitle,
      "Contact[FirstName]": contactFirstName,
      "Contact[LastName]": contactLastName,
      "Contact[HomePhone]": contactHomePhone,
      "Contact[MobilePhone]": contactMobilePhone,
      "CallbackUri": "https://webhook.site/4119b406-f2e3-40f4-bcc6-8b2a4473e21a",
      "FlightType": 'NonGds'
    });

    passengers.mapIndexed((i, pass) {
      formData.fields.add([MapEntry("Passengers[$i][Index]", pass.index)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Type]", pass.type)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Title]", pass.title)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][FirstName]", pass.firstName)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][LastName]", pass.lastName)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][IsSeniorCitizen]", pass.isSeniorCitizen)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][BirthDate]", pass.birthDate)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Email]", pass.email)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][HomePhone]", pass.homePhone)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][MobilePhone]", pass.mobilePhone)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][OtherPhone]", pass.otherPhone)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][IdNumber]", pass.idNumber)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Nationality]", pass.nationality)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][AdultAssoc]", true)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][PassportNumber]", pass.passport?.number)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][PassportExpire]", pass.passport?.expire)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][PassportOrigin]", pass.passport?.originCountry)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][EmergencyFullName]", pass.emergencyName)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][EmergencyPhone]", pass.emergencyPhone)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][EmergencyEmail]", pass.emergencyEmail)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrCode]", pass.ssrs?.first.ssrCode)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][OriginCode]", pass.ssrs?.first.originCode)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][DestinationCode]", pass.ssrs?.first.destinationCode)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrFare]", pass.ssrs?.first.ssrFare)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][Ccy]", pass.ssrs?.first.ccy)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrName]", pass.ssrs?.first.ssrName)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrType]", pass.ssrs?.first.ssrType)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][FlightNumber]", pass.ssrs?.first.flightNumber)] as MapEntry<String, String>);
    });

    segments.mapIndexed((i, segm) {
      formData.fields.add([MapEntry("Segments[$i][ClassId]", segm.classID)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][Airline]:2", segm.airlineName)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][FlightNumber]", segm.flightNumber)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][Origin]", segm.origin)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][DepartDate]", segm.departDate)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][DepartTime]", segm.departTime)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][Destination]", segm.destination)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][ArriveDate]", segm.arriveDate)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][ArriveTime]", segm.ariveTime)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][ClassCode]", segm.classCode)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][FlightId]", segm.flightId)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][Num]", segm.num)] as MapEntry<String, String>);
      formData.fields.add([MapEntry("Segments[$i][Seq]", segm.seq)] as MapEntry<String, String>);
    });
    try {
      Response response = await network.dio.post(
        "/api/antavaya/flight/reservation_flight",
        data: formData,
      );
      return SaveReservationFlightModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetRsvTicketModel> getRsvTicket(String pnrID) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/flight/get_reservation_flight/$pnrID",
      );
      return GetRsvTicketModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
