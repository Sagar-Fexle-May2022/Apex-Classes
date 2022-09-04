trigger StateTrigger on State__c (before update, after insert, after update, after delete) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            StateTriggerHandler.stateJsonData(Trigger.New, Trigger.OldMap);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
            StateTriggerHandler.countStatesOnCountry(Trigger.New, Trigger.OldMap);
        }
    }
}
