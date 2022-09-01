public class ItemBorrowedTriggerHandler {
	public static void countBooksMemberIssued(List<Item_Borrowed__c> newList,Map<Id,Item_Borrowed__c> oldMap){
        Set<Id> memberIdSet = new Set<Id>();
        if(newList != NULL){
            for(Item_Borrowed__c ib : newList){
                if(oldMap ==NULL || ib.Member__c != oldMap.get(ib.Id).Member__c){
                    if(ib.Member__c != NULL){
                        memberIdSet.add(ib.Member__c);
                    }
                    if(oldMap != NULL && oldMap.get(ib.Id).Member__c != NULL){
                        memberIdSet.add(oldMap.get(ib.Id).Member__c);
                    }
                }
            
            }
        } else {
            for(Id bookId : oldMap.keySet()){
                if(oldMap.get(bookId).Member__c != NULL){
                    memberIdSet.add(oldMap.get(bookId).Member__c);
                }
            }
        }
        Map<Id,Integer> memberIdToCountMap = new Map<Id,Integer>();
        for(Member__c mb :[SELECT Id,(SELECT Id FROM Items_Borrowed__r) FROM Member__c WHERE Id IN :memberIdSet]){
			memberIdToCountMap.put(mb.Id,mb.Items_Borrowed__r.size());
        }
        List<Member__c> memberList = new List<Member__c>();
        for(Id memberId : memberIdToCountMap.keySet()){
            Member__c mb = new Member__c();
            mb.Id = memberId;
            mb.Total_Books_Borrowed__c = memberIdToCountMap.get(memberId);
            memberList.add(mb);
        }
        update memberList;
    } 
    
    public static void countTotalCopiesIssued(List<Item_Borrowed__c> newList,Map<Id,Item_Borrowed__c> oldMap){
        Set<Id> collectionIdSet = new Set<Id>();
        if(newList != NULL){
            for(Item_Borrowed__c ib : newList){
                if(oldMap ==NULL || ib.Book_Borrowed__c != oldMap.get(ib.Id).Book_Borrowed__c){
                    if(ib.Book_Borrowed__c != NULL){
                        collectionIdSet.add(ib.Book_Borrowed__c);
                    }
                    if(oldMap != NULL && oldMap.get(ib.Id).Book_Borrowed__c != NULL){
                        collectionIdSet.add(oldMap.get(ib.Id).Book_Borrowed__c);
                    }
                }
            
            }
        } else {
            for(Id bookId : oldMap.keySet()){
                if(oldMap.get(bookId).Book_Borrowed__c != NULL){
                    collectionIdSet.add(oldMap.get(bookId).Book_Borrowed__c);
                }
            }
        }
        Map<Id,Integer> collectionIdToCountMap = new Map<Id,Integer>();
        for(Collection__c col :[SELECT Id,(SELECT Id FROM Items_Borrowed__r) FROM Collection__c WHERE Id IN :collectionIdSet]){
			collectionIdToCountMap.put(col.Id,col.Items_Borrowed__r.size());
        }
        List<Collection__c> collectionList = new List<Collection__c>();
        for(Id collectionId : collectionIdToCountMap.keySet()){
            Collection__c col = new Collection__c();
            col.Id = collectionId;
            col.Total_Copies_Issued__c = collectionIdToCountMap.get(collectionId);
            collectionList.add(col);
        }
        update collectionList;
    }
}