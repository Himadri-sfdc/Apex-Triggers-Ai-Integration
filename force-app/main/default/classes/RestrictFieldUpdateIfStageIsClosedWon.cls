public with sharing class RestrictFieldUpdateIfStageIsClosedWon {
    
    public static void OpportunityUpdationRestrict(List<Opportunity> oppList){
        
        for(Opportunity newOpp : oppList){
            
            if(newOpp.StageName == 'Closed Lost'){
                
                newOpp.addError('Cannot update as the stage is closed Won');
            }
        }
    }

}