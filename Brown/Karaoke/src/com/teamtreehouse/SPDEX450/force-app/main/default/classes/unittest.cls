@isTest
private class unittest {

        @isTest static void testAutoOppCreation() {
        Account acct = new Account();
        acct.Name = 'Test Account';
        insert acct;

        Opportunity o = [SELECT Name FROM Opportunity WHERE AccountId = :acct.Id LIMIT 1];
            
        }
    }


