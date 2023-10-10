import 'package:gais/data/model/antavaya/get_airport_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_city_hotel_model.dart';
import 'package:gais/data/model/antavaya/get_country_hotel_model.dart';
import 'package:gais/data/model/antavaya/get_hotels_model.dart';
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart';
import 'package:gais/data/model/antavaya/save_reservation_model.dart';

abstract class AntavayaRepository {
  Future<GetAirportModel> getairport();

  Future<GetAirportScheduleModel> getAirportSchedule(
    String origin,
    String destination,
    String departDate,
    String adult,
    String infant,
    String child,
    String airliness,
  );

  Future<SaveReservationModel> saveFlightReservation(
    String contactTitle,
    String contactFirstName,
    String contactLastName,
    String contactEmail,
    String contactHomePhone,
    String contactMobilePhone,
    Passengers passengers,
    Segments segments,
    String flightType,
  );

  Future getRsvTicket(String pnrID);

  Future<GetSsrModel> getSSR(
    String adult,
    String child,
    String infant,
    Segments segments,
  );

  Future<GetCityHotelModel> getCity(String id);

  Future<GetCountryHotelModel> getCountry();

  Future<GetTrainStationModel> getTrainStation();

  Future<GetHotelsModel> getHotel(
    String idCountry,
    String idCity,
    String checkinDate,
    String CheckoutDate,
    String room,
    String guest,
  );

  Future<GetTrainScheduleModel> getTrainSchedule(
    String origin,
    String destination,
    String departDate,
    String adult,
    String child,
  );
}
