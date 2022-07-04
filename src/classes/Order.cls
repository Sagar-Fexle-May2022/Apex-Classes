/**
* Description   - Order Outer Class 
* Created by    - Sagar Nirwal
* Created Date  - 28/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public class Order{
    /**
    * Description   - Purchase Order Interface Inner Class 
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public Interface PurchaseOrder {
        
        Double discount();
    }    
    /**
    * Description   - Customer Purchase Order Inner Class  implements the Purchase Order class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class CustomerPurchaseOrder implements PurchaseOrder {
        /**   Description :   Method Decalred in the Customer purchase order class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Double discount() {
            system.debug('Customer Purchase Order Discount ');
            return .05;  // Flat 5% discount
        }
    }
    /**
    * Description   - Employee Purchase Order Inner class implements the Purchase Order class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class EmployeePurchaseOrder implements PurchaseOrder {
        /**   Description :   Method Decalred in the Employee purchase order class same as Interface Class
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public Double discount() {
          system.debug('Employee Purchase Order Discount ');  
          return .10;  // It’s worth it being an employee! 10% discount
        } 
    }
    /**
    * Description   - Process Purchase Order Inner Class
    * Created by    - Sagar Nirwal
    * Created Date  - 28/06/2022
    * Revision log  -  V_1.0 - Created  - Youe name - Date
    *                  V_1.1 - Modified - Youe Name - Date - Details what you modified
    **/
    public class ProcessPurchaseOrder{
        /**   Description :   Constructor print the statement 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public processPurchaseOrder(){
            PurchaseOrder order1 = new CustomerPurchaseOrder();
            order1.discount();
            processOrder(order1);
    
            PurchaseOrder order2 = new EmployeePurchaseOrder();
            order2.discount();
            processOrder(order2);
        }
        /**   Description :   Method print the statement 
        *     Created By  :   Sagar Nirwal
        *     Arguments   :   PurchaseOrder
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Youe name - Date
        *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
        **/
        public void processOrder(PurchaseOrder order){
            system.debug('Check Discount :' +order.discount());
        }
        // that's the way to execute - 
        //Order.ProcessPurchaseOrder oc = new Order.ProcessPurchaseOrder();
    } 
}