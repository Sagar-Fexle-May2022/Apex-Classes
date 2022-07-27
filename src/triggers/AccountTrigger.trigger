/**
* Description   - This trigger will use for type check and send email
* Created by    - Sagar Nirwal
* Created Date  - 25/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 25/07/2022
*                  V_1.1 - Modified - Sagar NIrwal - 25/07/2022 -  Details what you modified
**/
trigger AccountTrigger on Account (before insert,before update,after insert,after update) {
    //trigger for type check
    if(trigger.isBefore){
        System.debug('Checking in Before Trigger Operations');
        if(trigger.isInsert ){
            TriggerAccountHandler.insertAndUpdateAccountType(Trigger.New, Trigger.oldMap);
            System.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
            System.debug('Check Insert List ::: Trigger.old ' + Trigger.oldMap); 
        }
        if(trigger.isUpdate){
            TriggerAccountHandler.insertAndUpdateAccountType(Trigger.New, Trigger.oldMap);
            System.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
            System.debug('Check Insert List ::: Trigger.old ' + Trigger.oldMap);
        
            if(Trigger.New[0].Type != Trigger.old[0].Type){
                
                System.debug('Type Value Changed');
                System.debug('Trigger.New Data --> ' + Trigger.New[0].Type);
                System.debug('Trigger.old Data --> ' + Trigger.old[0].Type);
            } 
        }
    }
   /*if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            TriggerAccountHandler.insertAndUpdateAccountType(Trigger.New, Trigger.old);
        }
    }*/
    //trigger for email 
    if(trigger.isAfter){
        if(trigger.isInsert ){
            TriggerAccountHandler.sendEmail(Trigger.New); 
            System.debug('Check Insert List ::: Trigger.New ' + Trigger.New);  
        }
    }
}
