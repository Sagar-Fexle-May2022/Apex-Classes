/**
* Description   - Left side Pattern(Using One loop Only)
*
* Created by    - Sagar Nirwal
*
* Created Date  - 22/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class LeftSidePatternWithSingleLoop {
    public LeftSidePatternWithSingleLoop() {
        integer j = 0,count = 0;
        for(integer i = 5; i>=1;)
        {
            if(count<(i-1))
            {
                system.debug('_');
                count++ ;
                continue;
            }
            if(j<(5-i))
            {
                system.debug('*');
                j++ ;
                continue;
            }
            if(j==5)
            {
                system.debug('');
                i-- ;
                count = 0;
                j = 0;
            }
        }
    }
}