trigger OpportunityTrigger on Opportunity (after insert,after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert ){
            OpportunityTriggerHandler.automobileSensor(Trigger.new,Trigger.oldMap); 
            System.debug('Trigger.new -->' +Trigger.new);
            System.debug('Trigger.old -->' +Trigger.oldMap);
        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.automobileRecords(Trigger.new,Trigger.oldMap); 
            System.debug('Trigger.new -->' +Trigger.new);
            System.debug('Trigger.old -->' +Trigger.oldMap); 
        }
    }
}