trigger InvMasterTrigger on Invoice__c (before insert, after insert,
                                         before update, after update,
                                         before delete, after delete) {
    InvHandler ih = new InvHandler();
    if (trigger.isBefore){
        if (trigger.isInsert){
            
        }
        if (trigger.isUpdate){
           
        }
        if (trigger.isDelete){
            ih.checkInvoiceDeletion(trigger.old);
        }
    }
    if (trigger.isAfter){
        if (trigger.isInsert){
            ih.shareInvoices(trigger.new);
        }
        if (trigger.isUpdate){
            ih.shareInvoices(trigger.new);
        }
        if (trigger.isDelete){
            
        }
    }

}
