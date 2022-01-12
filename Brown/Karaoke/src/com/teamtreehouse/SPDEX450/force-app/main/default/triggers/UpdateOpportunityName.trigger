trigger UpdateOpportunityName on Opportunity (before insert, before update) {

   Set<Id> acctIds = new Set<Id>(); 
for (Opportunity opp : trigger.new){
    acctIds.add(opp.AccountId);
}
Map<Id,String> acctNames = new Map<Id,String>();
for (Account acct : [SELECT Name FROM Account WHERE Id IN :acctIds]){
   acctNames.put(acct.Id, acct.Name); 
}
for (Opportunity opp: trigger.new){
    opp.Name = acctNames.get(opp.AccountId) + '-'
    + opp.Type + '-' + opp.CloseDate.year() + '/'
    + opp.CloseDate.month();
}
}
