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
