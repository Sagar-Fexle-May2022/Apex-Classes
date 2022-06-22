/**
* Description   - Right side Pattern(Using One loop Only)
*
* Created by    - Sagar Nirwal
*
* Created Date  - 21/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class RightSidePattern {
    public RightSidePattern() {
        string s = '  ';
        for(integer i = 1;i<=5;i++){
            s  = s + '*';
            system.debug(s);
        }
    }
}