public with sharing class NewContactAndUpdateAccDescription {
 
     public static void InsertContact(List<Contact> conList){
        
        Set<Id> conId = new Set<Id>();
        List<Account> accList = new List<Account>();
        
        for(Contact newCon : conList){
            
            conId.add(newCon.AccountId);
        }
        if(!conId.isEmpty()){
            
            for(Account acc : [SELECT Id,Description FROM Account WHERE Id IN : conId]){
                
                acc.Description = 'Contact created';
                
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            
            update accList;
        }
}