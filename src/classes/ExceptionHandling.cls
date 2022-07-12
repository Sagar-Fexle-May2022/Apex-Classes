/**
* Description   - ExceptionHandling
* Created by    - Sagar Nirwal
* Created Date  - 10/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
*                  V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Add One Class
**/
public virtual class ExceptionHandling {
    /**
    * Description   - Snippet
    * Created by    - Sagar Nirwal
    * Created Date  - 10/07/2022
    * Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
    *                  V_1.1 - Modified - Sagar Nirwal - 10/07/2022 - Snippet Exception Class get the Standard Exception
    **/
    public virtual class SnippetException extends Exception{
        /**   Description :   Snippet Method(Standard Exception)
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 10/07/2022
        *                     V_1.1 - Modified - Sagar Nirwal - 10/07/2022 - Standard Exception
        **/
        public  void snippet(){
            Account m1 = new Account(Name='Coffeemaker A',Description='Kitchenware');
            insert m1;
            Account m2 = new Account(Name='Coffeemaker B',Description='Kitchenware');
            insert m2;
            
            Account m3 = new Account();
            Account[] aList = new List<Account>();
            aList.add(m1);
            aList.add(m2);
            aList.add(m3);

            try {
                insert aList;
            } catch (DmlException de) {
                Integer numErrors = de.getNumDml();
                System.debug('getNumDml=' + numErrors);
                for(Integer i=0;i<numErrors;i++) {
                    System.debug('getDmlFieldNames=' + de.getDmlFieldNames(i));
                    System.debug('getDmlMessage=' + de.getDmlMessage(i));  
                }       
            }
            try{
                Account acc = new Account(Name='SFDC Account');
                insert acc;
                Contact con = new Contact(FirstName='David',LastName='Mallan',Phone='+12435467598',
                                        AccountId=accID);
    
                insert con;
                System.debug('Account '+acc);
                System.debug('Contact ' +con);
            } catch(DmlException e) {
                System.debug('An unexpected error has occurred: ' + e.getMessage());
            }
        }
    }
    /**
    * Description   - Stream
    * Created by    - Sagar Nirwal
    * Created Date  - 10/07/2022
    * Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
    *                  V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Method Changes to Custom Exception
    **/
    public virtual class StreamException extends Exception {
        /**   Description :   Stream Method (Custom Exception)
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 10/07/2022
        *                     V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Create a Custom Exception
        **/
        public void stream(){
            try {
                Integer i=0;
                // Your code here
                if (i < 5) throw new StreamException('This is bad');
            } catch (SnippetException e) {  
                // This catches the OtherException
                System.debug(e.getMessage());
            }

            //Rethrowing Exceptions and Inner Exceptions
            try { 
                
                throw new SnippetException('First exception'); 
            } catch (SnippetException e) { 
               
                throw new StreamException('Thrown with inner exception', e);
            }
        }
    }
    /**
    * Description   - Stream Utility
    * Created by    - Sagar Nirwal
    * Created Date  - 11/07/2022
    * Revision log  -  V_1.0 - Created  - Sagar Nirwal - 11/07/2022
    *                  V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Add Inner Class in the Exception Handling
    **/
    public class StreamUtility {
        /**   Description :   Main Processing 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 11/07/2022
        *                     V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Method to Custom exception 
        **/
        public void mainProcessing() {
            try {
                stream();
            } catch(StreamException me) {
                System.debug('Message: ' + me.getMessage());    
                System.debug('Cause: ' + me.getCause());    
                System.debug('Line number: ' + me.getLineNumber());    
                System.debug('Stack trace: ' + me.getStackTraceString());    
            }
        }
        /**   Description :   Stream Method
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 11/07/2022
        *                     V_1.1 - Modified - Sagar Nirwal - 11/07/2022 - Method to Check DML Exception 
        **/
        public  void stream() {
            try {
                System.debug('Computer Science');
            } catch(DmlException e) {
                throw new StreamException('That Stram could not be inserted.', e);
            }
        }
    }
}
