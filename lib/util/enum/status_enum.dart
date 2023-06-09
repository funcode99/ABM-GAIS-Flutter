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