/**
* Description   - Method List
* Created by    - Sagar Nirwal
* Created Date  - 03/09/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 03/09/2022
*                  V_1.1 - Modified - Sagar NIrwal - 03/09/2022 -  Details what you modified
**/
public with sharing class MethodList {
    @AuraEnabled(cacheable=true)
    /**   Description :   getTextMethod1
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   String
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 03/09/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 03/09/2022 - Details what you modified
    **/
    public static String getTextMethod1(){
        return 'METHOD-1';
    }
    /**   Description :   getTextMethod2
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   String
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 03/09/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 03/09/2022 - Details what you modified
    **/
    @AuraEnabled(cacheable=true)
    public static String getTextMethod2(){
        return 'METHOD-2';
    }
    /**   Description :   getTextMethod3
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   String
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 03/09/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 03/09/2022 - Details what you modified
    **/
    @AuraEnabled(cacheable=true)
    public static String getTextMethod3(){
        return 'METHOD-3';
    }
}
