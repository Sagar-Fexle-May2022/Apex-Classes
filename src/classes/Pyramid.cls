/**
* Description   - Pyramid(Using One loop Only)
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Pyramid {
    /**   Description :   Pyramid Using One Loop
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
    public Pyramid(integer n) 
    {
        integer i,k;
        boolean count = true;
        string s = ' ';
        string b = '  ';
        string a = ' ';
        for(i = 1,k=0;i<=(2*n-1);i++)
        {
            if(i < n-k){                                    
                s = s + preserveWhitespace(b) ;
            }else
            {
                if(count)
                {
                    if(k==0 && i==n ) {
                        s = s + preserveWhitespace(b) + ' *';
                    } else {
                        s = s + ' *';
                    }
                }else
                {
                    s = s + preserveWhitespace(a);
                    count = false;
                }
            }
            if( i== n+k){
                k++;
                s = s + preserveWhitespace(a);
                if(i == (2*n-1))
                {
                    break;
                }
                i = 0;
                count = true;
                system.debug(s);
                s = preserveWhitespace(b);     
            }
        }
    }
    public static String preserveWhitespace(String s){
        if(s!= null)
            s = s.replace(' ',String.fromCharArray( new Integer[] { 160 }));

        return s;
    }
}
