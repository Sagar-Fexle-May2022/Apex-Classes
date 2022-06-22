/**
* Description   - Reversed Pyramid Pattern
*
* Created by    - Sagar Nirwal
*
* Created Date  - 21/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class ReversedPyramid {
    public ReversedPyramid() {

        for(integer i=1;i<=5;i++)
        {
            string s = '  ';
            for(integer j=1;j<=9;j++)
            {
                if(j>=i && j<=10-i)
                {
                    s = s +'*';
                }else
                {
                    s = s +'_';
                }
            }
            system.debug(s);
        }
    }
}