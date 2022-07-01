/**
* Description   - Bank Transaction Outer Class 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public  class BankTransaction {
    /**
    * Description   - Amount Interface Inner Class 
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public Interface Amount
    {
        double deposit();
        double withdrawal();
    }
    //We have to implement the two methods declared in the interface for Bank
 
    /**
    * Description   - SBI Inner Class implements the Amount class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class SBI implements Amount
    {
        /**   Description :   Method Decalred in the SBI class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public double deposit()
        {
            //process the deposit
            double depositedAmount = 250;
            System.debug('SBI Deposite Amount :'+depositedAmount);
            return depositedAmount ;
        }
        /**   Description :   Method Decalred in the SBI class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public double withdrawal()
        {
            //process the withdrawal
            double withdrawalAmount = 350;
            System.debug('SBI Withdrawal Amount : '+withdrawalAmount);
            return withdrawalAmount ;
        }
    }
    /**
    * Description   - Axis Inner Class implements the Amount class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public virtual class Axis implements Amount
    {
        /**   Description :   Method Decalred in the Axis class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public virtual double deposit()
        {
            //process the deposit
            double depositedAmount = 450;
            System.debug('AxiS Deposite Amount :'+depositedAmount);
            return depositedAmount ;
        }
        /**   Description :   Method Decalred in the Axis class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public double withdrawal()
        {
            //process the withdrawal
            double withdrawalAmount = 1000;
            System.debug('Axis Withdrawal Amount : '+withdrawalAmount);
            return withdrawalAmount ;
        }
    }
    /**
    * Description   - HDFC Inner Class exends the Axis class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class HDFC extends Axis
    {
        /**   Description :   Method Decalred in the HDFC class same as Asix Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public override double deposit()
        {
            //process the deposit
            double depositedAmount = 750;
            System.debug('HDFC Deposite Amount :'+depositedAmount);
            return depositedAmount ;
        }
    }
    /**
    * Description   - Statement Inner Class 
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class Statement {
        /**   Description :   Constructor Decalred in the Statement class print all statement
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Statement(){
            Amount a1 = new SBI();
            a1.deposit();
            a1.withdrawal();

            Amount a2 = new Axis();
            a2.deposit();
            a2.withdrawal();

            Amount a3 = new HDFC();
            a3.deposit();
        }
    }
}