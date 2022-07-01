/**
* Description   - Student (Call by value and call by refrence) 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public with sharing class Student {
    String name ;
    /**   Description :   Constructor
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public Student() {
        Student__c st = new Student__c();
        st.name = 'Sagar Nirwal';
        integer i = 10;
        dataRefernce(st);
        system.debug('Check Student Name : '+st.name);
        dataValue(i);
        system.debug('Check I : '+i);
    }

    /**   Description :   Method (call by refernce)
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public void dataRefernce(Student__c studentdata){
        for(integer  i = 0; i<10;i++){
            studentdata.name = studentdata.name + i;
        }
    }
    /**   Description :   Method (call by value)
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public void dataValue(integer i){

        i = 50;
        system.debug('Check I : '+i);
    }
}