import 'package:gais/data/model/antavaya/get_airport_model.dart';

abstract class AntavayaRepository {
  Future<GetAirportModel> getairport();
}