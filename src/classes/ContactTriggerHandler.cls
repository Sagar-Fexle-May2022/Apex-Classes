/**
* Description   - State Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 028/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 28/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 28/08/2022 -  Details what you modified
**/
public with sharing class StateTriggerHandler {
    /**   Description :   Method State JSON data
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List,Map
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 28/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 28/08/2022 - Details what you modified
    **/
    public static void stateJsonData(List<State__c> newStateList ,Map<Id,State__c> oldStateMap){
        Set<Id> stateIds = new Set<Id>();
        for(State__c state: newStateList){
            if(state.Total_District__c != oldStateMap.get(state.Id).Total_District__c){
                stateIds.add(state.Id);
            }
        }
        if(!stateIds.isEmpty()){
            Map<Id, State__c> mapOfState = new Map<Id, State__c>([SELECT Id, Name, Total_District__c, (SELECT Id, Name FROM Districts__r) 
                                                                FROM State__c]);
            State__c state = new State__c();
            for(State__c st: newStateList){
                if(mapOfState.containsKey(st.Id)){ 
                    State wrapState = new State();
                    wrapState.stateName = st.Name;
                    wrapState.totalDistrict = st.Total_District__c;
                    wrapState.districts = new List<Districts>();
                    for(District__c dis: mapOfState.get(st.Id).Districts__r){
                        Districts wrapDistrict = new Districts();
                        wrapDistrict.districtName = dis.Name;
                        wrapState.districts.add(wrapDistrict);
                    }
                    String jString = JSON.serialize(wrapState);
                    state.Id = st.Id;
                    state.State_JSON_Data__c = jString;
                }
            }
            update state;
        }
    }
    /**   Description :   Method count States On Country
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List,Map
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 28/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 28/08/2022 - Details what you modified
    **/
    public static void countStatesOnCountry(List<State__c> newStateList ,Map<Id,State__c> oldStateMap) {
        
        
        Map<Id,Country__c> mapOfCountryUpdate = new Map<Id,Country__c>();

        for(State__c std:newStateList !=null ? newStateList:oldStateMap.Values()){
            if(std.Country__c!=null){
                mapOfCountryUpdate.put(std.Country__c,new Country__c(Id=std.Country__c,Total_States__c=0,Total_District__c = 0));
            }

            if(oldStateMap !=null && std.Country__c != oldStateMap.get(std.Id).Country__c){
                mapOfCountryUpdate.put(oldStateMap.get(std.Id).Country__c,
                new Country__c(Id=oldStateMap.get(std.Id).Country__c,Total_States__c=0,Total_District__c = 0));
            }
        }

        if(!mapOfCountryUpdate.isEmpty()){
            for(AggregateResult agr:[SELECT Country__c , COUNT(Id)totalStates, SUM(Total_District__c)totalDistrict 
                                    FROM State__c WHERE Id
                                    IN:mapOfCountryUpdate.keySet() GROUP BY Country__c]){
                mapOfCountryUpdate.put(String.valueOf(agr.get('Country__c')),new Country__c(Id = (Id)agr.get('Country__c'),
                                        Total_States__c = (Decimal)agr.get('totalStates'),
                                        Total_District__c = (Decimal)agr.get('totalDistrict')));
            }
            update mapOfCountryUpdate.values();
        }
    }

    //Wrapper Classes
    public List<State> states{get; set;}
    public class State{
        Public string stateName{get; set;}
        Public List<Districts> districts{get; set;}
        public Decimal totalDistrict{get; set;}
    }
    public class Districts{
        Public String districtName{get; set;}
    } 
}
