/**
* Description   - Reversed Pyramid Pattern(Using One loop Only)
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class ReversedPyramidUsingOneLoop {
    public ReversedPyramidUsingOneLoop() {
        integer i = 1,j=0,n=5;
        // Loop to print desired pattern

        for ( i = 1; i <= n;)
        {
            // current line number
            if (j < i-1)
            {
                system.debug(' ');
                j++;
                continue;
            }
			if(j < (2*n-i)){
				system.debug('*');
				j++;
				continue;
			}
			
            // Else time to print a new line
            if (j == (2*n-i))
            {
                system.debug('');
                i++;
                j = 0;
            }
        }
    }
}