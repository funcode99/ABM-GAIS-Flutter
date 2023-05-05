import 'dart:async';

import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';

abstract class Repository {
  Future<LoginModel> postLogin(String username, String password);

  FutureOr<RequestTripListModel> getRequestTripList();

}