enum CashAdvanceNonTravelEnum {
  draft(2),
  waitingApproval(3),
  revision(4),
  fullyRejected(9),
  completed(10),
  needToSettlement(0),
  expired(1);

  const CashAdvanceNonTravelEnum(this.value);

  final int value;
}

enum CashAdvanceTravelEnum {
  draft(2),
  waitingApproval(3),
  revision(4),
  rejected(9),
  completed(10),
  needToSettlement(0),
  expired(1);

  const CashAdvanceTravelEnum(this.value);

  final int value;
}

enum RequestTripEnum {
  draft(0),
  waitingApproval(1),
  revision(2),
  cancelled(3),
  rejected(9),
  completed(10);

  const RequestTripEnum(this.value);

  final int value;
}

enum RequestATKEnum {
  draft(0),
  waitingApproval(1),
  approve(2),
  cancelled(9),
  done(10),
  partialCompleted(11);

  const RequestATKEnum(this.value);

  final int value;
}

enum PoolCarEnum {
  waitingCarAndDriver(0),
  driverCheck(1),
  ready(2),
  done(3);

  const PoolCarEnum(this.value);

  final int value;
}

enum BookingMeetingRoomEnum {
  draft(0),
  booked(1),
  done(10),
  cancelled(9);

  const BookingMeetingRoomEnum(this.value);

  final int value;
}

enum ActualizationTripEnum {
  draft(0),
  waitingApprocal(1),
  revision(3),
  reject(4),
  done(4);

  const ActualizationTripEnum(this.value);

  final int value;
}