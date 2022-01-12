public with sharing class InvHandler {
    public InvHandler() {

    }

    public void shareInvoices (List<Invoice__c> invoices){
       List<Invoice__Share> shares = new List<Invoice__Share>();
       Set<Id> oppIds = new Set<Id>();
       Map<Id,Id> mapOppOwners = new Map<Id, Id>();
       Id SVP;
       
       for (Invoice__c i : invoices){
           oppIds.add(i.Opportunity__c);
       }

       for (Opportunity o : [SELECT Id, OwnerId FROM Opportunity
                             WHERE Id IN :oppIds]){
                mapOppOwners.put(o.Id,o.OwnerId);                 
                             }
        
        for (Group g : [SELECT ID, DeveloperName FROM Group
                        WHERE DeveloperName LIKE 'SVPCustomerServiceSupportA' LIMIT 1]){
                            SVP = g.Id;
                        }
        for (Invoice__c i : invoices) {
            Invoice__Share invShare = new Invoice__Share();
            invShare.ParentId = i.Id;
            invShare.UserOrGroupId = mapOppOwners.get(i.Opportunity__c);
            invShare.AccessLevel = 'Read';
            invShare.RowCause = 'Manual';
            shares.add(invShare);

            invShare = new Invoice__Share();
            invShare.ParentId = i.Id;
            invShare.UserOrGroupId = SVP;
            invShare.AccessLevel = 'Edit';
            invShare.RowCause = 'Manual';
            shares.add(invShare);
        }

        List<Database.SaveResult> srs = Database.insert(shares,false);
    }

    public void checkInvoiceDeletion(List<Invoice__c> invoices){
        for (Invoice__c inv : invoices) {
            if (inv.Balance__c > 0){
                inv.Balance__c.addError('Invoices with a balance due cannot be deleted');
       
            }
        }
    }
}