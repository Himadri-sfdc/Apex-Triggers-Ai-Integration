public with sharing class RestrictOppDeletionWithQuote {
    
      public static void EnforceOppDeletion(List<Opportunity> oppList){
        
        Set<Id> oppId = new Set<Id>();
        Map<Id,Id> mapId = new Map<Id,Id>();
        
        for(Opportunity newOpp : oppList){
            
            oppId.add(newOpp.Id);
        }
        if(!oppId.isEmpty()){
            
            for(Quote qot : [SELECT Id,OpportunityId FROM Quote WHERE OpportunityId IN : oppId]){
                
                mapId.put(qot.OpportunityId,qot.Id);
            }
        }
        for(Opportunity newOpp : oppList){
            
            if(mapId.containsKey(newOpp.Id)){
                
                newOpp.addError('Cannot be deleted as It Has Quote in it');
            }
        }
    }

}