public class Register {
    public Register(){
        //Register Layout
        Student__c student = new Student__c();
        
        //Inster Record
        
        student.Date_Time__c = System.now();
        
        //Student Info
        //student.RecordTypeId = '';
		student.Email__c = 'Tushar@gmail.com';
		student.Address__c = '247, Ramnagariya, Jagatpura, Jaipur';
		student.Name = 'Tushar Singh';
        //student.Mobile_Number__c = '8293411905';
		student.Father_Name__c = 'Rajeev Singh';
        student.Father_Mobile_Number__c = '9547407400';
		//student.Roll_Number__c = 245671;
		student.Overall_Grade__c = 71.08;
		student.Student_Hobby__c = 'Coding;Cricket;Badminton;Basketball;Music';
        student.LinkedIn__c = 'https://www.linkedin.com/in/tushar-singh/';
        
        //Class Info
		student.Stream__c = 'B.Tech';
		student.Class__c = 'Computer Science';
		student.Section__c = 'B';
        
        //Fees Details
        student.Current_Year__c =date.parse('2/08/2022');
        student.Pending_Fees_Amount__c = 500;
        student.Pending_Exam_Fess__c = 00;
        student.Fees_Submitted__c = False;
        student.Exam_Fees_Submitted__c =True;
        student.Is_Donation__c = True;
        student.Donation_Amount__c = 6000;
        student.Pending_Overall_Amount__c = 7000;
            
        //Bank Details
        student.Bank_Name__c ='State Bank Of India' ;
        student.Bank_Phone_Number__c = '1800 1234';
        student.IF__c = 'SBIN0006912';
        student.Account_Number__c = '9900224477325' ;
        student.Mobile_No__c = '8239145119' ;
        student.State__c = 'Rajasthan' ;
        student.City__c ='Jaipur' ;
        
        
        insert student;
        system.debug('Inserted Record Data :' + student.id);
    }

}