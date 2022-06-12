public class TeacherDebug {
    public TeacherDebug(){
        List<Student__c> studentList = [select id,Date_Time__c, Name, Email__c, Address__c, /*Roll_Number__c,Mobile_Number__c,*/ Father_Name__c, 
                                        Overall_Grade__c, Father_Mobile_Number__c, Student_Hobby__c, LinkedIn__c, Stream__c, 
                                        Class__c, Section__c, Current_Year__c,Pending_Fees_Amount__c, Pending_Exam_Fess__c, 
                                        Fees_Submitted__c, Exam_Fees_Submitted__c, X1st_Sem_Percentage__c, X2nd_Sem_Percentage__c,
                                        X4th_Sem_Percentage__c, X1st_Sem_Back__c ,X3rd_Sem_Back__c, X4th_Sem_Back__c, 
                                        Subject_in_Which_1st_Sem_Back__c, Subjects_in_which_3rd_Sem_Back__c,Subject_in_Which_4th_Sem_Back__c 
                                        from Student__c order by createdDate DESC LIMIT 5];
		for(Student__c student : studentList){
			system.debug('Chck Student Data ::: ' + student);
		}
    }

}