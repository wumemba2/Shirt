public with sharing class OppHandler {
    public OppHandler() {

    }

    public void updateOppName(List<Opportunity> opps){
        Set<Id> acctIds = new Set<Id>(); 
    for (Opportunity opp : opps){
        acctIds.add(opp.AccountId);
    }

    Map<Id,String> acctNames = new Map<Id,String>();
    for (Account acct : [SELECT Name FROM Account WHERE Id IN :acctIds]){
       acctNames.put(acct.Id, acct.Name); 
    }

    for (Opportunity opp: opps){
        opp.Name = acctNames.get(opp.AccountId) + '-'
        + opp.Type + '-' + opp.CloseDate.year() + '/'
        + opp.CloseDate.month();
    }
    }

    public void createInvoiceFromOpp(List<Opportunity> opps){ //This is the version for Insert
        List<Invoice__c> invToCreate = new List<Invoice__c>();
    for (Opportunity opp : opps){
        if (opp.isWon){
                Invoice__c inv = new Invoice__c();
                inv.Account__c = opp.AccountId;
                inv.Opportunity__c = opp.Id;
                inv.Billing_Contact__c = opp.ContactId;
                inv.Amount__c = opp.Amount;
                inv.Due_Date__c = opp.CloseDate + 30;
                invToCreate.add(inv);
        }
    }
    if (!invToCreate.isEmpty()){
        Database.insert(invToCreate,false);
    }
    }
    public void createInvoiceFromOpp(List<Opportunity> opps, Map<Id,Opportunity> oldOpps){ //This is the version for Update
        List<Invoice__c> invToCreate = new List<Invoice__c>();
    for (Opportunity opp : opps){
        if (opp.isWon && !oldOpps.get(opp.Id).isWon){
                Invoice__c inv = new Invoice__c();
                inv.Account__c = opp.AccountId;
                inv.Opportunity__c = opp.Id;
                inv.Billing_Contact__c = opp.ContactId;
                inv.Amount__c = opp.Amount;
                inv.Due_Date__c = opp.CloseDate + 30;
                invToCreate.add(inv);
        }
    }
    if (!invToCreate.isEmpty()){
        Database.insert(invToCreate,false);
    }
    }
}