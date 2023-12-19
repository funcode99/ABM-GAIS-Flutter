/// success : false
/// message : "Bad Request"
/// error : {}

class ApiResponseErrorModel {
  ApiResponseErrorModel({
      bool? success, 
      String? message, 
      dynamic error,}){
    _success = success;
    _message = message;
    _error = error;
}

  ApiResponseErrorModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _error = json['error'];
  }
  bool? _success;
  String? _message;
  dynamic _error;
ApiResponseErrorModel copyWith({  bool? success,
  String? message,
  dynamic error,
}) => ApiResponseErrorModel(  success: success ?? _success,
  message: message ?? _message,
  error: error ?? _error,
);
  bool? get success => _success;
  String? get message => _message;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['error'] = _error;
    return map;
  }

}