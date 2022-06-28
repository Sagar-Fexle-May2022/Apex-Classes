/**
* Description   - Overriding
*
* Created by    - Sagar Nirwal
*
* Created Date  - 25/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public virtual class Overriding {
    /**
    * Description   - Parent Inner Class
    *
    * Created by    - Sagar Nirwal
    *
    * Created Date  - 25/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    *
    **/
    public virtual class Parent{
        private integer pvt_mem;
        protected integer ptd_mem;
        public integer pub_mem;
        /**   Description :   Parent inner class
        *
        *     Created By  :   Sagar Nirwal
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
        * 
        **/
        public virtual void getvalues (){
            system.debug ('Pvt Mem' +pvt_mem);
            system.debug('ptd Mem' +ptd_mem);
            system.debug ('pub mem'+ pub_mem);
        }
    }
    /**
    * Description   - Child inner class
    *
    * Created by    - Sagar Nirwal
    *
    * Created Date  - 25/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    *
    **/
    public virtual class Child extends Parent {
        private integer pvt_ch_mem;
        /**   Description :   Child inner class
        *
        *     Created By  :   Sagar Nirwal
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
        * 
        **/
        public override void getvalues() {
            system.debug ('Pvt ch Mem' + pvt_ch_mem);
        }
    }
    /**
    * Description   - Test inner class
    *
    * Created by    - Sagar Nirwal
    *
    * Created Date  - 25/06/2022
    *
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    *
    **/
    public class Test {
        /**   Description :   Test inner class print the Overiding
        *
        *     Created By  :   Sagar Nirwal
        *
        *     Arguments   :   None
        *
        *     Return      :   none
        *
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
        * 
        **/
        public void main() {
            Parent p1= new Parent ();
            p1.getvalues ();
            Child c1= new Child();    
            c1.getvalues ();
        }
    }
}