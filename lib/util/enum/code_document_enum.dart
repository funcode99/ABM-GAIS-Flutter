enum CodeDocumentEnum {

  cashAdvanceTravel("TCA"),
	cashAdvanceNonTravel("CANT"),
	requestTrip("RTRIP"),
	poolCarRequest("POLCA"),
	settlement("STTLM"),
	claimReimbursement("CLM");

  const CodeDocumentEnum(this.value);

  final String value;
}
