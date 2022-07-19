/**
* Description   - Dynamic Map of Country   
* Created by    - Sagar Nirwal
* Created Date  - 14/06/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 14/06/2022
*                  V_1.1 - Modified - Sagar NIrwal - 14/06/2022 -  Details what you modified
**/
public with sharing class DynamicMapOfCountry {
    Static String JSONData;
    
    //Nested Map using Country with code to get the value countries,states,cites name 
    Static Map<String, Map<String, Map<String, List<String>>>> codeMap = 
                                                                    new Map<String, Map<String, Map<String, List<String>>>>();
    //Nested Map of Country using to get the states and District name
    Static Map<String, Map<String, List<String>>> countryMap =  new  Map<String, Map<String, List<String>>>();  
    Static Map<String ,List<String>> stateMap = new Map<String ,List<String>>();
    
    String startLetter; 
    Integer districtSize;


    /**   Description :   Constructor using Nested Map print all country 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String,String,Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/06/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/06/2022 - In Map Reduce the no of SOQL Qurey
                                                                        and Implement in a Single Qurey 
    **/
    public DynamicMapOfCountry(String countryCode,String letter,Integer size) {
        
        //this qurey working Parent(Country) to child(State) and child(District) to Parent(State) 
        List<State__c>  listofState = [SELECT Id,country__r.Country_Code__c,country__r.Name,Name,
                                            (SELECT state__r.Name,Name FROM Districts__r ) 
                                        FROM State__c 
                                        WHERE country__r.Country_Code__c = :countryCode];
        for(State__c state :listofState) {
            if(countryMap.size() == 0){
                codeMap.put(state.country__r.Country_Code__c,new Map<String, Map<String, List<String>>>());
                countryMap.put(state.country__r.Name,new Map<String, List<String>>());
            }
            stateMap.put(state.Name, new List<String>());
            for(District__c district : state.Districts__r){
                stateMap.get(district.state__r.Name).add(district.Name);
            }
        }
        countryMap.get(listofState[0].country__r.Name).putAll(stateMap);
        codeMap.get(listofState[0].country__r.Country_Code__c).putAll(countryMap);
        
        System.debug(codeMap.get(countryCode));
        
        combinationOfCountryStateDistrict(this.startLetter = letter ,this.districtSize = size);
        countryData();
    }

    /**   Description :   Method Using to find the Conbination or Size 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String,Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/06/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/06/2022 - Details what you modified 
    **/
    public static void combinationOfCountryStateDistrict(String startLetter,Integer districtSize){
		List<String> listOfCombinations = new List<String>();
        List<String> greaterDistrictFromInteger = new List<String>();
        for(String countryName : countryMap.keySet()){
            for(String stateName : countryMap.get(countryName).keySet()){
               	for(String districtName : countryMap.get(countryName).get(stateName) ){
                	if(countryName.startsWith(startLetter) && stateName.startswith(startLetter)
                       && districtName.startsWith(startLetter) ){
                        listOfCombinations.add(countryName+','+stateName+ ','+districtName);
                    }
                    if( districtName.length() >= districtSize){
                        greaterDistrictFromInteger.add(districtName);
                    }
             	}  	  
            }
        }
        if(!listOfCombinations.isEmpty()){
            System.debug('Combination of Country, State and District:'+listOfCombinations);
        }
        if(!greaterDistrictFromInteger.isEmpty()){
        	System.debug('District with Greater Interger : '+greaterDistrictFromInteger);
        }
    }
    //Wrapper Classes
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
    /**   Description :   Method Update the Field of Country by using Aggregate Qurey and JSON Data
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   none
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 14/06/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 14/06/2022 - Aggregate Qurey 
    **/
    public static void countryData(){
        Decimal totalState;// Variable for Storing Total State for Wrapper Class
        Decimal totalDistrict;// Variable for Storing Total District for Wrapper Class

        //Aggregate Qurey------> Total Sate AND District Of Country 
        List<Country__c> listOfCountryField = new List<Country__c>();
        for (AggregateResult totalStateAndDistrictOfCountry : [SELECT Country__c coun, COUNT(Name), SUM(Total_District__c)
                                                               FROM State__c 
                                                               GROUP BY Country__c]){                                    
            Country__c country = new Country__c();
            country.Id = (Id)totalStateAndDistrictOfCountry.get('coun');
            //Type Casting Use because Field is Number type
            country.Total_States__c = (Decimal)totalStateAndDistrictOfCountry.get('expr0');
            country.Total_District__c = (Decimal)totalStateAndDistrictOfCountry.get('expr1');
            totalState = (Decimal)totalStateAndDistrictOfCountry.get('expr0'); 
            totalDistrict = (Decimal)totalStateAndDistrictOfCountry.get('expr1');
            listOfCountryField.add(country);
        } 
        if(!listOfCountryField.isEmpty()){
            update listOfCountryField;
        }

        //Aggregate Qurey------> Total District Of State
        List<State__c> listOfTotalDistricts = new  List<State__c>();                                           
        for(AggregateResult aggregateTotalDistrict : [SELECT State__c state, COUNT(Name) 
                                                      FROM District__c 
                                                      GROUP BY State__c]){
            State__c state =  new State__c();
            state.Id = (Id)aggregatetotalDistrict.get('state');
            //Type Casting Use because Field is Number type
            state.Total_District__c = (Decimal)aggregatetotalDistrict.get('expr0');
            listOfTotalDistricts.add(state);
        }
        if(!listOfTotalDistricts.isEmpty()){
            update listOfTotalDistricts;
        }
        
        
        // JSON Data
        String nameOfCountry;
        for(String name : countryMap.keySet()){
            nameOfCountry = name;
        }
        String codeOfCountry;
        for(String code : codeMap.keySet()){
            codeOfCountry = code;
        }
        
        Country countryWrapper = new Country();
        countryWrapper.countryName = nameOfCountry;
        countryWrapper.countryCode = codeOfCountry;
        countryWrapper.totalStates = totalState;
        countryWrapper.totalDistricts =  totalDistrict;                                        
        countryWrapper.states = new List<State>();
        for(String sta : countryMap.get(nameOfCountry).keySet()) {
            State stateWrapper = new State();
            stateWrapper.stateName = sta;
            stateWrapper.districts = new List<District>();
       
            for(String district : countryMap.get(nameOfCountry).get(sta)) {
                District districtWrapper = new District();
                districtWrapper.districtName = district;
                stateWrapper.districts.add(districtWrapper);
            }
            countryWrapper.states.add(stateWrapper);
        }

        JSONData = System.JSON.serialize(countryWrapper);
        System.debug('===>>>'+JSONData);

        List<Country__c> listOfCountry = [SELECT Id,Name,Country_JASON__c 
                                          FROM Country__c Where Name IN :countryMap.keySet()];
        listOfCountry[0].Country_JASON__c = JSONData ;

        update listOfCountry;
    }
}