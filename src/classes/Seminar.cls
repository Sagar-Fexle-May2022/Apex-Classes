/**
* Description   - Seminar of 1st & 2nd year student
*
* Created by    - Sagar Nirwal
*
* Created Date  - 23/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Seminar {
    /**   Description :   Seminar of 1st & 2nd year student
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public Seminar() {

        // Define a Nested Map
        Map<String, Map<String, List<Student__c>>> seminarclassmap = new Map<String, Map<String, List<Student__c>>>();

        //1st year List of Student
        //get the id of 1st year record
        List<Year_Of_Class__c> firstyearofclass = [select id from Year_Of_Class__c where Name = '1st Year' ];
        
        //1st year Computer Science List
        List<Student__c>  firstyearlistcomputer = [select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c, Class__c 
                                                  from Student__c 
                                                  where Year_Of_Class__c IN : firstyearofclass
                                                  AND Stream__c = 'B.Tech' 
                                                  AND Class__c = 'Computer Science'];
        for(Student__c student : firstyearlistcomputer){
            system.debug(student);
        }
        Map<String, List<Student__c>> mapofstudentfirstyear = new Map<String, List<Student__c>>();
        mapofstudentfirstyear.put('Computer Science',firstyearlistcomputer);

        //1st year Digital MArketing List
        List<Student__c>  firstyearlistdigital =[select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c, Class__c 
                                                from Student__c 
                                                where Year_Of_Class__c IN : firstyearofclass
                                                AND Stream__c = 'BCA' 
                                                AND Class__c = 'Digital Marketing'];
        for(Student__c student : firstyearlistdigital){
            system.debug(student);
        }
        mapofstudentfirstyear.put('Digital Marketing',firstyearlistdigital);

        // get the id 2nd year record
        List<Year_Of_Class__c> secondyearofclass = [select id from Year_Of_Class__c where Name = '2nd Year' ];

        //2nd year List of Student
        //2nd year Electronic List
        List<Student__c>  secondyearlistelectronic =[select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c, Class__c 
                                                    from Student__c 
                                                    where Year_Of_Class__c IN : secondyearofclass
                                                    AND Stream__c = 'B.Tech' 
                                                    AND Class__c = 'Electronics'];
        for(Student__c student : secondyearlistelectronic){
            system.debug(student);      
        }

        Map<String, List<Student__c>> mapofstudentsecondyear = new Map<String, List<Student__c>>();
        mapofstudentsecondyear.put('Electronics',secondyearlistelectronic);

        //2nd year Computer Science List
        List<Student__c>  secondyearlistcomputer =[select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c, Class__c 
                                                    from Student__c 
                                                    where Year_Of_Class__c IN : secondyearofclass
                                                    AND Stream__c = 'B.Tech' 
                                                    AND Class__c = 'Computer Science'];
        for(Student__c student : secondyearlistcomputer){
            system.debug(student);      
        }

        mapofstudentsecondyear.put('Computer Science',secondyearlistcomputer);

        //put the 1st year student in nested map
        seminarclassmap.put('1st Year',mapofstudentfirstyear);

        //put the 2nd year student in nested map
        seminarclassmap.put('2nd Year',mapofstudentsecondyear); 
    }
}