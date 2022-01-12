trigger UpdateOpportunityFromAccount on Account (after update) {

    Set<ID> acctIds = new Set<ID>();
    for (Account acct : trigger.new){
        Account oldAcct = trigger.oldMap.get(acct.id);
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