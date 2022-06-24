/**
* Description   - Left Traingle Pascal Pattern(Using Two loop)
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
    /**   Description :   Left Triangle Pascal Using two Loop
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Two integers to diaplay number of rows and spaces
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public LeftTrianglePascal(integer n) {
        integer a = n+1;
        for(integer i=1;i<=(2*n-1);i++)
        {
            if(i<=n)
            {
                a--;
            }else
            {
                a++;
            }
            string s = ' ';
            string b = '  ';
            for(integer j=1;j<=n;j++)
            {
                if(j>=a)
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
