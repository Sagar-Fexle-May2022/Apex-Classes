/**
* Description   - Left Traingle Pascal Pattern
*
* Created by    - Sagar Nirwal
*
* Created Date  - 21/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class LeftTrianglePascal {
    public LeftTrianglePascal() {
        integer a = 6;
        for(integer i=1;i<=9;i++)
        {
            if(i<=5)
            {
                a--;
            }else
            {
                a++;
            }
            string s = '  ';
            for(integer j=1;j<=5;j++)
            {
                if(j>=a)
                {
                    s = s + '*';
                }else
                {
                    s = s + '_';
                }
            }
            system.debug(s);
        }
    }
}