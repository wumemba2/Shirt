public with sharing class InvoicesController {
    private Id oid;
    private Opportunity o;

    public InvoicesController(ApexPages.StandardSetController ssc) {
        oid = ApexPages.currentPage().getParameters().get('id');
        loadOpportunity();
    }

    private void loadOpportunity(){
        o = [SELECT AccountId FROM Opportunity WHERE Id = :oid];
    }

    public List<Invoice__c> newinvoices {
        get{
          if (newinvoices == null){
              newinvoices = new List<Invoice__c>();

          for (Integer i=0; i < 12; i++){
              Invoice__c inv = new Invoice__c();
              inv.Opportunity__c = oid;
              inv.Account__c = o.AccountId;
            newInvoices.add(inv);
          }
        }
        return newinvoices;
        }
        set{}
    }

    public Pagereference save() {
        List<Invoice__c> invoicesToCreate = new List<Invoice__c>();
    
        for (Invoice__c inv : newInvoices){
            if (inv.Amount__c > 0) {
                invoicesToCreate.add(inv);
            }
        }
        insert invoicesToCreate;

        PageReference pr = new PageReference('/'+oid);
        return pr;
    }

    public Pagereference cancel() {
        PageReference pr = new PageReference('/'+oid);
        return pr;
    }
}
