public with sharing class RelatedContactOfAccount {
   
    public static void RelatedContact(){

        Set<Id> accId = new Set<Id>();

        Map<Id,List<Contact>> mapCon = new Map<Id,List<Contact>>();

        Map<Id,String> mapAcc = new Map<Id,String>();

        List<Account> accList = [SELECT Id, Name FROM Account];

        for(Account acc : accList){

            accId.add(acc.Id);
            mapAcc.put(acc.Id, acc.Name);
        }

        if(!accId.isEmpty()){

            for(Contact con : [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN :accId]){

                if(!mapCon.containsKey(con.AccountId)){

                    mapCon.put(con.AccountId,new List<Contact>());
                }

                mapCon.get(con.AccountId).add(con);
            }
        }

        for(Id key : mapCon.keySet()){

            System.debug('Account Id: ' + key);
            System.debug('Account Name: ' + mapAcc.get(key));

            for(Contact con : mapCon.get(key)){

                System.debug('Contact Name: ' + con.Name);
            }
        }
    }
}