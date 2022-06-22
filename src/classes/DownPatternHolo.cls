/**
* Description   - Holo Down Triangle Pattern 2
*
* Created by    - Sagar Nirwal
*
* Created Date  - 21/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class DownPatternHolo {
    public DownPatternHolo() {
        for(integer i=1;i<=5;i++)
        {
            string s = '  ';
            for(integer j=1;j<=9;j++)
            {
                if(i==1||j==i||i+j==10)
                {
                    s = s+'*';
                }else
                {
                    s = s+'_'; 
                }
            }
            system.debug(s);
        }
    }
}