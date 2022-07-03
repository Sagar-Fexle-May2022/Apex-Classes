/**
* Description   - Instance of Class 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public virtual class InstanceOfClass { 
    
    /**
    * Description   - Inner Class Dog 
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public virtual class Dog extends InstanceOfClass { 
        /**   Description :   Method 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   InstanceofClass(Parent class)
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/ 
        public void instOf(InstanceOfClass a) {  
            if(a instanceof Dog){  
                Dog d = (Dog)a;//downcasting  
                system.debug('ok downcasting performed');  
            }else {
                system.debug('ok Upcasting performend');
            }
        }
        //this way execute the code - 
        //InstanceOfClass.Dog ass = new InstanceOfClass.Dog();
        //ass.instof(ass);
    }
}