/**
* Description   - Fetching Contact Records 
* Created by    - Sagar Nirwal
* Created Date  - 20/09/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal -20/09/2022
*                  V_1.1 - Modified - Sagar Nirwal -20/09/2022 - Details what you modified
**/
public with sharing class FetchingContactRecords {
    @AuraEnabled(cacheable=true)
    /*
    * Description   :    Method Contact In Tile View
    * Created By    :    Sagar Nirwal
    * Argument      :    None
    * Return        :   List<Contact>
    */
    public static List<Contact> getContactInTileView() {
        return [SELECT Id,Name,Phone,Email FROM Contact LIMIT 15];
    }
}
