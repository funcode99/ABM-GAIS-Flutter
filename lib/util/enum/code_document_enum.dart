enum TypeDocumentEnum {

  cashAdvanceTravel("TCA"),
	cashAdvanceNonTravel("CANT"),
	requestTrip("RTRIP"),
	poolCarRequest("POLCA"),
	settlement("STTLM"),
	claimReimbursement("CLM"),
	bookingMeetingRoom("BOMR"),
	documentDelivery("DOCDL"),
	requestATK("ATKR");

  const TypeDocumentEnum(this.value);

  final String value;
}
