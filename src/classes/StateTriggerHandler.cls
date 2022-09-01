/**
* Description   - State Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 028/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 28/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 28/08/2022 -  Details what you modified
**/
public with sharing class StateTriggerHandler {
    /**   Description :   Method count States On Country
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<State__c>,List<State__c>
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

        Map<Id, State__c> mapOfStateToBeUpdate = new Map<Id, State__c>();                                       
        for(AggregateResult agr : [SELECT State__c, COUNT(Id)totalDistrict
                                    FROM District__c GROUP BY State__c]){
            mapOfStateToBeUpdate.put(String.valueOf(agr.get('State__c')),new State__c(Id = (Id)agr.get('State__c'),
                Total_District__c = (Decimal)agr.get('totalDistrict')));
        }
        if(!mapOfStateToBeUpdate.isEmpty()){
            update mapOfStateToBeUpdate.values();
        }
        if(!mapOfCountryUpdate.isEmpty()){
            for(AggregateResult agr:[SELECT Country__c , COUNT(Id)totalStates, SUM(Total_District__c)totalDistrict 
                                    FROM State__c WHERE Id
                                    IN:mapOfCountryUpdate.keySet() GROUP BY Country__c]){
                mapOfCountryUpdate.put(String.valueOf(agr.get('Country__c')),new Country__c(Id = (Id)agr.get('Country__c'),
                                        Total_States__c = (Decimal)agr.get('totalStates'),
                                        Total_District__c = (Decimal)agr.get('totalDistrict')));
            }
        }
        if(!mapOfCountryUpdate.isEmpty()){
            update mapOfCountryUpdate.values();
        }

        List<State__c> stateList = [SELECT Id, country__r.Id,country__r.Name,country__r.Total_States__c,
                                    country__r.Total_District__c, Name
                                    FROM State__c WHERE country__r.Name IN : mapOfCountryUpdate.keySet()];
        if(!stateList.isEmpty()){
            Country countryWrapper = new Country();
            countryWrapper.countryName = stateList[0].country__r.Name;
            countryWrapper.TotalStates = stateList[0].country__r.Total_States__c;
            countryWrapper.TotalDistrict = stateList[0].country__r.Total_District__c;
            countryWrapper.states = new List<State>();
            for(State__c st : stateList){
               State stateWrapper = new State();
                stateWrapper.stateName = st.Name;
                stateWrapper.districts = new List<District>();
                if(mapOfCountryUpdate.containsKey(stateList[0].country__r.Name)&& mapOfCountryUpdate.get(stateList[0].country__r.Name).containsKey(st.name)){
                    for(String dist: mapOfCountryUpdate.get(stateList[0].country__r.Name).get(st.Name)){
                        District districtWrapper = new District();
                        districtWrapper.districtName = dist;
                        stateWrapper.districts.add(districtWrapper);
                    }
                }
                countryWrapper.states.add(stateWrapper);
            }
            String JSONData = JSON.serialize(countryWrapper);
            System.debug('===>>>'+JSONData);   
            Country__c  cou = new Country__c();
            cou.Id =  stateList[0].country__r.Id;
            cou.Country_JASON__c = JSONData;
            update cou;  
        } 
    }

    //Wrapper Classes
    
    public class CountryData{
        public List<Country> country{get; set;}
    }
    public class Country {
        public String countryName{get; set;}
        public Decimal TotalStates{get; set;}
        public Decimal TotalDistrict{get; set;}
        public List<State> states{get; set;}
    }
    public class State {
        public String stateName{get; set;}
        public List<District> districts{get; set;}
    }
    public class District {
        public String districtName{get; set;}
    } 
}