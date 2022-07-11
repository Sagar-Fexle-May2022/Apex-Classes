/**
* Description   - Record
* Created by    - Sagar Nirwal
* Created Date  - 09/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 09/07/2022
*                  V_1.1 - Modified - Your Name - Date - Modified
**/
public with sharing class Record {
    /**   Description :   recordDML150
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 09/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void recordDML150() {
        List<Contact> listofContact1 = [Select id, Name, Department, Description from Contact];
        List<Contact> listofContact2 = new List<Contact>();
        for(Contact con : listofContact1 ){
            con.Department = 'Finance';
            con.Description = 'Contact Update From DML';
            listofContact2.add(con);
        }
        if(listofContact2.size()>0){
            update listofContact2;
        }
        //ADDING AND RETRIEVING THE DATA
        Account accOne = [SELECT Name,Industry FROM Account WHERE Name = 'Coffeemaker B' LIMIT 1];
        System.debug('Name => ' + accOne.Name); 
        System.debug('Name => ' + accOne.Industry); 

        accOne.Name = 'Swapnil Kataria';
        accOne.Industry = 'Dell-Mart';

        update accOne;

        // INSERTING AND UPDATING RECORDS -->>
        try{
            Account accTwo = new Account(Name='Bank Account');
            insert accTwo;
            ID accID = accTwo.ID;
            Contact con = new Contact(
            FirstName='David',
            LastName='Mallan',
            Phone='+1413459867',
            AccountId=accID);
            insert con;
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        // UPDATING RECORD
        try {
            Contact updateContact = [SELECT Account.Name 
                                    FROM Contact 
                                    WHERE FirstName = 'David' AND LastName='Mallan'
                                    LIMIT 1];
            updateContact.Phone = '+919045678444';
            updateContact.Account.Industry = 'Gen-Pack';

            update updateContact;
            update updateContact.Account; 
        } catch(Exception e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    /**   Description :   VARIOUS DML OPERATIONS
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 09/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void recordToDatabase(){
        List<Account> accList = new List<Account>();
        Account insertAccOne = new Account(Name='Tech-Trash-One', Phone='3454678766');
        Account insertAccTwo = new Account(Name='Tech-Trash-Two', Phone='3478657896');
        accList.add(insertAccOne);
        accList.add(insertAccTwo);
        insert accList;
        
        // INSERTING A CONTACT
        Account insertAccThree = new Account(Name='Tech-Trash-Three', Phone='3451231243');
        insert insertAccThree;
                
        Contact con = new Contact(FirstName='Nikhil', LastName='Kumawat',AccountId=insertAccThree.Id);
        insert con;

        // UPDATING
        Account acc = [SELECT Id,Name,Phone FROM Account WHERE Name='Tech-Trash-One'];
        System.debug('Acc => ' +acc);
        acc.Phone = '909999';
        update acc;
        
     	Account updatedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name='Tech-Trash-One'];
        System.assertEquals(updatedAcc.Phone, acc.Phone, 'Equal');
    
        //  UPSERT
    
        List<Account> combine = new List<Account>();
        Account a = new Account(Name='Tech-Trash-Four', Phone = '232323');
        Account b = [SELECT Id,Name, Phone FROM Account WHERE Name='Tech-Trash-Two'];
        
        b.Phone = '777777'; 
        combine.add(a);
        combine.add(b);
        upsert combine;
    
        //  MERGE
        
        Account acc4 = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech-Trash-Four'];
        // Accessing a existing record which have contact details
        Account accMerge = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech-Trash-Three'];
        // Now initiate the Merge operation
        merge acc4 accMerge;

        //  DELETE RECORDS
        List<Account> delAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Tech-Trash-Two'];
        delete delAcc;
    
        //  UNDELETE RECORDS
        List<Account> deletedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Tech-Trash-Two' ALL ROWS];
        undelete deletedAcc;
    }

    /**   Description :   Collection Method
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 09/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void collectionmethod(){
        //List
        List<Integer> intList = new List<Integer>();
        List<Integer> intList2 = new List<Integer>{6,7,8};
        intList.add(1);
        intList.add(2);
        intList.add(3);
        intList.add(4);
        intList.add(5);
        System.debug(intList);


        intList.addAll(intList);

        System.debug(intList2);
        Integer size = intList.size();

        System.debug(size);

        Integer myNumber = intList.get(0);

        Boolean result = intList.contains(5);

        //Set
        Set<String> mySet1 = new Set<String>{'a', 'b', 'c'};
        Boolean result1 = mySet1.add('d');
        System.assertEquals(true, result1);

        Boolean result2 = mySet1.isEmpty();

        Set<integer> mySet2 = new Set<integer>{1, 2, 3};
        List<integer> myList = new List<integer>{1, 3};
        Boolean result3 = mySet2.retainAll(myList);
        System.assertEquals(true, result3);

        Integer result4 = mySet2.size();
        

        //Map
        Account a = new Account(Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, a);

        Map<Integer, Account> map2 = map1.clone();
        map1.get(1).BillingCity = 'San Francisco';

        System.assertEquals('San Francisco',map1.get(1).BillingCity);

        System.assertEquals('San Francisco',map2.get(1).BillingCity);

        Map<String, String> colorCodes = new Map<String, String>();

        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');

        Boolean contains = colorCodes.containsKey('Blue');
        System.assertEquals(true, contains);

        SObject sObj = Database.query('SELECT Id FROM Account LIMIT 1');

        // Verify if that sObject variable is an Account token.
        System.assertEquals(
        Account.sObjectType, 
        sObj.getSObjectType());

        // Create a map of generic sObjects 
        Map<Integer, Account> m = new Map<Integer, Account>();

        // Verify if the map contains Account tokens.
        System.assertEquals(
        Account.sObjectType, 
        m.getSObjectType());
    }
}
