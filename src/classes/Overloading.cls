/**
* Description   - Overloading
*
* Created by    - Sagar Nirwal
*
* Created Date  - 26/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Overloading {
    /**   Description :   Overloading  
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Two Integer
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Integer sum(integer FirstNum,integer SecondNum){
        integer s = FirstNum+SecondNum;        
        system.debug(s);
        return s;
    }
    /**   Description :   Overloading  
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Three Integer
    *
    *     Return      :   Integer
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public static Integer sum(integer FirstNum,integer SecondNum,integer ThridNum)
    {
        integer s = FirstNum+SecondNum+ThridNum;        
        system.debug(s);
        return s;
    }
}