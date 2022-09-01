public with sharing class CollectionController {
    
    @AuraEnabled(cacheable = true)
    public static List<Collection__c> getCollectionByTitle(String bookTitle){
        return [SELECT Id,Name,Title__c,Category__c,Copies__c,Is_Available__c,Price__c,Rack__r.Name,Total_Copies_Issued__c
                FROM Collection__c
                WHERE Title__c  LIKE :bookTitle+'%' ORDER BY Title__c] ;
    }

    @AuraEnabled(cacheable = true)
    public static List<Collection__c> getCollection(){
        return [SELECT Id,Name,Title__c,Category__c,Copies__c,Is_Available__c,Price__c,Rack__r.Name,Total_Copies_Issued__c
                FROM Collection__c] ;
    }
}