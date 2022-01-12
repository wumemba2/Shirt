trigger CreateInvoiceFromOpportunity on Opportunity (after insert, after update) {

    //If it is a new oppty and has already been set to Closed Won then create invoices
    //If it is an existing oppty and has been updated to closed win then create invoices

    List<Invoice__c> invToCreate = new List<Invoice__c>();
    for (Opportunity opp : trigger.new){
        if ((trigger.isInsert && opp.isWon) ||
            (trigger.isUpdate && opp.isWon && !trigger.oldMap.get(opp.Id).isWon)){
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

