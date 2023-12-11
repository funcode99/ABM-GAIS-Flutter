import 'dart:io';
import 'package:gais/data/model/cash_advance/item_cash_advance_travel_model.dart';
import 'package:gais/data/model/reference/get_flight_schedule_model.dart';
import 'package:gais/data/model/reference/get_type_transportation_model.dart';
import 'package:gais/data/model/request_trip/get_accommodation_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_bytrip_model.dart';
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
import 'package:gais/data/model/request_trip/get_transportation_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/data/model/request_trip/save_accommodation_model.dart';
import 'package:gais/data/model/request_trip/save_airliness_model.dart';
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
import 'package:gais/data/model/request_trip/update_transportation_model.dart';
import 'package:gais/data/model/request_trip/update_traveller_guest_model.dart';
import 'package:gais/data/model/request_trip/save_transportation_model.dart';

abstract class RequestTripRepository {
  Future<RequestTripListModel> getRequestTripList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
  );

  Future<GetRequestTripByidModel> getRequestTripByid(String id);

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
  );

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
  );

  Future deleteRequestTrip(dynamic id);

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
    String isGuest,
    String? email,
    String? title,
    String? birthdate,
  );

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
    String? email,
    String? title,
    String? birthdate,
  );

  Future<GetGuestBytripModel> getGuestBytripList(String id);

  Future<GetGuestByidModel> getGuestByID(String id);

  Future deleteTravellerGuest(String id);

  Future<SaveTaxiVoucherModel> saveTaxiVoucher(
    String tripID,
    String amount,
    String accountName,
    String departureID,
    String arrivalID,
    String remarks,
    String date,
    String voucher,
  );

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
  );

  Future<GetTaxiVoucherModel> getTaxiVoucherBytripList(String id);

  Future<GetTaxiVoucherModel> getTaxiVoucherByid(String id);

  Future deleteTaxiVoucher(String id);

  Future<SaveAirlinessModel> saveAirlines(
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
    String pnrID,
    String origin,
    String destination,
    String departDate,
    String adult,
    String childs,
    String infant,
    String travellerName,
    String flightClass,
    dynamic travellersObject
  );

  Future<UpdateAirlinessModel> updateAirlines(
    String id,
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
    String pnrID,
    String origin,
    String destination,
    String departDate,
    String adult,
    String childs,
    String infant,
    String travellerName,
    String flightClass,
    dynamic travellersObject
  );

  Future deleteAirliness(String id);

  Future<GetAirlinessBytripModel> getAirlinessBytripList(String id);

  Future<GetAirlinessModel> getAirlinessByid(String id);

  Future<GetFlightScheduleModel> getFlightScheduleList();

  Future<SaveOtherTransportationModel> saveOtherTransportation(
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  );

  Future<UpdateOtherTransportModel> updateOtherTransportation(
    String id,
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  );

  Future<GetOtherTransportModel> getOtherTransportBytripList(String id);

  Future<GetOtherTransportModel> getOtherTransportByid(String id);

  Future<GetTypeTransportationModel> getTypeTransportation();

  Future deleteOtherTransportation(String id);

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
    String travellerName,
    String codeCountry,
    String nameCountry,
    String codeCity,
    String nameCity,
    String room,
    String guest,
    String pnrID,
    String jenkel,
    String hotelFare,
  );

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
    String travellerName,
    String codeCountry,
    String nameCountry,
    String codeCity,
    String nameCity,
    String room,
    String guest,
    String pnrID,
    String jenkel,
    String hotelFare,
    String correlationId,
    String hotelKey,
    String roomKey,
    String confirmationID,
    GuestModel? guests,
    ContactGuest? contactGuest,
    BedsModel? beds,
  );

  Future<GetAccommodationModel> getAccommodationBytripList(String id);

  Future<GetAccommodationModel> getAccommodationByid(String id);

  Future deleteAccommodation(String id);

  Future<GetCashAdvanceTravelModel> getCashAdvanceTravelList(String id);

  Future<GetCashAdvanceByidModel> getCashAdvanceTravelByid(String id);

  Future<GetDetailcaBycashidModel> getDetailCashAdvanceTravelByid(String id);

  Future<UpdateCashAdvanceTravelModel> updateCashAdvanceTravel(
    String id,
    String idEmployee,
    String idRequestTrip,
    String idCurrency,
    String remarks,
    String grandTotal,
    String typeCa,
  );

  Future deleteCashAdvanceTravel(String id);

  Future<ItemCashAdvanceTravelModel> getItemCATravel();

  Future<SubmitRequestTripModel> submitRequestTrip(String id);

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
  );

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
  );

  Future deleteTrainTrip(String id);

  Future<GetTrainTripBytripidModel> getTrainTripByTrip(String id);

  Future<GetTrainTripModel> getTrainTripByID(String id);

  Future<SaveTransportationModel> saveTransportation(
    String idRequestTrip,
    String amount,
    String accountName,
    String remarks,
    String idDepartureCity,
    String idArrivalCity,
    String idTypeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String idCompany,
    String idSite,
  );

  Future<UpdateTransportationModel> updateTransportation(
    String id,
    String idRequestTrip,
    String amount,
    String accountName,
    String remarks,
    String idDepartureCity,
    String idArrivalCity,
    String idTypeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String idCompany,
    String idSite,
  );

  Future<GetTransportationModel> getTransportationBytrip(String id);

  Future<GetTransportationModel> getTransportationByID(String id);

  Future deleteTransportation(String id);
}
