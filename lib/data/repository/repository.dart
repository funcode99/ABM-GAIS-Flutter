import 'dart:async';

import 'package:gais/data/model/login_model.dart';

abstract class Repository {
  Future<LoginModel> postLogin(String username, String password);

}