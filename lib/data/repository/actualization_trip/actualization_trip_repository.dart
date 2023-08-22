import 'package:gais/data/model/actualization_trip/get_activities_byactualid_model.dart';
import 'package:gais/data/model/actualization_trip/get_actual_bytripid_model.dart';
import 'package:gais/data/model/actualization_trip/get_trip_info_byactualid_model.dart';
import 'package:gais/data/model/actualization_trip/save_activities_model.dart';
import 'package:gais/data/model/actualization_trip/save_actual_trip_model.dart';
import 'package:gais/data/model/actualization_trip/save_trip_info_model.dart';
import 'package:gais/data/model/actualization_trip/update_activites_model.dart';
import 'package:gais/data/model/actualization_trip/update_trip_info_model.dart';

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

  Future<GetTripInfoByactualidModel> getTripInfoByActual(String id);

  Future<GetActivitiesByactualidModel> getActivitiesByActual(String id);

  Future<SaveTripInfoModel> saveTripInfo(
    String idActual,
    String dateDeparture,
    String dateArrival,
    String idCityFrom,
    String idCityTo,
    String idZona,
    String tlkRate,
  );

  Future<SaveActivitiesModel> saveActivities(
    String idActual,
    String actDate,
    String activities,
  );

  Future<UpdateTripInfoModel> updateTripInfo(
    String id,
    String idActual,
    String dateDeparture,
    String dateArrival,
    String idCityFrom,
    String idCityTo,
    String idZona,
    String tlkRate,
  );

  Future<GetTripInfoByactualidModel> getTripInfoByID(String id);

  Future deleteTripInfoByID(String id);

  Future<UpdateActivitiesModel> updateActivities(
    String id,
    String idActual,
    String actDate,
    String activities,
  );

  Future<GetActivitiesByactualidModel> getActivitiesByID(String id);

  Future deleteActivitiesByID(String id);

}
