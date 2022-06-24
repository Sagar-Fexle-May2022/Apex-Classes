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
    }
}