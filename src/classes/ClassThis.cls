/**
* Description   - Class This 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public with sharing class ClassThis {
    public integer rollno;  
    public String name;  
    public double fee;
    /**   Description :   Constructor 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   Integer, String, Double
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/  
    public ClassThis(integer rollno,String name,double fee){  
        this.rollno=rollno;  
        this.name=name;  
        this.fee=fee;  
    }
    /**   Description :   Method Print the Values 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/    
    public void main(){
        System.debug(rollno+' '+name+' '+fee);
    }  
}