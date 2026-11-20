public with sharing class DataBaseInsertApproaches {
    
      public static void createContacts(List<Account> accList) {

        List<Contact> conList = new List<Contact>();

        for(Account acc : accList) {

            conList.add(new Contact(
                LastName = 'Test',
                AccountId = acc.Id
            ));
        }

        Database.SaveResult[] results = Database.insert(conList, false);

        for(Database.SaveResult sr : results) {

            if(sr.isSuccess()) {
                System.debug('Inserted: ' + sr.getId());
            }
            else {
                System.debug('Failed: ' + sr.getErrors()[0].getMessage());
            }
        }
    }
}