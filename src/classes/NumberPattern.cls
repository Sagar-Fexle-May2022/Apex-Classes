/**
* Description   - Number Pattern
*
* Created by    - Sagar Nirwal
*
* Created Date  - 21/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class NumberPattern {
    public NumberPattern() {
        integer a = 1;
        for(integer i=1;i<=5;i++)
        {
            string s = '  ';
            for(integer j=1;j<=i;j++)
            {
                if(j<=i)
                {
                    s = s + a ;
                    a++ ;
                }
            }
            system.debug(s);
        }
    }
}