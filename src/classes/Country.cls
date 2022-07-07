/**
* Description   - Country Map  
* Created by    - Sagar Nirwal
* Created Date  - 30/06/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 03/07/2022
*                  V_1.1 - Modified - Sagar NIrwal - 03/07/2022 - Method(getCountryWithLetter) 
**/
public with sharing class Country {

    //Nested Map using Country with code to get the value countries,states,cites name 
    static Map<String,Map<String, Map<String, List<String>>>> countryWithCodeMap = new Map<String,Map<String, Map<String, List<String>>>>();
    //Nested Map using Country to get the states and city name
    static Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();

    /**   Description :   Method(using 2 Nested Map) this method print all country 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void mapCountry(String countrycode){
        //we use nested dummy map to put all the countries into the countrywith code map
        Map<String, Map<String, List<String>>> countrydummyMap = new Map<String, Map<String, List<String>>>();


        countryWithCodeMap.put('+91',new Map<String, Map<String, List<String>>>());
        countryWithCodeMap.put('+1',new Map<String, Map<String, List<String>>>());
        countryWithCodeMap.put('+49',new Map<String, Map<String, List<String>>>());

        //India Country
        countrydummyMap.put('India', new  Map<String, List<String>>());

        Map<String, List<String>> stateMap1 = new Map<String, List<String>>();
        stateMap1.put('Rajasthan',new List<String>());
        stateMap1.put('MP',new List<String>());
        stateMap1.put('Uttar Pradesh',new List<String>());
        stateMap1.put('Haryana',new List<String>());
        stateMap1.put('UttraKhand',new List<String>());

        List<String> rajasthanDistrictList = new List<String>{'Jaipur','Udaipur','Jodhpur','Ajmer','Kota'};

        List<String> mpDistrictList = new List<String>{'Indore','Bhopal','Jabalpur','Gwalior','Katni'};

        List<String> upDistrictList = new List<String>{'Shamli','Lucknow','Agra','Kanpur','Merrut'};

        List<String> haryanaDistrictList = new List<String>{'Gurugram','Rohtak','Karnal','Sonipat','Hisar'};

        List<String> uttrakhandDistrictList = new List<String>{'Dehradun','Haridwar','Nainital','Rishikesh','Almora'};


        stateMap1.get('Rajasthan').addAll(rajasthanDistrictList);
        stateMap1.get('MP').addAll(mpDistrictList);
        stateMap1.get('Uttar Pradesh').addAll(upDistrictList);
        stateMap1.get('Haryana').addAll(haryanaDistrictList);
        stateMap1.get('UttraKhand').addAll(uttrakhandDistrictList);
        countrydummyMap.get('India').putAll(stateMap1);
        
        countryMap.putAll(countrydummyMap);
        countryWithCodeMap.get('+91').putAll(countryMap);
        //System.debug(countryWithCodeMap.get('+91'));
        countrydummyMap.clear();

        //USA Country
        countrydummyMap.put('USA',new  Map<String, List<String>>());
        
        Map<String, List<String>> stateMap2 = new Map<String, List<String>>();
        stateMap2.put('California',new List<String>());
        stateMap2.put('Texas',new List<String>());
        stateMap2.put('Florida',new List<String>());
        stateMap2.put('Alaska',new List<String>());
        stateMap2.put('Utah',new List<String>());

        List<String> californiaDistrictList = new List<String>{'Los Angeles','San Diego','San Francisco','Oakland','Santa Monica'};

        List<String> texasDistrictList = new List<String>{'Houstan','Dallas','Austin','San Antonio','McAllen'};

        List<String> floridaDistrictList = new List<String>{'Miami','Orlando','Tampa','Destin','Naples'};

        List<String> alaskaDistrictList = new List<String>{'Anchorage','Juneau','Fairbank','Sitka','North Pole'};

        List<String> utahDistrictList = new List<String>{'Salt Lake City','West Valley City','Urovo','West Jordan','Sandy'};


        stateMap2.get('California').addAll(californiaDistrictList);
        stateMap2.get('Texas').addAll(texasDistrictList);
        stateMap2.get('Florida').addAll(floridaDistrictList);
        stateMap2.get('Alaska').addAll(alaskaDistrictList);
        stateMap2.get('Utah').addAll(utahDistrictList);
        countrydummyMap.get('USA').putAll(stateMap2);
        
        countryMap.putAll(countrydummyMap);
        countryWithCodeMap.get('+1').putAll(countrydummyMap);
        //System.debug(countryWithCodeMap.get('+1'));
        countrydummyMap.clear();

        //Germany Country
        countrydummyMap.put('Germany',new  Map<String, List<String>>());
        
        Map<String, List<String>> stateMap3 = new Map<String, List<String>>();
        stateMap3.put('Bavaria',new List<String>());
        stateMap3.put('Saxony',new List<String>());
        stateMap3.put('Hessen',new List<String>());
        stateMap3.put('Baden-Wurttemderg',new List<String>());
        stateMap3.put('Thuringia',new List<String>());

        List<String> bavariaDistrictList = new List<String>{'Munich','Regensburg','Augsburg','Nuremberg','Erlangen'};

        List<String> saxonyDistrictList = new List<String>{'Dresden','Leipzig','Hamburg','Bremen','Chemnitz'};

        List<String> hessenDistrictList = new List<String>{'Wiesbaden','Darmstadt','Hanau','Kassel','Fulda'};

        List<String> badenDistrictList = new List<String>{'Karlsruhe','Stuttgart','Mannheim','Heidelberg','Konstanz'};

        List<String> thuringiaDistrictList = new List<String>{'Erfurt','Weimar','Jena','Gera','Eisenach'};


        stateMap3.get('Bavaria').addAll(bavariaDistrictList);
        stateMap3.get('Saxony').addAll(saxonyDistrictList);
        stateMap3.get('Hessen').addAll(hessenDistrictList);
        stateMap3.get('Baden-Wurttemderg').addAll(badenDistrictList);
        stateMap3.get('Thuringia').addAll(thuringiaDistrictList);
        countrydummyMap.get('Germany').putAll(stateMap3);
        
        countryMap.putAll(countrydummyMap);
        countryWithCodeMap.get('+49').putAll(countrydummyMap);
        //System.debug(countryWithCodeMap.get('+49'));
        countrydummyMap.clear();         
        
        System.debug(countryWithCodeMap.get(countrycode));
    }

    /**   Description :   Method Gettting the Country with letter and Greater District Form Integer
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String,Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void combinationCountryStateDistrict(String combinationLetter,Integer districtSize){
        
        for(String countryName : countryMap.keySet()){
            if(countryName.startsWith(combinationLetter)){
                for(String stateName : countryMap.get(countryName).keySet()){
                    if(stateName.startswith(combinationLetter)){
                        for(String districtName : countryMap.get(countryName).get(stateName) ){
                            if(districtName.startsWith(combinationLetter)){
                                System.debug('Combination - Country : '+countryName+', State : '+stateName+ ', District : '+districtName);
                            }
                        }
                    }
                }    
            }
        }
        System.debug('District with Greater Interger : '); 
        for(String countryName : countryMap.keySet()){
            for(String stateName : countryMap.get(countryName).keySet()){
               	for(String districtName : countryMap.get(countryName).get(stateName) ){
                    if( districtName.length() >= districtSize){
                        System.debug(districtName);
                    }
             	}  	  
            }
        }    
    }
}
