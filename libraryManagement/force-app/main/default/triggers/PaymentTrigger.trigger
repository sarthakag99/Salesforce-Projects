trigger PaymentTrigger on Payment__c (after insert) {
	PaymentTriggerHandler.updateMemberFields(Trigger.new);
}