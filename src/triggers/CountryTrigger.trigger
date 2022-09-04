trigger CountryTrigger on Country__c (before update) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            CountryTriggerHandler.countryJsonData(Trigger.New, Trigger.OldMap);
        }
    }
}