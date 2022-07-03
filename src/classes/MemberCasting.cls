/**
* Description   - Member Casting(Parent) of Outer Class 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public virtual class MemberCasting {
    String name;
    long phone;
 
    /**   Description :   Method 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    void chat(){ 
        // Print message of Admin/Child class
        System.debug(name + ' : chatting in whatsapp group');
    }

    /**
    * Description   - Admin(Child) of Ineer Class extends Parent class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class Admin extends MemberCasting {
    
        /**   Description :   Method 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        void addUser(){
            // Print message of MemeberCasting/ Parent class
            System.debug(name + ' : adding a new user in whatsapp group');
        }
    }
    
    /**
    * Description   - Main of Ineer Class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class Main {
    
        /**   Description :   Constructor 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public  Main(){
    
            // Creating an object MemeberCasting
            MemberCasting mem = new Admin();
    
            // Upcasting access only general property of
            // superclass
    
            // Custom entry for Member class
            mem.name = 'Sneha';
            mem.phone = 9876543210l;
            // Calling function
            mem.chat();
    
            Admin ad = (Admin)mem;
    
            // Downcast to access specific property of subclass
            ad.addUser();
        }
    }
}