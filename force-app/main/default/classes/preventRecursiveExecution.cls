public with sharing class preventRecursiveExecution {

    public static Boolean isExecuted = false;

    public static void updateAccount(List<Account> accList) {

        if(!isExecuted) {

            isExecuted = true;

            for(Account acc : accList) {

                acc.Description = 'Updated by Trigger';
            }
        }
    }
}

// Recursion occurs when a trigger executes repeatedly due to DML operations performed within the trigger or its related automation.

// To prevent unwanted recursive execution, we use a static Boolean variable in an Apex class.

// A static variable maintains its value throughout the current transaction, so we can use it to ensure that the trigger logic executes only once.

// If we don't implement recursion control:
// 1. The trigger may execute multiple times unnecessarily.
// 2. It may cause duplicate records or unwanted DML operations.
// 3. It can lead to Salesforce governor limit exceptions.

// when an Account is updated and related Contact records are updated through Apex, those Contact updates can fire the Contact trigger again. We can use recursion control to prevent unwanted repeated execution.

