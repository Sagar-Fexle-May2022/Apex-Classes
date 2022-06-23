/**
* Description   - Reversed Pyramid Pattern(Using Two loop)
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
    /**   Description :   Reversed Pyramid Using two Loop
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   integer to diaplay number of rows
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public ReversedPyramid(integer n) {

        for(integer i=1;i<=n;i++)
        {
            string s = ' ';
            string b = '  ';
            for(integer j=1;j<=(2*n-1);j++)
            {
                if(j>=i && j<=2*n-i)
                {
                    s = s +'*';
                }else
                {
                    s = s + preserveWhitespace(b);
                }
            }
            system.debug(s);
        }
    }
    public static String preserveWhitespace(String s){
	if(s!= null)
        	s = s.replace(' ',String.fromCharArray( new Integer[] { 160 }));

    	return s;
    }
}
