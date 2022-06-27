/**
* Description   - Collection Map Of Product
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class MapOfProduct {
    /**   Description :   Collection Map Of Product
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
    public MapOfProduct() {
        // Initialize the Map
        Map<string, string> productCodeToproductName = new Map<string, string>
        {'1000'=>'HCL', '1001'=>'H2SO4'};

        // This statement would give as output as key value pair in Debug log
        System.debug('value of ProductCodeToProductName'+productCodeToproductName);
        
        // Define a new map
        Map<string, string> p = new Map<string, string>();

        // Insert a new key-value pair 
        p.put('1002', 'Acetone');
        p.put('1003', 'Ketone');

        // Assert that the map contains a specified key and respective value
        System.assert(p.containsKey('1002'));
        System.debug('If output is true then Map contains the key and output is:'
        + p.containsKey('1002'));

        // Retrieves a value, given a particular key
        String value = p.get('1002');
        System.debug('Value at the Specified key using get function: '+value);

        // Return a set that contains all of the keys in the map
        Set<String> setOfKeys = p.keySet();
        System.debug('Value of Set with Keys '+setOfKeys);
        
        //Define and Initialize the Map of Interger and String
        Map<Integer, String> mymap = new Map<Integer, String>();
        
        // Insert a new key-value pair in the map
        mymap.put(1, 'First entry');                 
        mymap.put(2, 'Second entry'); 
        
        // Assert that the map contains a key
        System.assert(mymap.containsKey(1));  
        
        // Retrieve a value, given a particular key
        String value2 = mymap.get(2);               
        System.assertEquals('Second entry', value2);
        
        // Return a set that contains all of the keys in the map
        Set<Integer> s = mymap.keySet();
        system.debug('Value of Set with Keys '+s);
    }
    
    /**   Description :   Collection Map of sObject 
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   List<sObject> record List
    *
    *     Return      :   Map<ID, sObject>
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Map<ID, sObject> accountMethod1(){
        List<Account> listofsObject = [select Id,Name from Account];
        for(Account a :listofsObject){
        	system.debug(a);
        }

        Map<Id, Account> mapofsObject = new Map<Id, Account>(listofsObject);
        for(Account a :mapofsObject.values()){
        	system.debug(a);
        }
        return mapofsObject;
    }
    /**   Description :   Collection Map of Object deep clone
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   Map<Integer, Object>
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Map<Integer, Object> accountMethod2(){
        Account a = new Account(Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, a);

        Map<Integer, Account> map2 = map1.deepclone();
        map1.get(1).BillingCity = 'San Francisco';

        // Update the first entry of map1
        System.assertEquals('San Francisco',map1.get(1).BillingCity);

        // Verify that the BillingCity is updated in map1 but not in map2
        System.assertEquals('New York',map2.get(1).BillingCity);
        
        for(Account a1 : map2.values()){
            system.debug(a1);
        }
        return map2; 
    }
}
