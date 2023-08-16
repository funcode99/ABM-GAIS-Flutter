import 'package:gais/data/model/actualization_trip/get_actual_bytripid_model.dart';
import 'package:gais/data/model/actualization_trip/save_actual_trip_model.dart';

abstract class ActualizationTripRepository {
  Future<GetActualBytripidModel> getActualBytripID(String id);

  Future<SaveActualTripModel> saveActualizationTrip(
    String idRequestTrip,
    String tripDepartureDate,
    String tripArrivalDate,
    String tripCityFrom,
    String tripCityTo,
    String tripZona,
    String tripTLKRate,
    String purpose,
    String activityDate,
    String activities,
    String totalTLK,
    String notes,
    String idEmployee,
  );
}
