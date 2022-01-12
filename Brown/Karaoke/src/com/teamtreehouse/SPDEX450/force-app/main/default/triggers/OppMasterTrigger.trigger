trigger OppMasterTrigger on Opportunity (before insert, after insert,
                                         before update, after update,
                                         before delete, after delete) {
    OppHandler oh = new OppHandler();
    if (trigger.isBefore){
        if (trigger.isInsert){
            oh.updateOppName(trigger.new);
        }
        if (trigger.isUpdate){
            oh.updateOppName(trigger.new);
        }
        if (trigger.isDelete){
            
        }
    }
    if (trigger.isAfter){
        if (trigger.isInsert){
            oh.createInvoiceFromOpp(trigger.new);
        }
        if (trigger.isUpdate){
            oh.createInvoiceFromOpp(trigger.new, trigger.oldMap);
        }
        if (trigger.isDelete){
            
        }
    }

}
