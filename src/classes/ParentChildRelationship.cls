/**
* Description   - Parent Child Relationship
* Created by    - Sagar Nirwal
* Created Date  - 08/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 08/07/2022
*                  V_1.1 - Modified - Your Name - Date - Modified
**/
public with sharing class ParentChildRelationship {
    /**   Description :   insertParentChild1
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 08/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void insertParentChild1() {
        Opportunity oppOne = new Opportunity(Name = 'Fexle Services', 
                                        StageName = 'Prospecting', 
                                        CloseDate = Date.today().addDays(7) );

        List<Account> listOfAccountOne = [select id, Name from Account WHERE 
                                        Name = 'Salesforce' ];

         oppOne.AccountId =  listOfAccountOne[0].id;


        Database.SaveResult resultOfOpportunityOne = Database.insert(oppOne);

        //Relating records by using External id 
        Opportunity oppTwo = new Opportunity(Name = 'Community', 
                                        StageName = 'Prospecting', 
                                        CloseDate = Date.today().addDays(7) );

        List<Account> listOfAccountTwo = [select id, MyExtID__c from Account WHERE 
                                        MyExtID__c = 'SP1111134' ];

        oppTwo.AccountId =  listOfAccountTwo[0].id;


        Database.SaveResult resultOfOpportunityTwo = Database.insert(oppTwo);
    }
    /**   Description :   insertParentChild2
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 08/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void insertParentChild2() {

        //Parent to Child Quiers of relationship
        List<Account> listOfAccount  = [Select Name, (Select Name from Contacts) from Account];
        for(Account act : listOfAccount ){
            System.debug('Name:'+ act.Name );
        }    

        //Child to Parent Quiers of relationship
        List<Contact> listOfContact = [Select FirstName, LastName, Account.Name, 
                                        Account.Industry from Contact ];
        for(Contact con : listOfContact){
            System.debug('Account Name:' + con.Account.Name);

            System.debug('Industry:' + con.Account.Industry);
        }                                   
    }
}
