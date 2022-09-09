/**
* Description   - Contact Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 028/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 28/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 28/08/2022 -  Details what you modified
**/
public with sharing class ContactTriggerHandler {
    /**   Description :   Method synchronize Record
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<State__c>,List<State__c>
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 28/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 28/08/2022 - Details what you modified
    **/
    public static void synchronizeContactAccountPropertyRecord(List<Contact> newContactList) {
        Set<Id> setOfAccountIds = new Set<Id>();
        for(Contact con: newContactList){
            if(con.Status__c == null){
                setOfAccountIds.add(con.AccountId);   
            }
        } 
        System.debug(setOfAccountIds);
        if(!setOfAccountIds.isEmpty()){
            Map<Id,Account> mapOfStatesToUpdate = new Map<Id,Account>([SELECT Id,Status__c,Property__c,Property__r.Status__c,Property__r.Name 
                                                                    FROM Account WHERE Id IN: setOfAccountIds]);
            System.debug(mapOfStatesToUpdate);                                                            
            for(Contact con: newContactList){
                if(con.Status__c == null) {
                    for(Account acc : mapOfStatesToUpdate.values()) {
                        if(con.AccountId == acc.Id) {
                            if(acc.Status__c != null){
                                con.Status__c = acc.Status__c;
                                System.debug('Contact Status:======== ' + con.Status__c); 
                            }else if(acc.Status__c == null){
                                con.Status__c = acc.Property__r.Status__c;
                                acc.Status__c = acc.Property__r.Status__c;
                                System.debug('Contact Status:======== ' + con.Status__c);
                                System.debug('Account Status:======== ' + acc.Status__c);
                            } 
                        }
                    }
                }
            }
        }
    }
}
