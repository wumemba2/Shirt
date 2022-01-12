public with sharing class AccountHandler {
    public AccountHandler() {

    }

    public void updateOppName(List<Account> acctList, Map<Id,Account> oldAccts){
        
    Set<ID> acctIds = new Set<ID>();
    for (Account acct : acctList){
        Account oldAcct = oldAccts.get(acct.id);
        if(acct.Name != oldAcct.Name){
            acctIds.add(acct.id);
        }
    }

    if (!acctIds.isEmpty()){
        List<Opportunity> oppsToUpdate = new List<Opportunity>();

        for (Opportunity opp : [SELECT ID FROM Opportunity 
                                WHERE AccountId IN :acctIds]){
                                    oppsToUpdate.add(opp);
                                }
    Database.update(oppsToUpdate, false);
    }
}

    public void createOpp (List<Account> acctList){
        List<Opportunity> oppList = new List<Opportunity>();
        for (Account acct: acctList) {
            Opportunity o = new Opportunity();
            o.AccountId = acct.Id;
            o.Type = 'New Customer';
            o.StageName = 'Qualifying';
            o.CloseDate = Date.today() + 90;
            o.Amount = 0.00;
            oppList.add(o);
        }
        if (!oppList.isEmpty()){
            Database.insert(oppList,false);
        }
    }
    }