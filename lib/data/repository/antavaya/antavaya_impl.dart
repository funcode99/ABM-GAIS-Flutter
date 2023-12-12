import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/antavaya/contact_model.dart';
import 'package:gais/data/model/antavaya/get_airport_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_city_hotel_model.dart';
import 'package:gais/data/model/antavaya/get_country_hotel_model.dart';
import 'package:gais/data/model/antavaya/get_hotels_model.dart';
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_train_seats_model.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart';
import 'package:gais/data/model/antavaya/passengers_model.dart';
import 'package:gais/data/model/antavaya/save_reservation_model.dart';
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
    String airliness,
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
  Future<SaveReservationModel> saveFlightReservation(
    // String contactTitle,
    // String contactFirstName,
    // String contactLastName,
    // String contactEmail,
    // String contactHomePhone,
    // String contactMobilePhone,
    ContactModel contacts,
    PassengersModel passengers,
    Segments segments,
    String flightType,
    String companyCode,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    print(contacts.email);
    var formData = FormData.fromMap({
      "Contact[Email]": contacts.email,
      "Contact[Title]": contacts.title,
      "Contact[FirstName]": contacts.firstName,
      "Contact[LastName]": contacts.lastName,
      "Contact[HomePhone]": contacts.homePhone,
      "Contact[MobilePhone]": contacts.mobilePhone,
      "CallbackUri": "https://webhook.site/4119b406-f2e3-40f4-bcc6-8b2a4473e21a",
      "FlightType": flightType,
      "Passengers[0][Index]": passengers.index,
      "Passengers[0][Type]": passengers.type,
      "Passengers[0][Title]": passengers.title,
      "Passengers[0][FirstName]": passengers.firstName,
      "Passengers[0][LastName]": passengers.lastName,
      "Passengers[0][IsSeniorCitizen]": passengers.isSeniorCitizen,
      "Passengers[0][BirthDate]": passengers.birthDate,
      "Passengers[0][Email]": passengers.email,
      "Passengers[0][HomePhone]": passengers.homePhone,
      "Passengers[0][MobilePhone]": passengers.mobilePhone,
      "Passengers[0][OtherPhone]": passengers.otherPhone,
      "Passengers[0][IdNumber]": passengers.idNumber,
      "Passengers[0][Nationality]": ["ID"],
      "Passengers[0][AdultAssoc]": true,
      "Passengers[0][PassportNumber]": passengers.passport?.number,
      "Passengers[0][PassportExpire]": passengers.passport?.expire,
      "Passengers[0][PassportOrigin]": passengers.passport?.originCountry,
      "Passengers[0][EmergencyFullName]": passengers.emergencyName,
      "Passengers[0][EmergencyPhone]": passengers.emergencyPhone,
      "Passengers[0][EmergencyEmail]": passengers.emergencyEmail,
      "Passengers[0][Ssrs][0][SsrCode]": passengers.ssrs?.first.ssrCode,
      "Passengers[0][Ssrs][0][OriginCode]": passengers.ssrs?.first.originCode,
      "Passengers[0][Ssrs][0][DestinationCode]": passengers.ssrs?.first.destinationCode,
      "Passengers[0][Ssrs][0][SsrFare]": passengers.ssrs?.first.ssrFare,
      "Passengers[0][Ssrs][0][Ccy]": passengers.ssrs?.first.ccy,
      "Passengers[0][Ssrs][0][SsrName]": passengers.ssrs?.first.ssrName,
      "Passengers[0][Ssrs][0][SsrType]": passengers.ssrs?.first.ssrType,
      "Passengers[0][Ssrs][0][FlightNumber]": passengers.ssrs?.first.flightNumber,
      "Segments[0][ClassId]": segments.classID,
      "Segments[0][Airline]": segments.airline,
      "Segments[0][FlightNumber]": segments.flightNumber,
      "Segments[0][Origin]": segments.origin,
      "Segments[0][DepartDate]": segments.departDate,
      "Segments[0][DepartTime]": segments.departTime,
      "Segments[0][Destination]": segments.destination,
      "Segments[0][ArriveDate]": segments.arriveDate,
      "Segments[0][ArriveTime]": segments.ariveTime,
      "Segments[0][ClassCode]": segments.classCode,
      "Segments[0][FlightId]": segments.flightId,
      "Segments[0][Num]": 0,
      "Segments[0][Seq]": 1,
      "CompanyCode" : companyCode
    });

    // passengers.mapIndexed((i, pass) {
    //   formData.fields.add([MapEntry("Passengers[$i][Index]", pass.index)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Type]", pass.type)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Title]", pass.title)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][FirstName]", pass.firstName)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][LastName]", pass.lastName)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][IsSeniorCitizen]", pass.isSeniorCitizen)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][BirthDate]", pass.birthDate)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Email]", pass.email)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][HomePhone]", pass.homePhone)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][MobilePhone]", pass.mobilePhone)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][OtherPhone]", pass.otherPhone)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][IdNumber]", pass.idNumber)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Nationality]", pass.nationality)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][AdultAssoc]", true)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][PassportNumber]", pass.passport?.number)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][PassportExpire]", pass.passport?.expire)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][PassportOrigin]", pass.passport?.originCountry)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][EmergencyFullName]", pass.emergencyName)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][EmergencyPhone]", pass.emergencyPhone)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][EmergencyEmail]", pass.emergencyEmail)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrCode]", pass.ssrs?.first.ssrCode)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][OriginCode]", pass.ssrs?.first.originCode)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][DestinationCode]", pass.ssrs?.first.destinationCode)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrFare]", pass.ssrs?.first.ssrFare)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][Ccy]", pass.ssrs?.first.ccy)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrName]", pass.ssrs?.first.ssrName)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][SsrType]", pass.ssrs?.first.ssrType)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Passengers[$i][Ssrs][0][FlightNumber]", pass.ssrs?.first.flightNumber)] as MapEntry<String, String>);
    // });
    //
    // segments.mapIndexed((i, segm) {
    //   formData.fields.add([MapEntry("Segments[$i][ClassId]", segm.classID)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][Airline]:2", segm.airlineName)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][FlightNumber]", segm.flightNumber)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][Origin]", segm.origin)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][DepartDate]", segm.departDate)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][DepartTime]", segm.departTime)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][Destination]", segm.destination)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][ArriveDate]", segm.arriveDate)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][ArriveTime]", segm.ariveTime)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][ClassCode]", segm.classCode)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][FlightId]", segm.flightId)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][Num]", segm.num)] as MapEntry<String, String>);
    //   formData.fields.add([MapEntry("Segments[$i][Seq]", segm.seq)] as MapEntry<String, String>);
    // });
    try {
      Response response = await network.dio.post(
        "/api/antavaya/flight/reservation_flight",
        data: formData,
      );
      print('reservation : ${response.data}');
      return SaveReservationModel.fromJson(response.data);
    } on DioError catch (e) {
      print('reservation error: ${e.response?.data}');
      return e.error;
    }
  }

  @override
  Future getRsvTicket(String pnrID) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    pnrID.printInfo(info: 'pnrid');
    try {
      Response response = await network.dio.get(
        "/api/antavaya/flight/get_reservation_flight/",
        queryParameters: {'Id': pnrID},
      );
      return response.data;
    } on DioError catch (e) {
      print('antavaya error: ${e.response?.data}');
      return e.error;
    }
  }

  @override
  Future<GetSsrModel> getSSR(String adult, String child, String infant, Segments segments) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      'Adult': adult,
      'Child': child,
      'Infant': infant,
      'Segments[0][Airline]': segments.airline,
      'Segments[0][ArriveDate]': segments.arriveDate,
      'Segments[0][ArriveTime]': segments.ariveTime,
      'Segments[0][ClassCode]': segments.classCode,
      'Segments[0][ClassId]': segments.classID,
      'Segments[0][DepartDate]': segments.departDate,
      'Segments[0][DepartTime]': segments.departTime,
      'Segments[0][FlightId]': segments.flightId,
      'Segments[0][FlightNumber]': segments.flightNumber,
      'Segments[0][Origin]': segments.origin,
      'Segments[0][Destination]': segments.destination,
      'Segments[0][Seq]': 1,
      'Segments[0][Num]': 0
    });

    try {
      Response response = await network.dio.post(
        "/api/antavaya/flight/get_ssr",
        data: formData,
      );
      print(response.data);
      return GetSsrModel.fromJson(response.data);
    } on DioError catch (e) {
      print('getSSR error: ${e.response?.data}');
      return e.error;
    }
  }

  @override
  Future<GetCityHotelModel> getCity(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/hotel/get_city",
        queryParameters: {
          'id_country': id,
        },
      );
      return GetCityHotelModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetCountryHotelModel> getCountry() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/hotel/get_country",
      );
      return GetCountryHotelModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetTrainStationModel> getTrainStation() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/train/get_station",
      );
      print("station response: ${response.data}");
      return GetTrainStationModel.fromJson(response.data);
    } on DioError catch (e) {
      print("station response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetHotelsModel> getHotel(
    String idCountry,
    String idCity,
    String checkinDate,
    String checkoutDate,
    String room,
    String guest,
    String hotelFare,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_country": idCountry,
      "id_city": idCity,
      "check_in": checkinDate,
      "check_out": checkoutDate,
      "room": room,
      "guest": guest,
      "hotel_fare": hotelFare,
    });
    try {
      Response response = await network.dio.post(
        "/api/antavaya/hotel/get_hotel",
        data: formData,
      );
      // print("hotels response: ${response.data}");
      return GetHotelsModel.fromJson(response.data);
    } on DioError catch (e) {
      // print("hotels error: ${e.response?.data}");
      return e.response?.data;
    }
  }

  @override
  Future<GetTrainScheduleModel> getTrainSchedule(
    String origin,
    String destination,
    String departDate,
    String adult,
    String child,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "Origin": origin,
      "Destination": destination,
      "DepartDate": departDate,
      "Adult": adult,
      "Child": child,
    });

    try {
      Response response = await network.dio.post(
        "/api/antavaya/train/get_train_ticket",
        data: formData,
      );
      print(response.data);
      return GetTrainScheduleModel.fromJson(response.data);
    } on DioError catch (e) {
      // print('get train schedule error: ${e.response?.data}');
      return e.error;
    }
  }

  @override
  Future<SaveReservationModel> saveTrainReservation(
    ContactModel contacts,
    PassengersModel passengers,
    Journeys train,
    String identityType,
    String companyCode,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "Contact[Title]": contacts.title,
      "Contact[FirstName]": contacts.firstName,
      "Contact[LastName]": contacts.lastName,
      "Contact[MobilePhone]": contacts.mobilePhone,
      "Contact[HomePhone]": contacts.homePhone,
      "Contact[WorkPhone]": contacts.workPhone,
      "Contact[OtherPhone]": contacts.otherPhone,
      "Contact[Email]": contacts.email,
      "Contact[Address]": contacts.address,
      "Contact[City]": contacts.city,
      "Contact[ProvinceState]": contacts.provinceState,
      "Contact[PostalCode]": contacts.postalCode,
      "Passengers[0][FirstName]": passengers.firstName,
      "Passengers[0][LastName]": passengers.lastName,
      "Passengers[0][Title]": passengers.title,
      "Passengers[0][MobilePhone]": passengers.mobilePhone,
      "Passengers[0][IdentityType]": identityType,
      "Passengers[0][IdentityNumber]": passengers.idNumber,
      "Passengers[0][PassportExpire]": passengers.passport?.expire,
      "Passengers[0][PassportOrigin]": passengers.passport?.originCountry,
      "Passengers[0][BirthDate]": passengers.birthDate,
      "Passengers[0][PaxType]": train.segments?.first.paxFares?.first.paxType,
      "Passengers[0][Sequence]": train.sequence,
      "Journey[Segments][0][ClassKey]": train.segments?.first.classKey,
      "Journey[Segments][0][CarrierNumber]": train.carrierNumber,
      "Journey[Segments][0][Origin]": train.origin,
      "Journey[Segments][0][Destination]": train.destination,
      "Journey[Segments][0][DepartureDate]": train.departureDate,
      "Journey[Segments][0][DepartureTime]": train.departureTime,
      "Journey[Segments][0][ArrivalDate]": train.arrivalDate,
      "Journey[Segments][0][ArrivalTime]": train.arrivalTime,
      "Journey[Segments][0][JourneyCode]": train.journeyCode,
      "Journey[Segments][0][SubClass]": train.segments?.first.subClass,
      "Journey[Segments][0][Class]": train.segments?.first.classTrain,
      "Journey[Segments][0][Provider]": train.provider,
      "CompanyCode" : companyCode
    });
    try {
      Response response = await network.dio.post(
        "/api/antavaya/train/rsv_train",
        data: formData,
      );
      print('reservation : ${response.data}');
      return SaveReservationModel.fromJson(response.data);
    } on DioError catch (e) {
      print('reservation error: ${e.response?.data}');
      return e.error;
    }
  }

  @override
  Future<GetTrainSeatsModel> getTrainSeats(
    String origin,
    String destination,
    String departureDate,
    String carrierNumber,
    String subClass,
    String provider,
    String fareBasisCode,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "Origin": origin,
      "Destination": destination,
      "DepartureDate": departureDate,
      "CarrierNumber": carrierNumber,
      "SubClass": subClass,
      "Provider": provider,
      "FareBasisCode": fareBasisCode,
    });

    try {
      Response response = await network.dio.post(
        "/api/antavaya/train/seat_map_train",
        data: formData,
      );
      print(response.data);
      return GetTrainSeatsModel.fromJson(response.data);
    } on DioError catch (e) {
      // print('get train schedule error: ${e.response?.data}');
      return e.error;
    }
  }
}
