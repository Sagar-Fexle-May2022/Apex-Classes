/**
* Description   - District Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 028/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 28/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 28/08/2022 -  Details what you modified
**/
public with sharing class DistrictTriggerHandler {
    /**   Description :   Method finalizing Count Of District On States
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<State__c>,Map<Id, District__c>
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 28/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 28/08/2022 - Details what you modified
    **/
    public static void finalizingCountOfDistrictOnStates(List<District__c> newDistrictList, Map<Id, District__c> oldDistrictMap){
        
        Map<Id, State__c> mapOfStatesToUpdate = new Map<Id, State__c>();
        
        for(District__c dist : newDistrictList !=null ? newDistrictList : oldDistrictMap.values()){
            
            if(dist.State__c !=null){
                mapOfStatesToUpdate.put(dist.State__c, new State__c(Id = dist.State__c,Total_District__c = 0));
            }
            if(oldDistrictMap !=null && dist.State__c!= oldDistrictMap.get(dist.Id).State__c){
                mapOfStatesToUpdate.put(oldDistrictMap.get(dist.Id).State__c,
                                        new State__c(Id = oldDistrictMap.get(dist.Id).State__c,Total_District__c = 0));
            }
              
        }
        if(!mapOfStatesToUpdate.isEmpty()){
            for(AggregateResult result :[SELECT Count(Id)numOfDis, State__c 
                                        FROM District__c WHERE State__c in:mapOfStatesToUpdate.keySet() GROUP BY State__c]){
                mapOfStatesToUpdate.get((Id)result.get('State__c')).Total_District__c = (Decimal)result.get('numOfDis');   
            }
            update mapOfStatesToUpdate.values();
        }  
    }
}
