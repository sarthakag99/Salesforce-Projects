public with sharing class BookController {
    
    @AuraEnabled(cacheable = true)
    public static List<Collection__c> getCollectionByTitle(String title){
        return [SELECT Id,Name,Title__c,Category__c,Copies__c,Is_Available__c,Price__c,Rack__c,Total_Copies_Issued__c
                FROM Collection__c
                WHERE Title__c = :title];
    }
}