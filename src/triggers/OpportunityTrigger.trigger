/**
* Description   - This trigger will use for Stage and send email
* Created by    - Sagar Nirwal
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 01/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 01/08/2022 -  Details what you modified
**/
trigger OpportunityTrigger on Opportunity (after insert,after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            OpportunityTriggerHandler.automobileSensor(Trigger.new,Trigger.oldMap,Trigger.Old); 
            System.debug('Trigger.new -->' +Trigger.new);
            System.debug('Trigger.old -->' +Trigger.oldMap);
        }
    }
}
