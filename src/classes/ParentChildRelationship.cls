/**
* Description   - Parent Child Relationship
* Created by    - Sagar Nirwal
* Created Date  - 08/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 08/07/2022
*                  V_1.1 - Modified - Sagar Nirwal - 08/07/2022 - Modified
**/
public with sharing class ParentChildRelationship {
    /**   Description :   insertParentChild1
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 08/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Relating records by using External id 
    **/
    public static void insertParentChild1() {
        Opportunity oppOne = new Opportunity(Name = 'Fexle Services', 
                                        StageName = 'Prospecting', 
                                        CloseDate = Date.today().addDays(7) );

        List<Account> listOfAccountOne = [select id, Name from Account WHERE 
                                        Name = 'Salesforce' ];

         oppOne.AccountId =  listOfAccountOne[0].id;


        Database.SaveResult resultOfOpportunityOne = Database.insert(oppOne);

        try{
        //Relating records by using External id 
            Opportunity oppTwo = new Opportunity(Name = 'Community', 
                                            StageName = 'Prospecting', 
                                            CloseDate = Date.today().addDays(7) );

            List<Account> listOfAccountTwo = [select id, MyExtID__c from Account WHERE 
                                            MyExtID__c = 'SP1111134' ];

            oppTwo.AccountId = listOfAccountTwo[0].Id;
            Database.SaveResult resultOfOpportunityTwo = Database.insert(oppTwo);

            List<Opportunity> oppList1 = [SELECT Id,Name,AccountId From Opportunity Limit 5 ];
            List<Opportunity> oppList2 = new List<Opportunity>();
            for(Opportunity opp : oppList1 ){
                opp.AccountId = listOfAccountTwo[0].Id;
                oppList2.add(opp);
            }
            if(oppList2.size()>0){
                update oppList2;
            }
        } catch(DMLException e){
            System.debug(e.getMessage());
        }
        Opportunity newOpportunity = new Opportunity(Name='Transaction', StageName='Prospecting',
                                                    CloseDate=Date.today().addDays(1));
        
        Account accountReference = new Account( MyExtID__c='SAP111136');    
             
        
        newOpportunity.Account = accountReference;
        
        Database.SaveResult results = Database.insert(newOpportunity);
    }
    /**   Description :   insertParentChild2
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 08/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 08/07/2022 - Insert Parent and child record in single DML
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
        ////insert Parent and child record in single DML
        Opportunity opp = new Opportunity(Name='Section', StageName='Prospecting',
                                                    CloseDate=Date.today().addDays(1));
        Account acc = new Account(
            Name='Hallie',
            MyExtID__c='SAP111111');      
        
        // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] {acc, opp }); 
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            }
        } 
    }
}
