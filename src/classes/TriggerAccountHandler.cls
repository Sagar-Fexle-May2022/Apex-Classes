/**
* Description   - Trigger Account Handler
* Created by    - Sagar Nirwal
* Created Date  - 25/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 25/07/2022
*                  V_1.1 - Modified - Sagar NIrwal - 25/07/2022 -  Details what you modified
**/
public with sharing class TriggerAccountHandler {
    /**   Description :   Method for Before insert and update  
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List(trigger.new),Map(trigger.oldMap)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 25/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 27/07/2022 - use trigger.OldMap 
    **/
    public static void insertAndUpdateAccountType(List<Account> newAccounts,   Map<Id,Account> oldMapAccounts) {
        //String variable for removing prevoius SA or FD from account number
        String prefixLetter;
        for(Account acc : newAccounts){
            if((oldMapAccounts == null || acc.Type != oldMapAccounts.get(acc.Id).Type)){
                if(acc.Type == 'Saving Account'){
                    //removing the previous prefix of account number to add the apporpirate prefix after update
                    prefixLetter = (acc.AccountNumber.contains('FD-')) ? acc.AccountNumber.remove('FD-') : acc.AccountNumber ;
                    acc.AccountNumber = 'SA-'+ prefixLetter;
                }
                else if( acc.Type == 'Fixed Deposit'){
                    //removing the previous prefix of account number to add the apporpirate prefix after update
                    prefixLetter = (acc.AccountNumber.contains('SA-')) ? acc.AccountNumber.remove('SA-') : acc.AccountNumber ;
                    acc.AccountNumber = 'FD-'+ prefixLetter;
                }
                else{
                    if(oldMapAccounts != null && oldMapAccounts.get(acc.Id).Type == 'Saving Account'){
                        prefixLetter = (acc.AccountNumber.contains('SA-')) ? acc.AccountNumber.remove('SA-') : acc.AccountNumber ;
                    }
                    else if(oldMapAccounts != null && oldMapAccounts.get(acc.Id).Type == 'Fixed Deposit'){
                        prefixLetter = (acc.AccountNumber.contains('FD-')) ? acc.AccountNumber.remove('FD-') : acc.AccountNumber ;
                    }else{
                        prefixLetter = acc.AccountNumber;
                    }
                    acc.AccountNumber =  prefixLetter ;
                }
                if(oldMapAccounts != null){
                    acc.Description = 'Midifed Account';           
                }
            }
        }
    }
    /**   Description :   Send Email Method for Aftere insert  
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List(trigger.new)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 25/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 25/07/2022 - Details what you modified
    **/
    public static void sendEmail(List<Account> newAccounts){

        //get all email in the list
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(Account acc: newAccounts){
            if(acc.Name != null && acc.Type != null && acc.Email__c != null){   
                //Create a new Email     
            	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSubject('Your Account has been create successfully');
                //Set list of people who should get the email
                mail.setToAddresses(new String[]{acc.Email__c});
                //Set email contents - you can use variables!
                mail.setHtmlBody('Hi '+acc.Name+',<br>'+'Congratulation your account has been created successfully and your '
                                 +acc.Type +' Account No: '+acc.AccountNumber);
                //Add your email to the master list
                emailList.add(mail);
            }
        }
        //Send all emails in the master list
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
    }
}
