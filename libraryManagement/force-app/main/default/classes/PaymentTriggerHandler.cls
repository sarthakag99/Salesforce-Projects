public class PaymentTriggerHandler {
	public static void updateMemberFields(List<Payment__c> newList){
        /* List<Contact> contactList = new List<Contact>();
        for(Payment__c payment : newList){
            Contact con = new Contact();
            con.Id = payment.Contact__c;
            if(payment.Payment_Type__c == 'Subscription Fee'){
                con.Membership_End_Date__c = Date.today().addMonths(12)-1;
            }
            
            contactList.add(con);
        }
        update contactList; */
        
        List<Member__c> memberList = new List<Member__c>();
        for(Payment__c payment : newList){
            Member__c mb = new Member__c();
            mb.Id = payment.Member__c;
            if(payment.Payment_Type__c == 'Subscription Fee'){
                mb.Membership_End_Date__c = Date.today().addMonths(12)-1;
            }
            
            memberList.add(mb);
        }
        update memberList;
    }
}