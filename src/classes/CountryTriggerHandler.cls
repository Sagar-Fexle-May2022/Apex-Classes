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
    public static void updateCountryJsonData(List<Country__c> newCountryList ,Map<Id,Country__c> oldCountryMap){

        Set<Id> setOfCountryId = new Set<Id>();
        for(Country__c cou : newCountryList){
            if(oldCountryMap != null && ((cou.Total_States__c !=oldCountryMap.get(cou.Id).Total_States__c )
               ||(cou.Total_District__c !=oldCountryMap.get(cou.Id).Total_District__c ))){   
                setOfCountryId.add(cou.Id); 
                System.debug(cou);              
            }
        }
        if(!setOfCountryId.isEmpty()){

            Map<Id,State__c> mapOfStatewithCountryId = new Map<Id,State__c>([SELECT Id, Country__c,country__r.Id,country__r.Name,
                                                                            country__r.Country_Code__c,country__r.Total_States__c,
                                                                            country__r.Total_District__c, Name,Total_District__c,
                                                                            (SELECT id, Name FROM Districts__r)
                                                                            FROM State__c 
                                                                            WHERE country__r.Id IN : setOfCountryId]);
            System.debug(mapOfStatewithCountryId.values());

            for(Country__c cou : newCountryList){
                if(setOfCountryId.contains(cou.Id)) {  
                    Country wCountry = new Country();
                    wCountry.countryName = cou.Name;
                    wCountry.countryCode = cou.Country_Code__c;
                    wCountry.states = new List<states>();
                    System.debug(cou.Total_District__c);
                    System.debug(cou.Total_States__c);
                    wCountry.Total_Number_Of_States = (Integer)cou.Total_States__c;
                    wCountry.Total_Number_Of_Districts = (Integer)cou.Total_District__c;

                    for(State__c st : mapOfStatewithCountryId.values()){    
                        States wrapState = new States();
                        wrapState.stateName = st.Name;
                        wrapState.districts = new List<Districts>();
                        for(District__c dt : st.Districts__r){
                            Districts wrapDistrict = new Districts();
                            wrapDistrict.districtName = dt.Name;
                            wrapState.districts.add(wrapDistrict);
                        }
                        wCountry.states.add(wrapState);
                    }
                    String jString = JSON.serialize(wCountry);
                    cou.Country_JASON__c = jString;
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
    }
    public class Districts{
        Public String districtName{get; set;}
    }
}
