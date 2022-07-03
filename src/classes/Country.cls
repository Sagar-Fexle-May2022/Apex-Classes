/**
* Description   - Country Map  
* Created by    - Sagar Nirwal
* Created Date  - 30/06/2022
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
**/
public with sharing class Country {

    //Nested Map using Country with code to get the value countries,states,cites name 
    Static Map<String,Map<String, Map<String, List<String>>>> countryWithCodeMap = new Map<String,Map<String, Map<String, List<String>>>>();

    /**   Description :   Method(using 2 Nested Map) this method print all country 
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   String
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified 
    **/
    public static void mapCountry(String countrycode){
        
        //Nested Map using Country to get the states and city name
        Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();
        
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

        List<String> rajasthanCityList = new List<String>{'Jaipur','Udaipur','Jodhpur','Ajmer','Kota'};

        List<String> mpCityList = new List<String>{'Indore','Bhopal','Jabalpur','Gwalior','Katni'};

        List<String> upCityList = new List<String>{'Shamli','Lucknow','Agra','Kanpur','Merrut'};

        List<String> haryanaCityList = new List<String>{'Gurugram','Rohtak','Karnal','Sonipat','Hisar'};

        List<String> uttrakhandCityList = new List<String>{'Dehradun','Haridwar','Nainital','Rishikesh','Almora'};


        stateMap1.get('Rajasthan').addAll(rajasthanCityList);
        stateMap1.get('MP').addAll(mpCityList);
        stateMap1.get('Uttar Pradesh').addAll(upCityList);
        stateMap1.get('Haryana').addAll(haryanaCityList);
        stateMap1.get('UttraKhand').addAll(uttrakhandCityList);
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

        List<String> californiaCityList = new List<String>{'Los Angeles','San Diego','San Francisco','Oakland','Santa Monica'};

        List<String> texasCityList = new List<String>{'Houstan','Dallas','Austin','San Antonio','McAllen'};

        List<String> floridaCityList = new List<String>{'Miami','Orlando','Tampa','Destin','Naples'};

        List<String> alaskaCityList = new List<String>{'Anchorage','Juneau','Fairbank','Sitka','North Pole'};

        List<String> utahCityList = new List<String>{'Salt Lake City','West Valley City','Urovo','West Jordan','Sandy'};


        stateMap2.get('California').addAll(californiaCityList);
        stateMap2.get('Texas').addAll(texasCityList);
        stateMap2.get('Florida').addAll(floridaCityList);
        stateMap2.get('Alaska').addAll(alaskaCityList);
        stateMap2.get('Utah').addAll(utahCityList);
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

        List<String> bavariaCityList = new List<String>{'Munich','Regensburg','Augsburg','Nuremberg','Erlangen'};

        List<String> saxonyCityList = new List<String>{'Dresden','Leipzig','Hamburg','Bremen','Chemnitz'};

        List<String> hessenCityList = new List<String>{'Wiesbaden','Darmstadt','Hanau','Kassel','Fulda'};

        List<String> badenCityList = new List<String>{'Karlsruhe','Stuttgart','Mannheim','Heidelberg','Konstanz'};

        List<String> thuringiaCityList = new List<String>{'Erfurt','Weimar','Jena','Gera','Eisenach'};


        stateMap3.get('Bavaria').addAll(bavariaCityList);
        stateMap3.get('Saxony').addAll(saxonyCityList);
        stateMap3.get('Hessen').addAll(hessenCityList);
        stateMap3.get('Baden-Wurttemderg').addAll(badenCityList);
        stateMap3.get('Thuringia').addAll(thuringiaCityList);
        countrydummyMap.get('Germany').putAll(stateMap3);
        
        countryMap.putAll(countrydummyMap);
        countryWithCodeMap.get('+49').putAll(countrydummyMap);
        //System.debug(countryWithCodeMap.get('+49'));
        countrydummyMap.clear();         
        
        System.debug(countryWithCodeMap.get(countrycode));
    }
}