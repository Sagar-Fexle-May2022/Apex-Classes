trigger StateTrigger on State__c (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
            StateTriggerHandler.countStatesOnCountry(Trigger.New, Trigger.OldMap);
        }
    }
}