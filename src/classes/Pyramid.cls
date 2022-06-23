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
        for(i = 1,k=0;i<=(2*n-1);i++)
        {
            if(i < n-k){
                system.debug(' ');
            }else
            {
                if(count)
                {
                    system.debug('*');
                }else
                {
                    system.debug(' ');
                    count = false;
                }
            }
            if( i== n+k){
                k++;
                system.debug(' ');
                if(i == (2*n-1))
                {
                    break;
                }
                i = 0;
                count = true;
            }
        }
    }
}