/**
* Description   - Accessing Data(Convert the data) 
* Created by    - Sagar Nirwal
* Created Date  - 04/07/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public with sharing class AccessingData {
    List<Contact> contacts = new List<Contact>();
    List<Lead> leads = new List<Lead>();
    List<Account> accounts = new List<Account>();

    /**   Description :   Method Convert Type
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public void convertType(String phoneNumber) {
        List<List<SObject>> results = [FIND :phoneNumber 
                                        IN Phone FIELDS 
                                        RETURNING Contact(Id, Phone, FirstName, LastName), 
                                        Lead(Id, Phone, FirstName, LastName), 
                                        Account(Id, Phone, Name)];
        List<SObject> records = new List<SObject>();
        records.addAll(results[0]); //add Contact results to our results super-set
        records.addAll(results[1]); //add Lead results
        records.addAll(results[2]); //add Account results
 
        if (!records.isEmpty()) { 
            for (Integer i = 0; i < records.size(); i++) { 
                SObject record = records[i];
                if (record.getSObjectType() == Contact.sObjectType) { 
                    contacts.add((Contact) record);
                    System.debug(record);
                } else if (record.getSObjectType() == Lead.sObjectType){ 
                    leads.add((Lead) record);
                    System.debug(record);
                } else if (record.getSObjectType() == Account.sObjectType) { 
                    accounts.add((Account) record); 
                    System.debug(record);
                }
            }
        }
    }
}