/**
* Description   - List Of States
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class ListOfStates {
    /**   Description :   Collection List Of States
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
    public ListOfStates() {

        // Initialize the List
        List<String> listofstates = new List<String>();

        // This statement would give null as output in Debug logs
        system.debug('Value of List : ' +listofstates);

        // Add element to the list using add method
        listofstates.add('Uttar Pardesh');
        listofstates.add('Rajasthan');
        listofstates.add('MP');
        listofstates.add('UK');

        // This statement would give Uttar Pardesh, Rajasthan, MP and UK as output in Debug logs
        system.debug('Value of List new States : ' +listofstates);

        // Get the element at the index 0
        String StatesAtFirstPosition = listofstates.get(0);

        // This statement would give Uttar Pardesh as output in Debug log
        system.debug('Vaule of List at First Position : ' +StatesAtFirstPosition);

        // set the element at 1 position
        listofstates.set(0,'Haryana');

        // This statement would give output in Debug log
        system.debug('Vaule of List with element set at First Position : ' +listofstates[0]);

        // Remove all the elements in List
        listofstates.clear();

        // This statement would give output in Debug log
        system.debug('Value of List'+ listofstates);
    
        // Sorting List
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('A','Uttar Pardesh'));
        options.add(new SelectOption('C','Rajasthan'));
        options.add(new SelectOption('A','UK'));
        
        System.debug('Before sorting: ' + options);
        options.sort();
       
        System.debug('After sorting: ' + options);

        // Initialize the List of Integer
        List<Integer>  integerlist= new List<Integer>();
        integerlist.add(234);
        integerlist.add(12);
        integerlist.add(356);

        // Retrieves the element at index 0
        Integer i = integerlist.get(0);
        system.debug(i);

        // Adds the integer 1 to the list at index 0
        integerlist.set(0, 1);


        // Create a list based on an existing one
        List<Integer> integerlist2 = new List<Integer>(integerlist);
        
        // integerlist2 elements are copied from integerlist
        System.debug(integerlist2);

        integerlist2.add(1);
        Integer myNumber = integerlist.get(0);
        system.assertEquals(1, myNumber);
    }
    /**   Description :   Collection List of Object using clone method
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   List<Object>
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static List<Object> accountMethod(){
        Account a = new Account(Name='Acme', BillingCity='New York');

        Account b = new Account();
        Account[] c = new Account[]{a,b};

        Account[] d = c.clone();
        c[0].BillingCity = 'San Francisco';

        system.assertEquals('San Francisco',c[0].BillingCity);
        system.assertEquals('San Francisco',d[0].BillingCity);
        for(Account a1 : d){
            system.debug(a1);
        }
        return d;
    }
    /**   Description :   Collection List of sObject using deep clone method
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   List<sObject>
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static List<sObject> accountMethod2(){
        Account a = new Account(Name='Acme', BillingCity='New York');

        Account b = new Account(Name='Salesforce');
        Account[] c = new Account[]{a,b};

        Account[] d = c.deepclone();
        c[0].BillingCity = 'San Francisco';

        system.assertEquals('San Francisco',c[0].BillingCity);
        system.assertEquals('New York',d[0].BillingCity);
        
        for(Account a1: c){
            system.debug(a1);
        }
        //insert c;

        List<Account> accts = [SELECT CreatedById, CreatedDate, LastModifiedById, LastModifiedDate, BillingCity 
                              FROM Account 
                              WHERE Name='Acme' OR Name='Salesforce'];

        // Clone list while preserving timestamp and user ID fields.
        Account[] e = accts.deepClone(false,true,false);

        // Verify timestamp fields are preserved for the first list element. 
        System.assertEquals(accts[0].CreatedById,e[0].CreatedById);
        
        System.assertEquals(accts[0].CreatedDate,e[0].CreatedDate);
        
        System.assertEquals(accts[0].LastModifiedById,e[0].LastModifiedById);
        
        System.assertEquals(accts[0].LastModifiedDate,e[0].LastModifiedDate);

        for(Account a2: e){
            system.debug(a2);
        }
        return e;
    }
}
