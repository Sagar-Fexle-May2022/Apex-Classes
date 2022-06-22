/**
* Description   - Number Pattern(Using One loop)
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class NumberPatternUsingOneLoop {
    public static void insertNumberPatternUsingOneLoop() {
        integer i = 1,n=6,j=0,num = 1;
		
        // Loop to print desired pattern
        for ( i = n-1; i>= 1;)
        {
            // current line number
			if(j < (n-i)){
				system.debug(num++ + ' ');
				j++;
				continue;
			}
     
            // Else time to print a new line
            if (j == (n-i))
            {
                system.debug('');
                i--;
				j = 0 ;
            }
        }
    }
}