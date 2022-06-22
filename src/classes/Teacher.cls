public class Teacher {
    public Teacher(){
        //Teacher Layout
        Student__c student = new Student__c();
        
        //Inster Record
        
        student.Date_Time__c = System.now();
        
        //Student Info
        //student.RecordTypeId = '';
	student.Email__c = 'Shivam@gmail.com';
	student.Address__c = '247, Ramnagariya, Jagatpura, Jaipur';
	student.Name = 'Shivam Raj';
        //student.Mobile_Number__c = '8239141950';
	student.Father_Name__c = 'Ravindar Raj';
        student.Father_Mobile_Number__c = '9457774005';
	//student.Roll_Number__c = 234567;
	student.Overall_Grade__c = 79.98;
	student.Student_Hobby__c = 'Cricket;Badminton;Anime';
        student.LinkedIn__c = 'https://www.linkedin.com/in/shivam-raj/';
        
        //Class Info
	student.Stream__c = 'BCA';
	student.Class__c = 'Digital Marketing';
	student.Section__c = 'A';
        
        //Fees Details
        student.Current_Year__c =date.parse('2/08/2022');
        student.Pending_Fees_Amount__c = 5000;
        student.Pending_Exam_Fess__c = 00;
        student.Fees_Submitted__c = False;
        student.Exam_Fees_Submitted__c =True;
            
        //Semester Details
        student.X1st_Sem_Percentage__c = 70.00;
        student.X2nd_Sem_Percentage__c = 72.90;
        student.X4th_Sem_Percentage__c = 81.98;
        student.X1st_Sem_Back__c = True;
        student.X3rd_Sem_Back__c = True;
        student.X4th_Sem_Back__c = False;
        student.Subject_in_Which_1st_Sem_Back__c = 'Chemistry';
        student.Subjects_in_which_3rd_Sem_Back__c = 'Machine Learning';
 	student.Subject_in_Which_4th_Sem_Back__c = '';
            
        insert student;
        system.debug('Inserted Record Data :' + student.id);
    }
}
