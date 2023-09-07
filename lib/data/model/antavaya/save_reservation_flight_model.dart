class SaveReservationFlightModel {
  SaveReservationFlightModel({
    String? pnrid,
  }) {
    _pnrid = pnrid;
  }

  SaveReservationFlightModel.fromJson(dynamic json) {
    _pnrid = json['pnrid'];
  }

  String? _pnrid;

  SaveReservationFlightModel copyWith({
    String? pnrid,
  }) =>
      SaveReservationFlightModel(
        pnrid: pnrid ?? _pnrid,
      );

  String? get pnrid => _pnrid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pnrid'] = _pnrid;
    return map;
  }
}
