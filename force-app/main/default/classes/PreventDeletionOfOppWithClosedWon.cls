
public with sharing class PreventDeletionOfOppWithClosedWon {

    public static void PreventDeletion(List<Opportunity> oppList){

        for(Opportunity opp : oppList){

            if(opp.StageName == 'Closed Won'){

                opp.addError('You cannot delete an Opportunity with Stage "Closed Won".');
            }
        }
    }

}