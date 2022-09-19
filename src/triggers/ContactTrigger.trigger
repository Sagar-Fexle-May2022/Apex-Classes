trigger ContactTrigger on Contact (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert|| Trigger.isBefore){
            ContactTriggerHandler.synchronizeContactAccountPropertyRecord(Trigger.new,Trigger.oldMap);
        }
    }
}
