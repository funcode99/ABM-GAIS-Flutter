enum CodeDocumentEnum {

  cashAdvanceTravel("TCA"),
	cashAdvanceNonTravel("CANT"),
	requestTrip("RTRIP"),
	poolCarRequest("POLCA"),
	settlement("STTLM"),
	claimReimbursement("CLM"),
	bookingMeetingRoom("BOMR"),
	documentDelivery("DOCDL"),
	requestATK("ATKR");

  const CodeDocumentEnum(this.value);

  final String value;
}
