public with sharing class AccountTriggerHandlerPattern {
    
     public static void handleBeforeInsert(List<Account> accList) {

        for(Account acc : accList) {

            acc.Description = 'New Account Created';
        }
    }
}

//Trigger Handler Pattern is a design pattern in Salesforce where we separate trigger logic from the trigger itself by writing business logic in a separate Apex Handler class.

//It improves code reusability, readability and maintainability.
