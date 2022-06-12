public class RegisterDebug {
	 public RegisterDebug(){
        List<Student__c> studentList = [select id,Date_Time__c, Name, Email__c, Address__c,/* Roll_Number__c,Mobile_Number__c,*/ Father_Name__c, 
                                        Overall_Grade__c, Father_Mobile_Number__c, Student_Hobby__c, LinkedIn__c, Stream__c, 
                                        Class__c, Section__c, Current_Year__c,Pending_Fees_Amount__c, Pending_Exam_Fess__c, 
                                        Fees_Submitted__c, Exam_Fees_Submitted__c, Is_Donation__c, Donation_Amount__c, Pending_Overall_Amount__c,
                                        Bank_Name__c, Bank_Phone_Number__c, IF__c, Account_Number__c, Mobile_No__c, State__c, City__c
                                        from Student__c order by createdDate DESC LIMIT 5];
		for(Student__c student : studentList){
			system.debug('Chck Student Data ::: ' + student);
		}
    }
}