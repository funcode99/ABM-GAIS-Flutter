import 'dart:async';
import 'dart:io';

import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_zona_model.dart';
import 'package:gais/data/model/request_trip/get_document_code_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/data/model/request_trip/save_purpose_of_trip_model.dart';

abstract class Repository {
  Future<LoginModel> postLogin(String username, String password);

  FutureOr<RequestTripListModel> getRequestTripList();

  Future<EmployeeInfoModel> getEmployeeInfo();

  FutureOr<GetDocumentCodeModel> getDocumentCodeList();

  FutureOr<GetCityModel> getCityList();

  FutureOr<GetZonaModel> getZonaList();

  Future<SavePurposeOfTripModel> savePurposeOfTrip(
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
    File? file,
  );
}
