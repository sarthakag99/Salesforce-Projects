trigger ItemBorrowedTrigger on Item_Borrowed__c (after insert,after update,before delete,after undelete) {
	ItemBorrowedTriggerHandler.countBooksMemberIssued(Trigger.New,Trigger.oldMap);
    ItemBorrowedTriggerHandler.countTotalCopiesIssued(Trigger.New,Trigger.oldMap);
}