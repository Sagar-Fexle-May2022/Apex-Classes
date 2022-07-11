/**
* Description   - ExceptionHandling
* Created by    - Sagar Nirwal
* Created Date  - 10/07/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
*                  V_1.1 - Modified - Your Name - Date - Modified
**/
public virtual class ExceptionHandling {
    /**   Description :   ExceptionHandling Constuctor
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   None
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 10/07/2022
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public ExceptionHandling(){}
    /**
    * Description   - Snippet
    * Created by    - Sagar Nirwal
    * Created Date  - 10/07/2022
    * Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
    *                  V_1.1 - Modified - Your Name - Date - Modified
    **/
    public virtual class Snippet extends ExceptionHandling{
        /**   Description :   Snippet Constructor
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 10/07/2022
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Snippet(){
            Account m1 = new Account(
            Name='Coffeemaker A',
            Description='Kitchenware');
            insert m1;
            Account m2 = new Account(
                Name='Coffeemaker B',
                Description='Kitchenware');
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
        }
    }
    /**
    * Description   - Stream
    * Created by    - Sagar Nirwal
    * Created Date  - 10/07/2022
    * Revision log  -  V_1.0 - Created  - Sagar Nirwal - 10/07/2022
    *                  V_1.1 - Modified - Your Name - Date - Modified
    **/
    public virtual class Stream extends ExceptionHandling {
        /**   Description :   Stream Constuctor
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   void
        *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 10/07/2022
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Stream(){
            try {
                Student__c m = [SELECT Name FROM Student__c LIMIT 1];
                
                Double inventory = m.X4th_Sem_Percentage__c;
            } catch(DmlException e) {
                System.debug('DmlException caught: ' + e.getMessage());    
            } catch(SObjectException e) {
                System.debug('SObjectException caught: ' + e.getMessage());    
            } catch(Exception e) {
                System.debug('Exception caught: ' + e.getMessage());    
            }
            try {
                List<Integer> listofInteger = new List<Integer>();
                listofInteger.add(15);
                
                Integer i1 = listofInteger[0]; 
                Integer i2 = listofInteger[1]; 
            } catch(ListException le) {
                System.debug('The following exception has occurred: ' + le.getMessage());
            }
            try {
                Integer i=0;
                if (i < 5){ 
                    System.debug('This is Good');
                }
            } catch (Exception e) {  
                System.debug(e.getMessage());
            } 
        }
    }
}
