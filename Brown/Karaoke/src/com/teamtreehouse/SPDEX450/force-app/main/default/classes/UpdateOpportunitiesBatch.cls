global class UpdateOpportunitiesBatch implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
      return Database.getQueryLocator('SELECT ID FROM Opportunity');
    }

    global void execute(Database.BatchableContext bc, List<Opportunity> opps){
        Database.update(opps,false);
    }

    global void finish(Database.BatchableContext bc) {
       system.debug('Batch process: '+bc.getJobId() + ' completed');
    }
}
