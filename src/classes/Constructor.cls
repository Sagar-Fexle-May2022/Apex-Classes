/**
* Description   - Constructor with parameterized
*
* Created by    - Sagar Nirwal
*
* Created Date  - 27/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Constructor {
    private String countryName;
    private Integer countryPopulation;

    /**   Description :   Constructor with parameterized  
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   String and Integer
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public Constructor(String countryName, Integer countryPopulation){
        this.countryName = countryName;
        this.countryPopulation = countryPopulation;
    }
    /**   Description :   Method to print class Contructor variable
    *
    *     Created By  :   Sagar Nirwal
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public void printClassVariables(){
        System.debug('Country Name: ' + countryName);
        System.debug('Country Population: ' + countryPopulation);
        //Constructor c1 = new Constructor('Iceland',356991 );
        //c1.printClassVariables();
    }
}