public class RelationshipsInRealWorldDebug {
	public RelationshipsInRealWorldDebug(){
        //PanCardInfo
        List<Pan_Card__c> pancardList = [select id, Name, Pan_Card_Number__c, Father_Name__c, 
                                         Date_Of_Birth__c from Pan_Card__c order by createdDate DESC LIMIT 5];
		for(Pan_Card__c pancard : pancardList){
			system.debug('Check PanCard Data ::: ' + pancard);
		}
         
        //Cantact Info 
        List<Contact> contactList =  [select id, Pan_Card__c, FirstName, LastName, MobilePhone,Languages__c 
                                      from Contact order by createdDate DESC LIMIT 5];
		for(Contact contact : contactList){
			system.debug('Check  ContactInfo ::: ' + contact);
		}
		
        //CollegeInfo         
        List<College__c> collegeList =  [select id, Name, College_URL__c from College__c order by createdDate DESC LIMIT 5];
		for(College__c college : collegeList){
			system.debug('Check  CollegeInfo ::: ' + college);
		}
         
        //Teacher Info 
        List<Teacher__c> teacherList =  [select id, Name, College__c from Teacher__c order by createdDate DESC LIMIT 5];
		for(Teacher__c teacher : teacherList){
			system.debug('Check  TeacherInfo ::: ' + teacher);
		} 
        
        //YearOfClass Info 
        List<Year_Of_Class__c> yearofclassList =  [select id, Name from Year_Of_Class__c order by createdDate DESC LIMIT 5];
		for(Year_Of_Class__c yearofclass : yearofclassList){
			system.debug('Check  YearofClassInfo ::: ' + yearofclass);
		} 
        
        //Student Info 
        List<Student__c> studentList =  [select id, Name, Year_Of_Class__c from Student__c order by createdDate DESC LIMIT 5];
		for(Student__c student : studentList){
			system.debug('Check  StudentInfo ::: ' + student);
		}
         
 		//StudentSubjeccts Info
        List<StudentSubjects__c> stusubjectsList =  [select id, Name, Student__c, Subject__c  from StudentSubjects__c order by createdDate DESC LIMIT 5];
		for(StudentSubjects__c stusubjects : stusubjectsList){
			system.debug('Check  StudentSubjectsInfo ::: ' + stusubjects);
		}
        
        //Employee Info
        List<Employee__c> empList =  [select id, Name, Mentor__c, Trainer__c  from Employee__c order by createdDate DESC LIMIT 5];
		for(Employee__c emp : empList){
			system.debug('Check  EmployeeInfo ::: ' + emp);
		}
         
        //Account Info 
        List<Account> accountList =  [select id, Name, ParentId  from Account order by createdDate DESC LIMIT 5];
		for(Account account : accountList){
			system.debug('Check  AccountInfo ::: ' + account);
		}
        
        //Lead Info 
        List<Lead> leadList =  [select id, FirstName, LastName, Company, LeadSource, Industry, AnnualRevenue, Phone
                                      , Email, Status,Rating,Account__c   from Lead order by createdDate DESC LIMIT 5];
		for(Lead lead : leadList){
			system.debug('Check  AccountInfo ::: ' + lead);
		}
        
        //Contact Update 
        List<Contact> conList =  [select id, AccountId  from Contact order by createdDate DESC LIMIT 5];
		for(Contact con : conList){
			system.debug('Check  AccountInfo ::: ' + con);
		}
    }
}