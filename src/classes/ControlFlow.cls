/**
* Description   - Control Flow Loop 
*
* Created by    - Sagar Nirwal
*
* Created Date  - 25/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class ControlFlow {
    /**   Description :   Control Flow Do-While Loop
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
    public ControlFlow(integer count, integer stop, integer num) {

        do {
            System.debug(count);
            count++;
        } while (count < stop);

        //Print Factorial Number
        integer i = 1; 
        integer fact = 1; 
        do {  
            fact = fact * i;   
            i++;   
        } while( i <= num );  

        system.debug('Factorial of ' + num + ' is: ' + fact);  
        
        // Code for do while loop
        ////it will fetch only 20 records
        List<Account> accountList = [SELECT Id,Name FROM Account LIMIT 20]; 

        integer j = 0;
        do {
        accountList[j].Name = 'This is the '+j;

        // This will print the updated description in debug log
        system.debug('Updated Description'+accountList[j].Name);
        j++; // Increment the counter
        } while (j< 1);   // iterate till 1st record only
    }
    /**   Description :   Control Flow While Loop
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
    public static void methodwhile(integer a){
        integer i = 1,fact = 1;        
        while( i <= a ){  
            fact = fact * i;   
            i++; //increment i by 1   
        }      
        system.debug('Factorial : ' + fact); 
        integer k = 1, l =1;
        string s = ' ';
        string b = '  ';
        while(k <= a)
        {
            while(l <= k)
            {
                s = s + '*';
                l++;
            }
            s = s + preserveWhitespace(b);
            k++;
            system.debug(s);
        }

        //Fetch 20 records from database
        List<Account> accountList= [SELECT Id, Name FROM Account LIMIT 20];
        integer g = 1;
        //Update ONLY 10 records
        while (g< 10) {
        accountList[g].Name= 'This is the '+g;
        System.debug('Updated Description'+accountList[g].Name);
        g++;
        }
    }
    /**   Description :   Control flow using this method to get space in while loop
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   String
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static String preserveWhitespace(String s){
        if(s!= null)
            s = s.replace(' ',String.fromCharArray( new Integer[] { 160 }));
    
        return s;
    }
    /**   Description :   Control flow using for-each loop
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
    public static void methodforeach(){
        List<Account> accList = [SELECT Id,Name From Account LIMIT 20];
        for(Account acc : accList){
            system.debug('##'+acc);
        }

        Map<Id,Contact> contactMap = new Map<Id,Contact>([SELECT Id,Name FROM Contact LIMIT 20]);
        for(Contact con : contactMap.values()){
            system.debug('===>>>'+con);
        }
        for(Id idd : contactMap.keySet()){
            system.debug('####'+idd);
        }

        Set<String> strSet = new Set<String>();
        strSet.add('One');
        strSet.add('Two');
        strSet.add('Three');
        strSet.add('Four');
        strSet.add('Five');
        strSet.add('Six');
        strSet.add('Seven');
        strSet.add('Eight');
        strSet.add('Nine');
        strSet.add('Ten');

        for(String st : strSet){
            system.debug('!!!'+st);
        }
    }
}