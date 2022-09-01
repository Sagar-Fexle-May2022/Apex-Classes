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
        
        Map<Id, State__c> mapOfStatusToUpdate = new Map<Id, State__c>();
        
        for(District__c dist : newDistrictList !=null ? newDistrictList : oldDistrictMap.values()){
            
            if(dist.State__c !=null){
                mapOfStatusToUpdate.put(dist.State__c, new State__c(Id = dist.State__c,Total_District__c = 0));
            }
            if(oldDistrictMap !=null && dist.State__c!= oldDistrictMap.get(dist.Id).State__c){
                mapOfStatusToUpdate.put(oldDistrictMap.get(dist.Id).State__c,
                                        new State__c(Id = oldDistrictMap.get(dist.Id).State__c,Total_District__c = 0));
            }
              
        }
        if(!mapOfStatusToUpdate.isEmpty()){
            for(AggregateResult result :[SELECT Count(Id)numOfDis, State__c 
                                        FROM District__c WHERE State__c in:mapOfStatusToUpdate.keySet() GROUP BY State__c]){
                mapOfStatusToUpdate.get((Id)result.get('State__c')).Total_District__c = (Decimal)result.get('numOfDis');   
            }
        }
        
        Map<Id, State__c> mapOfState = new Map<Id, State__c>([SELECT Id, Name, Total_District__c, (SELECT Id, Name FROM Districts__r) 
                                                                FROM State__c WHERE Id IN : mapOfStatusToUpdate.keySet()]);
        for(State__c st : mapOfState.values()){
            if(mapOfStatusToUpdate.containskey(st.Id)){
                State wrapState = new State(); 
                wrapState.stateName = st.Name;
                wrapState.districts = new List<Districts>();
                wrapState.Total_Number_Of_Districts = mapOfStatusToUpdate.get(st.Id).Total_District__c;      
                for(District__c dt : mapOfState.get(st.Id).Districts__r){
                    Districts wrapDistrict = new Districts();
                    wrapDistrict.districtName = dt.Name;
                    wrapState.districts.add(wrapDistrict);
                }
                String jString = JSON.serialize(wrapState);
                State__c state = new State__c();
                state.Id = st.Id;
                state.State_JSON_Data__c = jString;
                state.Total_District__c = mapOfStatusToUpdate.get(st.Id).Total_District__c;
                
                mapOfStatusToUpdate.put(state.Id, state);
            } 
        }
        if(!mapOfStatusToUpdate.isEmpty()){
            Update mapOfStatusToUpdate.values();
        }  
    }
    
    public List<State> states{get; set;}
    public class State{
        Public string stateName{get; set;}
        Public List<Districts> districts{get; set;}
        public Decimal Total_Number_Of_Districts{get; set;}
    }
    public class Districts{
        Public String districtName{get; set;}
    }
}