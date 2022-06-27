/**
* Description   - Control Flow Statement
*
* Created by    - Sagar Nirwal
*
* Created Date  - 24/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class ControlFlowStatement {
    /**   Description :   Control Flow Statement Using Constuctor find Leap Year 
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Integer
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public  ControlFlowStatement(integer year ){
        
        integer reminder1 = math.mod(year,4);
        integer reminder2 = math.mod(year,100);
        integer reminder3 = math.mod(year,400);
        if(((reminder1 ==0) && ( reminder2 !=0)) || (reminder3 ==0)){  
            system.debug('LEAP YEAR');  
        }  
        else{  
            system.debug('COMMON YEAR');  
        }  
    }
    /**   Description :   Control Flow Statement Using Method Calculate the Bill 
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Integer 
    *
    *     Return      :   Double
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Double electricitybill(integer units)   
    {     
        // variable to calculate electricity bill to pay  
        double billToPay = 0;  
        // check whether units are less than 100  
        if(units < 100){  
            billToPay = units * 1.20;  
        }else if(units < 300){           // check whether the units are less than 300 
            billToPay = 100 * 1.20 + (units - 100) * 2;  
        }else if(units > 300){     // check whether the units are greater than 300    
            billToPay = 100 * 1.20 + 200 * 2 + (units - 300) * 3;  
        }  
        system.debug('The electricity bill for ' +units+ ' is : ' + billToPay);  
        return billtopay; 
    }
    /**   Description :   Control Flow Statement Using Method for sObject 
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None 
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static void accountsobjectmehtod(){
        sobject assi;
        if (assi instanceof Account) {
            Account a = (Account) assi;
            system.debug('account ' + a);
        } else if (assi instanceof Contact) {
            Contact c = (Contact) assi;
            system.debug('contact ' + c);
        } else {
            system.debug('default');
        }
        
        //replace the code with switch statement
        switch on assi {
            when Account a {
                system.debug('account ' + a);
            }
            when Contact c {
                system.debug('contact ' + c);
            }
            when null {
                system.debug('null');
            }
            when else {
                system.debug('default');
            }
        }
    }
}