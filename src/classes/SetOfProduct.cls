/**
* Description   - Collection Set Of Product
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class SetOfProduct {
    /**   Description :   Collection Set Of Product
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :    None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public SetOfProduct() {
        Set<String> productset = new Set<String>{'Phenol', 'Benzene', 'H2SO4'};
        system.debug('Value of ProductSet : ' +productset);

        // Adds an element to the set
        productset.add('HCL');
        system.debug('Set with New Value : ' +productset);

        // Removes an element from set
        productset.remove('HCL');
        system.debug('Set with removed value : ' +productset);

        // Check whether set contains the particular element or not and returns true or false
        productset.contains('HCL');
        system.debug('Value of Set with all values : ' +productset);
    }
}