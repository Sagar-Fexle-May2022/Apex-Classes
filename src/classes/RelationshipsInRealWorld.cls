public class RelationshipsInRealWorld {
    public static void insertPanCard(){
       	// One to One Realtionship
        //PanCard Info
        Pan_Card__c pancard = new Pan_Card__c();
        
        pancard.Name = 'Sagar Nirwal';
        pancard.Pan_Card_Number__c = 'BOLPN5660P';
        pancard.Father_Name__c = 'Jitendra Nirwal';
        pancard.Date_Of_Birth__c = System.Date.newInstance(1999, 08, 02);
        
        insert pancard;
        system.debug('Inserted PanCard Data :' + pancard.id);
        
        // ContactInfo
        Contact contact = new Contact();
        
        contact.Pan_Card__c = pancard.Id;
        contact.FirstName = 'Sagar';
        contact.LastName = 'Nirwal';
        contact.MobilePhone = '8239145019';
        contact.Languages__c = 'Hindi;English';
        
        insert contact;
        system.debug('Inserted Contact Data :' + contact.id);
        
    }
    public static void insertCollegeInfo(){
        //One to Many
        //Strong Relationship
        //College Info
        College__c college = new College__c();
        
        college.Name = 'Suresh Gyan Vihar University';
        college.College_URL__c = 'https://www.gyanvihar.org/';
        
        insert college;
        system.debug('Inserted  College Info :' + college.id);
        
	//Teacher Info
	Teacher__c teacher = new Teacher__c();
        
        teacher.Name = 'Pankaj Dangre';
        teacher.College__c = college.Id;
        
        insert teacher;
        system.debug('Inserted Teacher Info :' + teacher.id);
        
        //Weak Realtionship
        //Year of Class Info
        Year_Of_Class__c yearofclass = new Year_Of_Class__c();
        
        yearofclass.Name = '2nd Year';
        
        insert yearofclass;
        system.debug('Inserted Year Of Class  :' + yearofclass.id);
        
        //Student Info
        
        Student__c student = new Student__c();
        
        student.Name = 'Sagar Nirwal';
        student.Year_Of_Class__c = yearofclass.Id;
        
        insert student;
        system.debug('Inserted Student Info  :' + student.id);
       
        //Many to Many Realtionship
        //Subject Info
        Subject__c subject = new Subject__c();
        
        subject.Name = 'Core Java';
        
        insert subject;
        system.debug('Inseted Subject Info :' + subject.id);
        
    	//StudentSubjects Info 
    	StudentSubjects__c stusubjects = new StudentSubjects__c();
        
        stusubjects.Name = 'COJAVA047';
        stusubjects.Student__c = student.Id;
        stusubjects.Subject__c = subject.Id;
        
        insert stusubjects;
        system.debug('Inseted StudentSubjects Info :' + stusubjects.id);
    }
    
    public static void insertHierarchical(){    
        //Self Relationship & Hierarchical
        //Employees Info
        
        Employee__c emp = new Employee__c();
		
		
        Employee__c employee = [SELECT Mentor__c,Trainer__c FROM Employee__c WHERE Name LIKE 'Sushil Choudhary' LIMIT 1];
        
        emp.Name = 'Sagar Nirwal';
        emp.Mentor__c = employee.Id ;
        emp.Trainer__c = employee.Mentor__c ;
        
        insert emp;
        system.debug('Inseted Employees Info :' + emp.id);
        
        //Account Info
        
        Account account = new Account();
        
        account.Name = 'GE India';
	Account accId = [SELECT Id,ParentId FROM Account WHERE Name Like 'General Electric New York US' LIMIT 1];
        account.ParentId = accId.ParentId;
        
        insert account;
        system.debug('Inseted Employees Info :' + account.id);
        
        //Leads Info
        
        Lead lead = new Lead();
        
        lead.FirstName = 'Sagar';
        lead.LastName = 'Nirwal';
        lead.Company = 'Fexle Services Private Limited';
        lead.LeadSource = 'Web';
        lead.Industry = 'Engineering';
        lead.AnnualRevenue = 400000;
        lead.Phone = '+918239145019';
        lead.Email = 'sagar.nirwal@fexle.com';
        lead.Status = 'Working - Contacted';
        lead.Rating = 'Warm';
        lead.Account__c =  accId.Id;
        
        insert lead;
        system.debug('Inseted Lead Info :' + lead.id);
        
        //One Contact Headquarter account
        Contact con = new Contact();
		
        Contact contact = [SELECT Id FROM Contact WHERE Name Like 'Sagar Nirwal' Limit 1];
        con.Id = contact.Id;
        con.AccountId = accId.Id;
        
        update con;
        system.debug('Update Contact :' + con.id);      
    }   
}
