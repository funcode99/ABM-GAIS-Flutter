import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_trip/approval_info_model.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_byid_model.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart';

abstract class ApprovalRequestTripRepository {
  Future<GetApprovalRequestTripModel> getList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
    String? codeStatusDoc,
  );

  Future<GetApprovalRequestTripByidModel> getByID(int id);

  Future approve(int id, ApprovalModel approval);

  Future reject(int id, ApprovalModel rejection);

  Future<ApprovalInfoModel> approval_info(int id);
}
