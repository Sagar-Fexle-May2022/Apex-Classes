trigger TriggerAccount on Account (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            //TriggerAccountHelper.checkCondition();
            //TriggerAccountHelper.letsUpdate();
            TriggerAccountHelper.analizingData();
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            System.debug('Not Done Yet !');
            //TriggerAccountHelper.letsUpdate();
        }
    }
    if(Trigger.isAfter && TriggerAccountHelper.AVOID_SUPPORTIVE_ACCOUNT_STAGE)
    	TriggerAccountHelper.letsUpdate();
}