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
    *     Arguments   :   List(trigger.new),List(trigger.old)
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 25/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 25/07/2022 - Details what you modified
    **/
    public static void insertAndUpdateAccountType(List<Account> newList,  List<Account> oldList) {
        //String variable for removing prevoius SA or FD from account number
        String prefixLetter;
        for(Account acc : newList){
            if(acc.Type != null && acc.Type == 'Saving Account' ){
                //removing the previous prefix of account number to add the apporpirate prefix after update
                prefixLetter = (acc.AccountNumber.contains('FD-')) ? acc.AccountNumber.remove('FD-') : acc.AccountNumber ;
                acc.AccountNumber = 'SA-'+ prefixLetter;

            }
            if(acc.Type != null && acc.Type == 'Fixed Deposit'){
                //removing the previous prefix of account number to add the apporpirate prefix after update
                prefixLetter = (acc.AccountNumber.contains('SA-')) ? acc.AccountNumber.remove('SA-') : acc.AccountNumber ;
                acc.AccountNumber = 'FD-'+ prefixLetter;
            }
            if(acc.Type != null && acc.Type == 'Other'){
                if(oldList != null && oldList[0].Type == 'Saving Account'){
                    prefixLetter = (acc.AccountNumber.contains('SA-')) ? acc.AccountNumber.remove('SA-') : acc.AccountNumber ;
                }
                if(oldList != null && oldList[0].Type == 'Fixed Deposit'){
                    prefixLetter = (acc.AccountNumber.contains('FD-')) ? acc.AccountNumber.remove('FD-') : acc.AccountNumber ;
                }
                acc.AccountNumber =  prefixLetter ;
            }
            if(oldList != null && acc.Type != oldList[0].Type){
				acc.Description = 'Modified Account';           
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
    public static void sendEmail(List<Account> newList){

        //get all email in the list
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(Account acc: newList){
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