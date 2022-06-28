/**
* Description   - Getter And Setter
*
* Created by    - Sagar Nirwal
*
* Created Date  - 25/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class GetterandSetter {
    /**   Description :   Getter And Setter Variable
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Integer counter {
        get{ 
        	return counter;
        }
        set{
            counter = value;
        }
    }
    /**   Description :   Getter And Setter Variable
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Integer readOnlyCounter {
        get{ 
        	return readOnlyCounter;
        }
    }
    /**   Description :   Getter And Setter Variable
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Integer writeOnlyCounter {
        get;
        set{ 
        	writeOnlyCounter = value;
        }
    }
    /**   Description :   Getter And Setter 
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static void getterandsetter(){
        
        //Call set accessor for counter
        counter = 5;

        //Call get accessor for counter
        System.debug(counter);
        
        //Call get accessor for readOnly Counter
        System.debug(readOnlyCounter);
        
        //Use set accessor for writeOnlyCounter
        writeOnlyCounter = 15;
        
        //This will error as there is no get accessor on this property
        System.debug(writeOnlyCounter);
    }
}