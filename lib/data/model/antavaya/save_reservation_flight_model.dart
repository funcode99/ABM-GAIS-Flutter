class SaveReservationFlightModel {
  SaveReservationFlightModel({
      String? pnrId,}){
    _pnrId = pnrId;
}

  SaveReservationFlightModel.fromJson(dynamic json) {
    _pnrId = json['PnrId'];
  }
  String? _pnrId;
SaveReservationFlightModel copyWith({  String? pnrId,
}) => SaveReservationFlightModel(  pnrId: pnrId ?? _pnrId,
);
  String? get pnrId => _pnrId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PnrId'] = _pnrId;
    return map;
  }

}