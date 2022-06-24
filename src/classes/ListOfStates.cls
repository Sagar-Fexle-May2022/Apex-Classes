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
    }
}