import 'package:gais/data/model/antavaya/get_airport_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart';
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';
import 'package:gais/data/model/antavaya/save_reservation_flight_model.dart';

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

  Future saveFlightReservation(
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

  Future<GetRsvTicketModel> getRsvTicket(String pnrID);

  Future<GetSsrModel> getSSR(
    String adult,
    String child,
    String infant,
    Segments segments,
  );
}
