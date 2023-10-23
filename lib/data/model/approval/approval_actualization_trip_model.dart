import 'package:json_annotation/json_annotation.dart';

part 'approval_actualization_trip_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalActualizationTripModel {
  String? id;
  String? codeDocument;
  String? idDocument;
  int? level;
  int? idEmployee;
  int? idCompany;
  int? idSite;
  int? idMatrix;
  int? idApprovalAuth;
  dynamic approvedBy;
  dynamic approvedBehalf;
  dynamic rejectedBy;
  dynamic isApproved;
  String? notes;
  int? codeStatusDoc;
  dynamic isRequestTrip;
  String? codeSequence;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  int? currentLevel;
  String? status;
  String? employeeName;
  String? noAct;
  int? idOrigin;
  int? isDelegation;
  String? docCreatedAt;
  String? fileName;
  String? path;
  int? isReSubmit;
  int? levelReal;
  String? purpose;
  dynamic totalTlk;
  dynamic idRequestTrip;
  dynamic daysOfTrip;

  ApprovalActualizationTripModel(
      {
        this.id,
        this.codeDocument,
        this.idDocument,
        this.level,
        this.idEmployee,
        this.idCompany,
        this.idSite,
        this.idMatrix,
        this.idApprovalAuth,
        this.approvedBy,
        this.approvedBehalf,
        this.rejectedBy,
        this.isApproved,
        this.notes,
        this.codeStatusDoc,
        this.isRequestTrip,
        this.codeSequence,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
        this.currentLevel,
        this.status,
        this.employeeName,
        this.noAct,
        this.idOrigin,
        this.isDelegation,
        this.docCreatedAt,
        this.fileName,
        this.path,
        this.isReSubmit,
        this.levelReal,
        this.purpose,
        this.totalTlk,
        this.idRequestTrip,
        this.daysOfTrip,
      });

  static ApprovalActualizationTripModel fromJsonModel(Object? json) =>
      ApprovalActualizationTripModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalActualizationTripModel model) =>
      model.toJson();

  static List<ApprovalActualizationTripModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalActualizationTripModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalActualizationTripModel.fromJson(jsonList)];
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
    if (list is List<ApprovalActualizationTripModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalActualizationTripModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalActualizationTripModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalActualizationTripModelToJson(this);
}
