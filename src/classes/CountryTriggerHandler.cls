/**
* Description   - Country Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 02/09/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 02/09/2022
*                  V_1.1 - Modified - Sagar NIrwal - 02/09/2022 -  Details what you modified
**/
public with sharing class CountryTriggerHandler {
    /**   Description :   Method country JSON data
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List,Map
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 02/09/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 02/09/2022 - Details what you modified
    **/
    public static void countryJsonData(List<Country__c> newCountryList ,Map<Id,Country__c> oldCountryMap){
        if(!newCountryList.isEmpty()){   
            Set<Id> setOfCountryId = new Set<Id>();
            for(Country__c cou : newCountryList){
                if(oldCountryMap != null && (cou.Total_District__c != 
                    oldCountryMap.get(cou.id).Total_District__c || cou.Total_States__c 
                    != oldCountryMap.get(cou.id).Total_States__c )){   
                    setOfCountryId.add(cou.Id);               
                }
            }
            if(!setOfCountryId.isEmpty()){
                List<State__c> listOfState = [SELECT Id, country__r.Id,country__r.Name,country__r.Total_States__c,
                                                country__r.Total_District__c, Name
                                                FROM State__c WHERE country__r.Name IN : setOfCountryId];
                Map<Id,List<State__c>> mapOfStatewithCountryId = new Map<Id,List<State__c>>();
                for(State__c st : listOfState){
                    if(!mapOfStatewithCountryId.containsKey(st.Country__c)){
                        mapOfStatewithCountryId.get(st.Country__c).add(st);
                    }
                }

                if(!newCountryList.isEmpty()){
                    for(Country__c cou : newCountryList){
                        if(setOfCountryId.contains(cou.Id)) {  
                            Country wCountry = new Country();
                            wCountry.countryName = mapOfStatewithCountryId.get(cou.Id).Country__r.Name;
                            wCountry.countryCode = mapOfStatewithCountryId.get(cou.Id).Country__r.Country_Code__c;
                            wCountry.states = new List<states>();
                            wCountry.Total_Number_Of_Districts = (Integer)cou.Total_District__c;
                            wCountry.Total_Number_Of_States = (Integer)cou.Total_States__c;

                            for(State__c st : listOfState){ 
                                if(mapOfStatewithCountryId.containsKey(st.Id)){  
                                    if(st.Country__c == cou.Id){
                                        States wrapState = new States();
                                        wrapState.stateName = st.Name;
                                        wrapState.districts = new List<Districts>();
                                        wrapState.Total_Number_Of_Districts = (Integer)st.Total_District__c; 

                                        for(District__c dt : st.Districts__r){
                                            Districts wrapDistrict = new Districts();
                                            wrapDistrict.districtName = dt.Name;
                                            wrapState.districts.add(wrapDistrict);
                                        }
                                        wCountry.states.add(wrapState);   
                                    }
                                }
                            }
                            String jString = JSON.serialize(wCountry);
                            cou.Country_JASON__c = jString;
                        }
                    } 
                }
            }
        }     
    }
    public List<Country> countryList{get; set;}
    public class Country{
        public String countryName{get; set;}
        public String countryCode{get; set;}
        public Integer Total_Number_Of_States{get; set;}
        public Integer Total_Number_Of_Districts{get; set;}
        public List<States> states{get; set;}       
    }
    public class States{
        Public string stateName{get; set;}
        Public List<Districts> districts{get; set;}
        public Integer Total_Number_Of_Districts{get; set;}
    }
    public class Districts{
        Public String districtName{get; set;}
    }
}
