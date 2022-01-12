trigger AccountMasterTrigger on Account (before insert, after insert,
                                         before update, after update,
                                         before delete, after delete) {
    AccountHandler ah = new AccountHandler();
    if (trigger.isBefore){
        if (trigger.isInsert){
            
        }
        if (trigger.isUpdate){
           
        }
        if (trigger.isDelete){
            
        }
    }
    if (trigger.isAfter){
        if (trigger.isInsert){
            ah.createOpp(trigger.new);
        }
        if (trigger.isUpdate){
            ah.updateOppName(trigger.new, trigger.oldMap);
        }
        if (trigger.isDelete){
            
        }
    }

}
