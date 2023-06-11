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
}
