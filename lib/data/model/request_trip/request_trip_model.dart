import 'package:json_annotation/json_annotation.dart';

part 'request_trip_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RequestTripModel {
  dynamic id;
  String? noRequestTrip;
  String? createdAt;
  int? code;
  String? status;
  String? codeDocument;
  String? documentName;

  RequestTripModel(
      {
        this.id,
        this.noRequestTrip,
        this.createdAt,
        this.code,
        this.status,
        this.codeDocument,
        this.documentName,
      });

  static RequestTripModel fromJsonModel(Object? json) =>
      RequestTripModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(RequestTripModel model) =>
      model.toJson();

  static List<RequestTripModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => RequestTripModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [RequestTripModel.fromJson(jsonList)];
    }

    // We really shouldn't be here
    throw ArgumentError.value(
        jsonList,
        'jsonList',
        'fromJsonModelList cannot handle'
            ' this JSON payload. Please add a handler for this input or use the correct '
            'helper method.');
  }

  static List<Map<String, dynamic>> toJsonModelList(Object list) {
    if (list is List<RequestTripModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory RequestTripModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTripModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTripModelToJson(this);

  RequestTripModel copyWith({
    dynamic id,
    String? noRequestTrip,
    String? createdAt,
    int? code,
    String? status,
    String? codeDocument,
    String? documentName,
  }) {
    return RequestTripModel(
      id: id ?? this.id,
      noRequestTrip: noRequestTrip ?? this.noRequestTrip,
      createdAt: createdAt ?? this.createdAt,
      code: code ?? this.code,
      status: status ?? this.status,
      codeDocument: codeDocument ?? this.codeDocument,
      documentName: documentName ?? this.documentName,
    );
  }
}
