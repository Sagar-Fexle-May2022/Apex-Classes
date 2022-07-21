/**
* Description   - Dynamic Map of Country   
* Created by    - Sagar Nirwal
* Created Date  - 14/06/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 14/07/2022
*                  V_1.1 - Modified - Sagar NIrwal - 14/07/2022 -  Details what you modified
**/
public with sharing class DynamicMapOfCountry {
    Static String JSONData;

    //Nested Map of Country using to get the states and District name
    Static Map<String, Map<String, List<String>>> countryMap =  new  Map<String, Map<String, List<String>>>();  
    Static Map<String ,List<String>> stateMap = new Map<String ,List<String>>();

    /**   Description :   Constructor using Nested Map print all country 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String,String,String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/07/2022 - In Map Reduce the no of SOQL Qurey
                                                                        and Implement in a Single Qurey 
    **/
    public DynamicMapOfCountry(String countryName,String startLetter) {
        
        //this qurey working Parent(Country) to child(State) and child(District) to Parent(State) 
        List<State__c>  listofState = [SELECT Id,country__r.Country_Code__c,country__r.Name,Name,
                                       (SELECT State__r.Country__r.Name, state__r.Name,Name FROM Districts__r ) 
                                       FROM State__c 
                                       WHERE country__r.Name = :countryName];
        List<String> listOfCombinations = new List<String>();
        if(!listofState.isEmpty()){
            for(State__c state :listofState) {
                if(countryMap.size() == 0){
                    countryMap.put(state.country__r.Name,new Map<String, List<String>>());
                }
                stateMap.put(state.Name, new List<String>());
                for(District__c district : state.Districts__r){
                    stateMap.get(district.state__r.Name).add(district.Name);
                    if(district.State__r.Country__r.Name.startsWith(startLetter) && district.State__r.Name.startsWith(startLetter) &&
                        district.Name.startsWith(startLetter)){                        
                        listOfCombinations.add(district.State__r.Country__r.Name+','+district.State__r.Name+ ','+district.Name);
                    }   
                }
            }
            countryMap.get(listofState[0].country__r.Name).putAll(stateMap);
        }
        System.debug(countryMap);

        if(!listOfCombinations.isEmpty()){
            System.debug('Combination of Country, State and District:'+listOfCombinations);
        }
        aggregateQurey();
        countryData(countryName);
    }

    /**   Description :   Method Update the Field of Country by using Aggregate Qurey  
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String,Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/07/2022 - Aggregate Qurey 
    **/
    public static void aggregateQurey(){

        //Aggregate Qurey------> Total District Of State   
        Map<Id, State__c> mapOfStateToBeUpdate = new Map<Id, State__c>();                                       
        for(AggregateResult aggre : [SELECT State__c, COUNT(Id)totalDistrict
                                                      FROM District__c 
                                                      GROUP BY State__c]){
            mapOfStateToBeUpdate.put(String.valueOf(aggre.get('State__c')),new State__c(Id = (Id)aggre.get('State__c'),
                Total_District__c = (Decimal)aggre.get('totalDistrict')));
        }
        if(!mapOfStateToBeUpdate.isEmpty()){
            update mapOfStateToBeUpdate.values();
        }
        //Aggregate Qurey------> Total Sate AND District Of Country
        Map<Id, Country__c> mapOfCountryToBeUpdate = new Map<Id, Country__c>();
        for (AggregateResult agg : [SELECT Country__c , COUNT(Id)totalStates, SUM(Total_District__c)totalDistrict
                                    FROM State__c 
                                    GROUP BY Country__c]){ 
            mapOfCountryToBeUpdate.put(String.valueOf(agg.get('Country__c')),new Country__c(Id = (Id)agg.get('Country__c'),
                Total_States__c = (Decimal)agg.get('totalStates'),
                Total_District__c = (Decimal)agg.get('totalDistrict')));
        }
        if(!mapOfCountryToBeUpdate.isEmpty()){
            update mapOfCountryToBeUpdate.values();   
        }
    }
    /**   Description :   JSON Data
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/07/2022 - JSON Data 
    **/    
    public static void countryData(String countryName){    
        // JSON Data
        List<State__c> stateList = [SELECT Id,country__r.Id,country__r.Country_Code__c,country__r.Name,country__r.Total_States__c,
                                                                country__r.Total_District__c, Name
                                                                FROM State__c WHERE country__r.Name = :countryName];
        if(!stateList.isEmpty()){
            Country countryWrapper = new Country();
            countryWrapper.countryName = stateList[0].country__r.Name;
            countryWrapper.countryCode = stateList[0].country__r.Country_Code__c;
            countryWrapper.totalStates = stateList[0].country__r.Total_States__c;
            countryWrapper.totalDistricts = stateList[0].country__r.Total_District__c;
            countryWrapper.states = new List<State>();
            for(State__c st : stateList){
               State stateWrapper = new State();
                stateWrapper.stateName = st.Name;
                stateWrapper.districts = new List<District>();
                if(countryMap.containsKey(countryName)&& countryMap.get(countryName).containsKey(st.name)){
                    for(String dist: countryMap.get(countryName).get(st.Name)){
                        District districtWrapper = new District();
                        districtWrapper.districtName = dist;
                        stateWrapper.districts.add(districtWrapper);
                    }
                }
                countryWrapper.states.add(stateWrapper);
            }
            JSONData = JSON.serialize(countryWrapper);
            System.debug('===>>>'+JSONData);   
        }
        if(!stateList.isEmpty()){
            Country__c  cou = new Country__c();
            cou.Id =  stateList[0].country__r.Id;
            cou.Country_JASON__c = JSONData;
            update cou;
            String recordLink = URL.getSalesforceBaseUrl().getHost()+'/'+cou.Id;
            System.debug(recordLink);
        }
    }
    /**   Description :   Pagerefernce method
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   none
    *     Return      :   pagerefernce 
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 21/07/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 21/07/2022 - Detail what you modified 
    **/    
    public pagereference redirectUser(){
        return new pagereference('/');
    }    
    //Wrapper Classes
    
    public class CountryData{
        public List<Country> country{get; set;}
    }
    public class Country {
        public String countryName{get; set;}
        public String countryCode{get; set;}
        public Decimal totalStates{get; set;}
        public Decimal totalDistricts{get; set;}
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
/*OutPut ===>>>
USER_DEBUG [47]|DEBUG|{USA={California=(Los Angeles, Oakland, San Diego, San Francisco), 
    Florida=(Naples, Miami, Destin, Orlando), Utah=(Salt Lake City, West Jordan, Urovo, West Valley City)}}
USER_DEBUG [50]|DEBUG|Combination of Country, State and District:(USA,Utah,Urovo)
USER_DEBUG [122]|DEBUG|{"country":{"countryName":"USA","countryCode":"+1","totalStates":3,"totalDistricts":12.0,
"states":[{"stateName":"California","districts":[{"districtName":"Los Angeles"},{"districtName":"San Diego"},
{"districtName":"Oakland"},{"districtName":"San Francisco"}]},{"stateName":"Utah","districts":[{"districtName":"Salt Lake City"},
{"districtName":"West Jordan"},{"districtName":"West Valley City"},{"districtName":"Urovo"}]},{"stateName":"Florida",
"districts":[{"districtName":"Naples"},{"districtName":"Orlando"},{"districtName":"Miami"},{"districtName":"Destin"}]}]}} 
USER_DEBUG [130]|DEBUG|fexleservicesprivatelimi-1d-dev-ed.my.salesforce.com/a0F5i000000jhFaEAI */
