public with sharing class CustomMetaDataCountOpenOpportunities {
    
      public static void checkLimit(List<Opportunity> oppList) {

        // Get Custom Metadata record
        Account_Opportunity_Limit__mdt config =
            Account_Opportunity_Limit__mdt.getInstance('Default_Limit');

        Integer maxLimit = Integer.valueOf(config.Max_Opportunities__c);

        // Collect Account Ids
        Set<Id> accIds = new Set<Id>();

        for(Opportunity opp : oppList) {
            if(opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }

        // Count existing open Opportunities
        Map<Id, Integer> oppCount = new Map<Id, Integer>();

        for(AggregateResult ar : [
            SELECT AccountId, COUNT(Id) total
            FROM Opportunity
            WHERE AccountId IN :accIds
            AND IsClosed = false
            GROUP BY AccountId
        ]) {
            oppCount.put(
                (Id)ar.get('AccountId'),
                (Integer)ar.get('total')
            );
        }

        // Validate limit
        for(Opportunity opp : oppList) {

            if(opp.AccountId != null) {

                Integer count = oppCount.containsKey(opp.AccountId)
                    ? oppCount.get(opp.AccountId) : 0;

                if(count >= maxLimit) {
                    opp.addError('Maximum open Opportunities limit reached!');
                }
            }
        }
    }

}