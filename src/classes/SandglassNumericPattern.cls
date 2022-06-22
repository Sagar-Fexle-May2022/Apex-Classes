/**
* Description   - Sandglass Numberic Pattern
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class SandglassNumericPattern {
    public SandglassNumericPattern() {
        integer a = 0;
        for(integer i=1;i<=10;i++){
            string s = '  ';
            if(i<=5)
            {
                a++ ;
            }else
            {
                a-- ;
            }
            if(i==6){
                a++;
            }
            for(integer j=1;j<=9;j++){
                if(j>=a && j<=10-a)
                {
                    s = s + j ;
                }else
                {
                    s = s + '_';
                }
            }
            system.debug(s);
        }
    }
}