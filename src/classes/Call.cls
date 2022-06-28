/**
* Description   - Class Call By Value and Call By Refrence
*
* Created by    - Sagar Nirwal
*
* Created Date  - 26/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public class Call {
    public Call(){
        Account a = new Account();
        a.Name = 'Shivasoft';
        a.Website = 'www.amazon.com';
        changeWebsite(a);
        system.debug('Website - '+ a.Website);
    }
    /**   Description :   
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   Account
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public void changeWebsite(Account b) {
        //Create New Object and try to replace old
        b = new Account();
        b.Website = 'www.salesforce.com';
    } 
}