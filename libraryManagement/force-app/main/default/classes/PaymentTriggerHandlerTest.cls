@isTest
public class PaymentTriggerHandlerTest {
	@testSetup
    static void setup(){
        List<Payment__c> paymentList = new List<Payment__c>();
        List<Member__c> memberList = new List<Member__c>();
        
        for(Integer i = 0 ;i<5;i++){
            Member__c mb = new Member__c();
        	mb.Name__c = 'Test Member'+i;
            mb.Email__c = 'abc@abc.com';
            memberList.add(mb);
        }
        insert memberList;
        List<Member__c> createdMemberList = [SELECT Id,Name__c FROM Member__c WHERE Name__c LIKE 'Test Member%'];
        for(Integer i = 0 ;i<5;i++){
            Payment__c pay = new Payment__c();
            pay.Amount__c = 500;
            pay.Payment_Type__c = 'Subscription Fee';
            pay.Member__c = createdMemberList.get(i).Id;
            paymentLiST.add(pay);
        }
        insert paymentList;
    }
    
    @isTest 
    static void testUpdateMemberFields(){
        List<Member__c> memberList = new List<Member__c>();
        memberList = [SELECT Id,Name__c,Membership_End_Date__c FROM Member__c WHERE Name__c LIKE 'Test Member%'];
        for(Member__c mb : memberList){
            System.assertEquals(Date.today()+364, mb.Membership_End_Date__c, 'End Date does not match');
        }
    }
}