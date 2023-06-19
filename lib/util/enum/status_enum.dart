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
  cancelled(9),
  done(10);

  const RequestATKEnum(this.value);

  final int value;
}