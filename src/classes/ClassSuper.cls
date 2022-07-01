/**
* Description   - Class Super
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public virtual class ClassSuper {
    public String salutation;
    public String firstName;
    public String lastName;
    
    /**   Description :   Constructor 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public ClassSuper() {
    
        salutation = 'Mr.';
        firstName = 'John';
        lastName = 'Deep';
    }
    
    /**   Description :   Constructor 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String, String, String
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public ClassSuper(String mysalutation, String myfirstName, String mylastName) {
    
        salutation = mysalutation;
        firstName = myfirstName;
        lastName = mylastName;
    }

    /**   Description :   Method 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public virtual void printName() {
    
        System.debug('My name is ' + salutation + lastName);
    }
    
    /**   Description :   Metho 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   String
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public virtual String getFirstName() {
        return firstName;
    }
    /**
    * Description   - Class Child
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class Child extends ClassSuper {
        /**   Description :   Method 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public override void printName() {
            super.printName();
            System.debug('But you can call me ' + super.getFirstName());
        }
        /**   Description :   Constructor 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Child(){
            super('Mr','Roushan','Kumar');
        }
    }
}