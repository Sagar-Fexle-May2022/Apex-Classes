/**
* Description   - Holo Down Triangle Pattern 2(Using Two loop)
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
    /**   Description :   Down Pattern Holo Using two Loop
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   integers to diaplay number of rows 
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public DownPatternHolo(integer n) {
        for(integer i=1;i<=n;i++)
        {
            string s = ' ';
            string b = '  ';
            for(integer j=1;j<=(2*n);j++)
            {
                if(i==1||j==i||i+j==2*n)
                {
                    s = s + '*';
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
