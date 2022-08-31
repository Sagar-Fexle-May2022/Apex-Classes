/**
* Description   - Opportunity Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 01/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 01/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 01/08/2022 -  Details what you modified
**/
public with sharing class OpportunityTriggerHandler {
    // List of Automobile Sensor's to be inserted
    public static List<Automobile_Sensor__c> sensorListtoInsert = new List<Automobile_Sensor__c>();
    public static List<Automobile_Presence_Sensor__c> presenceSensorListtoInsert = 
        new List<Automobile_Presence_Sensor__c>();
    public static List<Automobile_TDU__c> tduListtoInsert = new List<Automobile_TDU__c>();
    public static List<Automobile_Tag__c> tagListtoInsert = new List<Automobile_Tag__c>();
    
    // List of Automobile Sensor's to be updated
    public static List<Automobile_Sensor__c> sensorListtoUpdate = new List<Automobile_Sensor__c>();
    public static List<Automobile_Presence_Sensor__c> presenceSensorListtoUpdate = 
        new List<Automobile_Presence_Sensor__c>();
    public static List<Automobile_TDU__c> tduListtoUpdate = new List<Automobile_TDU__c>();
    public static List<Automobile_Tag__c> tagListtoUpdate = new List<Automobile_Tag__c>();
    //List of sObjects for insertion and updation
    public static List<sObject> listsObjectsToInsert = new List<sObject>();
    public static List<sObject> listsObjectsToUpdate = new List<sObject>();
    //Sensor Name List
    public static List<String> sensorNameList = new List<String>();
    //Map of Opportunity with the Sensors
    public static Map<Id, Set<String>> mapOfOppwithSensors = new Map<Id, Set<String>>();
    //Map of Opportunity with Ids
    public static Map<Id, Opportunity> mapOfOppwithId = new Map<Id, Opportunity>();
    // Populating Automobile Sensor Records
    public static void automobileSensor(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap) {
        // Existing Automobile Sensors Set when insert
        Set<String> existingAutomobileSensorSet = new Set<String>();
        Set<String> existingAutomobilePresenceSensorSet = new Set<String>();
        Set<String> existingAutomobileTDUSensorSet = new Set<String>();
        Set<String> existingAutomobileTagSensorSet = new Set<String>();
        
        // Existing Automobile map used when update
        Map<Id, Automobile_Sensor__c> mapOfOppwithAutomobileSensor = new Map<Id, Automobile_Sensor__c>();
        Map<Id, Automobile_Presence_Sensor__c> mapOfOppwithAutomobilePresenceSensor = 
            new Map<Id, Automobile_Presence_Sensor__c>();
        Map<Id, Automobile_TDU__c> mapOfOppwithAutomobileTDUSensor = new Map<Id, Automobile_TDU__c>();
        Map<Id, Automobile_Tag__c> mapOfOppwithAutomobileTagSensor = new Map<Id, Automobile_Tag__c>(); 
        // Set of Sensor Set
        Set<String> sensorSet;
        for(Opportunity opp : newOppList){
            if(opp.StageName == 'Shipped to Customer' || opp.StageName == 'Return to HQ' || 
               opp.StageName == 'Return to Customer')    
            {
                if((opp.Automobile_Tag_Details_1__c != null || opp.Automobile_Tag_Details_2__c != null ||
                    opp.Automobile_Tag_Details_3__c != null || opp.Return_To_HQ__c != null) && 
                   (oldOppMap == null || ((opp.Id == oldOppMap.get(opp.Id).Id) && 
                                          (opp.Automobile_Tag_Details_1__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_1__c 
                                           || opp.Automobile_Tag_Details_2__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_2__c 
                                           || opp.Automobile_Tag_Details_3__c != oldOppMap.get(opp.Id).Automobile_Tag_Details_3__c 
                                           || opp.Return_To_HQ__c != oldOppMap.get(opp.Id).Return_To_HQ__c || 
                                           opp.StageName != oldOppMap.get(opp.Id).StageName)))) 
                {
                    sensorSet = new Set<String>();
                    if(opp.StageName == 'Shipped to Customer' || opp.StageName == 'Return to Customer') {
                        if(opp.Automobile_Tag_Details_1__c != null){
                            List<String> detail1 = new List<String>(opp.Automobile_Tag_Details_1__c.split('\r\n'));
                            sensorSet.addAll(detail1);
                            System.debug(detail1+' <-- detail1');
                            System.debug(sensorSet+' <-- sensorSet');
                        }
                        if(opp.Automobile_Tag_Details_2__c != null){
                            List<String> detail2 = new List<String>(opp.Automobile_Tag_Details_2__c.split('\r\n'));
                            sensorSet.addAll(detail2);
                            System.debug(detail2+' <-- detail2');
                            System.debug(sensorSet+' <-- sensorSet');
                        }
                        
                        if(opp.Automobile_Tag_Details_3__c != null) {
                            List<String> detail3 = new List<String>(opp.Automobile_Tag_Details_3__c.split('\r\n'));
                            sensorSet.addAll(detail3);
                            System.debug(detail3+' <-- detail3');
                            System.debug(sensorSet+' <-- sensorSet');
                        }
                    }
                    else if(opp.StageName == 'Return to HQ'){
                        if(opp.Return_To_HQ__c != null) {
                            List<String> detail4 = new List<String>(opp.Return_To_HQ__c.split('\r\n'));
                            sensorSet.addAll(detail4);
                            System.debug(detail4+' <-- detail4');
                            System.debug(sensorSet+' <-- sensorSet');
                        }
                    }
                    if(sensorSet.size()>0) {
                        sensorNameList.addAll(sensorSet);
                        mapOfOppwithSensors.put(opp.Id, sensorSet); 
                    }
                    MapOfOppwithId.put(opp.Id, opp);  
                }
            }
            else {
                opp.StageName.addError('Stage Name should be -->"Shipped to Customer","Return to HQ","Return to Customer"');
            }
        }
        System.debug(mapOfOppwithSensors+'mapOfOppwithSensors');
        System.debug(sensorNameList+'sensorList');        
        if(!mapOfOppwithSensors.isEmpty()) {
            List<Automobile_Sensor__c> existingSensorList = [SELECT Id, Name, Opportunity__c, Account__c From Automobile_Sensor__c
                                                             WHERE Opportunity__c In : mapOfOppwithSensors.keySet() 
                                                             AND Name In : sensorNameList];
            System.debug(existingSensorList);
            List<Automobile_Presence_Sensor__c> existingPresenceList = [SELECT Id, Name, Opportunity__c, Account__c From 
                                                                        Automobile_Presence_Sensor__c
                                                                        WHERE Opportunity__c In : mapOfOppwithSensors.keySet() AND 
                                                                        Name In : sensorNameList];
            System.debug(existingPresenceList);
            List<Automobile_TDU__c> existingTduList = [SELECT Id, Name, Opportunity__c, Account__c From Automobile_TDU__c
                                                       WHERE Opportunity__c In : mapOfOppwithSensors.keySet() 
                                                       AND Name In :  sensorNameList];
            System.debug(existingTduList);
            List<Automobile_Tag__c> existingTagList = [SELECT Id, Name, Opportunity__c, Account__c From Automobile_Tag__c
                                                       WHERE Opportunity__c In : mapOfOppwithSensors.keySet() 
                                                       AND Name In : sensorNameList];
            System.debug(existingTagList);
            for(Automobile_Sensor__c auto_Sensor : existingSensorList) {
                mapOfOppwithAutomobileSensor.put(auto_Sensor.Opportunity__c, auto_Sensor);
                existingAutomobileSensorSet.add(auto_Sensor.Name);
            }
            for(Automobile_Presence_Sensor__c auto_Sensor : existingPresenceList) {
                mapOfOppwithAutomobilePresenceSensor.put(auto_Sensor.Opportunity__c, auto_Sensor);
                existingAutomobilePresenceSensorSet.add(auto_Sensor.Name);
            }
            for(Automobile_TDU__c auto_Sensor : existingTduList) {
                mapOfOppwithAutomobileTDUSensor.put(auto_Sensor.Opportunity__c, auto_Sensor);
                existingAutomobileTDUSensorSet.add(auto_Sensor.Name);
            }
            for(Automobile_Tag__c auto_Sensor : existingTagList) {
                mapOfOppwithAutomobileTagSensor.put(auto_Sensor.Opportunity__c, auto_Sensor);
                existingAutomobileTagSensorSet.add(auto_Sensor.Name);
            }
            // Creating the Opportunity and Related Automobile Records
            for(Opportunity newOpp : MapOfOppwithId.values())
            {
                if((oldOppMap == null) || ((newOpp.Id == oldOppMap.get(newOpp.Id).Id) && (
                    newOpp.Automobile_Tag_Details_1__c != oldOppMap.get(newOpp.Id).Automobile_Tag_Details_1__c || 
                    newOpp.Automobile_Tag_Details_2__c != oldOppMap.get(newOpp.Id).Automobile_Tag_Details_2__c || 
                    newOpp.Automobile_Tag_Details_3__c != oldOppMap.get(newOpp.Id).Automobile_Tag_Details_3__c )))
                {
                    Set<String> setName = mapOfOppwithSensors.get(newOpp.Id);
                    System.debug(setName+'<---Setname');
                    for(String str :  setName) {
                        String name = (str.length()>18) ? str.substring(0, 18) : str;
                        if(name.startsWith('00:11:CE:00')){
                            if(!existingAutomobileSensorSet.contains(name)){
                                Automobile_Sensor__c sensor = new Automobile_Sensor__c();
                                sensor.Name = name;
                                sensor.Opportunity__c = newOpp.Id;
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' )
                                    sensor.Account__c = newOpp.AccountId;
                                else 
                                    sensor.Account__c = newOpp.Shipment_Account__c;
                                sensorListtoInsert.add(sensor);
                            }
                            else {
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' ) {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Installation Account - '+name);
                                }
                                else {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Shipment Account - '+name);
                                }     
                            }
                        }
                        else if(name.startsWith('00:11:CE:D')) {
                            if(!existingAutomobilePresenceSensorSet.contains(name)){
                                Automobile_Presence_Sensor__c presence_sensor = new Automobile_Presence_Sensor__c();
                                presence_sensor.Name = name;
                                presence_sensor.Opportunity__c = newOpp.Id;
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' )
                                    presence_sensor.Account__c = newOpp.AccountId;
                                else 
                                    presence_sensor.Account__c = newOpp.Shipment_Account__c;
                                presenceSensorListtoInsert.add(presence_sensor);
                            }
                            else {
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' ) {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Installation Account - '+name);
                                }
                                else {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Shipment Account - '+name);
                                }     
                            }
                        }  
                        else if(name.startsWith('00:11:CE:E')){
                            if(!existingAutomobileTDUSensorSet.contains(name)){
                                Automobile_TDU__c tdu = new Automobile_TDU__c();
                                tdu.Name = name;
                                tdu.Opportunity__c = newOpp.Id;
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' )
                                    tdu.Account__c = newOpp.AccountId;
                                else 
                                    tdu.Account__c = newOpp.Shipment_Account__c;
                                tduListtoInsert.add(tdu);
                            }
                            
                            else {
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' ) {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Installation Account - '+name);
                                }
                                else {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Shipment Account - '+name);
                                }     
                            }
                        }
                        else if(name.substring(0,3).isNumeric()|| name.substring(3,4)=='-') {
                            if(!existingAutomobileTagSensorSet.contains(name)){
                                Automobile_Tag__c tag = new Automobile_Tag__c();
                                tag.Name = name;
                                tag.Opportunity__c = newOpp.Id;
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' )
                                    tag.Account__c = newOpp.AccountId;
                                else 
                                    tag.Account__c = newOpp.Shipment_Account__c;
                                tagListtoInsert.add(tag);
                            }
                            else {
                                if(newOpp.StageName == 'Shipped to Customer' || newOpp.StageName == 'Return to Customer' ) {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Installation Account - '+name);
                                }
                                else {
                                    newOpp.addError('Duplicate Automobile Sensor found Under Shipment Account - '+name);
                                }     
                            }
                        }
                    }
                }
                // Update Automobile Records 
                if(oldOppMap != null && newOpp.Id == oldOppMap.get(newOpp.Id).Id && newOpp.StageName != oldOppMap.get(newOpp.Id).StageName) 
                {
                    //Format of My sensor && Opportunity Stage
                    if(newOpp.StageName == 'Return to HQ') {
                        if(mapOfOppwithAutomobileSensor.size() >0) {
                            for(Automobile_Sensor__c sensor : mapOfOppwithAutomobileSensor.values()) {
                                Automobile_Sensor__c AutomobileSensorForUpdate = new 
                                    Automobile_Sensor__c(Id = sensor.Id, Account__c = newOpp.Shipment_Account__c,
                                                         Opportunity__c = newOpp.Id);
                                sensorListtoUpdate.add(AutomobileSensorForUpdate);
                            }
                        }
                        if(mapOfOppwithAutomobilePresenceSensor.size() >0) {
                            for(Automobile_Presence_Sensor__c sensor : mapOfOppwithAutomobilePresenceSensor.values()) {
                                Automobile_Presence_Sensor__c AutomobilePresenceSensorForUpdate = new 
                                    Automobile_Presence_Sensor__c(Id = sensor.Id, Account__c = newOpp.Shipment_Account__c,
                                                                  Opportunity__c = newOpp.Id);
                                presenceSensorListtoUpdate.add(AutomobilePresenceSensorForUpdate);
                            }
                        }
                        if(mapOfOppwithAutomobileTDUSensor.size() >0) {
                            for(Automobile_TDU__c sensor : mapOfOppwithAutomobileTDUSensor.values()) {
                                Automobile_TDU__c AutomobileTDUSensorForUpdate = new 
                                    Automobile_TDU__c(Id = sensor.Id, Account__c = newOpp.Shipment_Account__c,
                                                      Opportunity__c = newOpp.Id);
                                tduListtoUpdate.add(AutomobileTDUSensorForUpdate);
                            }
                        }
                        if(mapOfOppwithAutomobileTagSensor.size() >0) {
                            for(Automobile_Tag__c sensor : mapOfOppwithAutomobileTagSensor.values()) {
                                Automobile_Tag__c AutomobileTagSensorForUpdate = new 
                                    Automobile_Tag__c(Id = sensor.Id, Account__c = newOpp.Shipment_Account__c,
                                                      Opportunity__c = newOpp.Id);
                                tagListtoUpdate.add(AutomobileTagSensorForUpdate);
                            }
                        }
                    }
                    else if(newOpp.StageName == 'Return to Customer') {
                        if(mapOfOppwithAutomobileSensor.size() >0) {
                            for(Automobile_Sensor__c sensor : mapOfOppwithAutomobileSensor.values()) {
                                if(sensor.Account__c == newOpp.Shipment_Account__c) {
                                    Automobile_Sensor__c AutomobileSensorForUpdate = new 
                                        Automobile_Sensor__c(Id = sensor.Id, Account__c = newOpp.AccountId,
                                                             Opportunity__c = newOpp.Id);
                                    sensorListtoUpdate.add(AutomobileSensorForUpdate);
                                }
                            }  
                        }
                        if(mapOfOppwithAutomobilePresenceSensor.size() >0) {
                            for(Automobile_Presence_Sensor__c sensor : mapOfOppwithAutomobilePresenceSensor.values()) {
                                Automobile_Presence_Sensor__c AutomobilePresenceSensorForUpdate = new 
                                    Automobile_Presence_Sensor__c(Id = sensor.Id, Account__c = newOpp.AccountId,
                                                                  Opportunity__c = newOpp.Id);
                                presenceSensorListtoUpdate.add(AutomobilePresenceSensorForUpdate);
                            }
                        }
                        if(mapOfOppwithAutomobileTDUSensor.size() >0) {
                            for(Automobile_TDU__c sensor : mapOfOppwithAutomobileTDUSensor.values()) {
                                Automobile_TDU__c AutomobileTDUSensorForUpdate = new 
                                    Automobile_TDU__c(Id = sensor.Id, Account__c = newOpp.AccountId,
                                                      Opportunity__c = newOpp.Id);
                            }
                        }
                        if(mapOfOppwithAutomobileTagSensor.size() >0) {
                            for(Automobile_Tag__c sensor : mapOfOppwithAutomobileTagSensor.values()) {
                                Automobile_Tag__c AutomobileTagSensorForUpdate = new 
                                    Automobile_Tag__c(Id = sensor.Id, Account__c = newOpp.AccountId,
                                                      Opportunity__c = newOpp.Id);
                                tagListtoUpdate.add(AutomobileTagSensorForUpdate);                            
                            }
                        }
                    }
                }
            }
            //Automonile Records Insertion
            if(!sensorListtoInsert.isEmpty()) {
                listsObjectsToInsert.addAll(sensorListtoInsert);
            }
            if(!presenceSensorListtoInsert.isEmpty()) {
                listsObjectsToInsert.addAll(presenceSensorListtoInsert);
            }
            if(!tduListtoInsert.isEmpty()) {
                listsObjectsToInsert.addAll(tduListtoInsert);
            }
            if(!tagListtoInsert.isEmpty() ) {
                listsObjectsToInsert.addAll(tagListtoInsert);
            }
            try {
                if(!listsObjectsToInsert.isEmpty()){
                    insert listsObjectsToInsert;
                }
            }catch(DmlException e) {
                System.debug(e.getMessage());
            }
            // Automible Records Updation
            if(!sensorListtoUpdate.isEmpty()) {
                listsObjectsToUpdate.addAll(sensorListtoUpdate);
            }
            if(!presenceSensorListtoUpdate.isEmpty()) {
                listsObjectsToUpdate.addAll(presenceSensorListtoUpdate);
            }
            if(!tduListtoUpdate.isEmpty()) {
                listsObjectsToUpdate.addAll(tduListtoUpdate);
            }
            if(!tagListtoUpdate.isEmpty()) {
                listsObjectsToUpdate.addAll(tagListtoUpdate);
            }
            try {
                if(!listsObjectsToUpdate.isEmpty()){
                    update listsObjectsToUpdate;
                }
            }catch(DmlException e) {
                System.debug(e.getMessage());
            }
        }
        for (Opportunity opp : newOppList) {
            if (opp.StageName == 'Shipped to Customer' || opp.StageName == 'Return To HQ' || opp.StageName ==  'Return To Customer') {
                sendMail(newOppList, sensorInsertMap, presenceSensorInsertMap, tDUInsertMap, tagInsertMap,
                sensorUpdateMap,presenceSensorUpdateMap, tDUUpdateMap, tagUpdateMap);
            }
        }
    }
    /**   Description :   Method to send mail to Opportunity owner
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<Opportunity>
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 01/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 01/08/2022 - Details what you modified
    **/
    public static void sendMail(List<Opportunity> newOppList, Map<String,Automobile_Sensor_c> sensorInsertMap, Map<String,Automobile_Presence_Sensorc> presenceSensorInsertMap,  Map<String,Automobile_TDUc> tDUInsertMap, Map<String,Automobile_Tag_c> tagInsertMap,
    Map<String,Automobile_Sensor_c> sensorUpdateMap, Map<String,Automobile_Presence_Sensorc> presenceSensorUpdateMap,  Map<String,Automobile_TDUc> tDUUpdateMap, Map<String,Automobile_Tag_c> tagUpdateMap){
        String automobileSensorPattern = '00:11:CE:00';
        String automobileSensorPresencePattern = '00:11:CE:D';
        String automobileTDUPattern = '00:11:CE:E';
        Set<Id> accId = new Set<Id>();
        for (Opportunity opp : newOppList) {
            accId.add(opp.AccountId);
            accId.add(opp.Shipment_Account__c);
        }
        Map<Id, Account> acc = new Map<Id, Account>([Select Id, Name From Account Where Id IN: accId]);
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
        for (Opportunity opp : newOppList) {
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(opp.OwnerId);//To fetch record owner mail
            mail.setToAddresses(sendTo);
            mail.setSubject(opp.Name + '' + date.today().format());
            String body = 'Sensor shipment process is completed. Please refer below mentioned details to get all the success and failure details.<br>';
            body += 'Successfull:<br>';
            body += '<table style="width:100%" border = "1px solid black" ><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
            for (String tags : newOppList) { 
                if (tags.length() > 18) {
                    tags = tags.substring(0, 18);
                }
                if(tags.startsWith(automobileSensorPattern) ){
                    if (automobileSensorInsertMap.keySet().contains(tags) ){
                        body += '<tr><td>Sensor</td><td>' + tags + '</td><td>Sensor inserted under installation account: ' + acc.get(opp.AccountId).Name + '</td></tr>';
                    }
                    if (automobileSensorUpdateMap.keySet().contains(tags)) {
                        System.debug('Entered the if condition');
                        if (automobileSensorUpdateMap.get(tags).Account_c == opp.Shipment_Account__c) {
                            System.debug('Entered the 2nd if condition');
                            for (String hq : newOppList) {
                                if (hq == tags) {
                                    body += '<tr><td>Sensor</td><td>' + hq + '</td><td>Sensor moved under shipment account: ' + acc.get(opp.Shipment_Account__c).Name + '</td></tr>';
                                }
                            }
                        }
                        else if(automobileSensorUpdateMap.get(tags).Account__c == opp.AccountId){
                            body += '<tr><td>Sensor</td><td>' + tags + '</td><td>Sensor is moved from shipment account ' + acc.get(opp.Shipment_Account__c).Name + ' to installation account ' + acc.get(opp.AccountId).Name + '.</td></tr>';
                        }
                    }
                }
                else if (tags.startsWith(automobileSensorPresencePattern) ){
                    if (presenceSensorInsertMap.keySet().contains(tags)) {
                        body += '<tr><td>Presence Sensor</td><td>' + tags + '</td><td>Presence Sensor inserted under installation account: ' + acc.get(opp.AccountId).Name + '</td></tr>';
                    }
                    if (automobilePresenceSensorUpdateMap.keySet().contains(tags)) {
                        if (automobilePresenceSensorUpdateMap.get(tags).Account_c == opp.Shipment_Account__c) {
                            for (String hq : newOppList) {
                                if (hq == tags) {
                                    body += '<tr><td>Presence Sensor</td><td>' + hq + '</td><td>Presence Sensor moved under shipment account: ' + acc.get(opp.Shipment_Account__c).Name + '</td></tr>';
                                }
                            }
                        }
                        else if(automobilePresenceSensorUpdateMap.get(tags).Account__c == opp.AccountId){
                            body += '<tr><td>Presence Sensor</td><td>' + tags + '</td><td>Presence Sensor is moved from shipment account ' + acc.get(opp.Shipment_Account__c).Name + ' to installation account ' + acc.get(opp.AccountId).Name + '.</td></tr>';
                        }
                    }
                    
                }
                else if (tags.startsWith(automobileTDUPattern)){
                    if (automobileTDUInsertMap.keySet().contains(tags)) {
                        body += '<tr><td>TDU</td><td>' + tags + '</td><td>TDU inserted under installation account: ' + acc.get(opp.AccountId).Name + '</td></tr>';
                    }
                    if (automobileTDUUpdateMap.keySet().contains(tags)) {
                        if (automobileTDUUpdateMap.get(tags).Account_c == opp.Shipment_Account__c) {
                            for (String hq : hqTag(newOppList)) {
                                if (hq == tags) {
                                    body += '<tr><td>TDU</td><td>' + hq + '</td><td>TDU moved under shipment account: ' + acc.get(opp.Shipment_Account__c).Name + '</td></tr>';
                                }
                            }
                        }
                        else if(automobileTDUUpdateMap.get(tags).Account__c == opp.AccountId){
                            body += '<tr><td>TDU</td><td>' + tags + '</td><td>TDU is moved from shipment account ' + acc.get(opp.Shipment_Account__c).Name + ' to installation account ' + acc.get(opp.AccountId).Name + '.</td></tr>';
                        }
                    }
                }
                else{
                    string sString = tags;
                    string[] splitted = sString.split('\\-');
                    if (splitted[0].isNumeric()  ) {
                        if (automobileTagInsertMap.keySet().contains(tags)) {
                            body += '<tr><td>Tag</td><td>' + tags + '</td><td>Tag inserted under installation account: ' + acc.get(opp.AccountId).Name + '</td></tr>';
                        }
                        if (automobileTagUpdateMap.keySet().contains(tags)) {
                            if (automobileTagUpdateMap.get(tags).Account_c == opp.Shipment_Account__c) {
                                for (String hq : hqTag(newOppList)) {
                                    if (hq == tags) {
                                        body += '<tr><td>Tag</td><td>' + hq + '</td><td>Tag moved under shipment account: ' + acc.get(opp.Shipment_Account__c).Name + '</td></tr>';
                                    }
                                }
                            }
                            else if(automobileTagUpdateMap.get(tags).Account__c == opp.AccountId){
                                body += '<tr><td>Tag</td><td>' + tags + '</td><td>Tag is moved from shipment account ' + acc.get(opp.Shipment_Account__c).Name + ' to installation account ' + acc.get(opp.AccountId).Name + '.</td></tr>';
                            }
                        }
                    }
                }
            }
            body += '</table>';
            body += '<br>Unsuccessfull:<br>';
            body += '<table style="width:100%" border = "1px solid black"><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
            for (String tags : newOppList) {
                string sString = tags;
                string[] splitted = sString.split('\\-');
                if (!tags.startsWith(automobileSensorPattern) && !tags.startsWith(automobileSensorPresencePattern) && !tags.startsWith(automobileTDUPattern) && !splitted[0].isNumeric()) {
                    body += '<tr><td>Sensor</td><td>' + tags + '</td><td>Invalid sensor</td></tr>';
                }
                else{
                    if (tags.startsWith(automobileSensorPattern)) {
                        if (!automobileSensorInsertMap.keySet().contains(tags) && !automobileSensorUpdateMap.keySet().contains(tags)) {
                            body += '<tr><td>Sensor</td><td>' + tags + '</td><td>Sensor cant inserted under installation account ' + acc.get(opp.AccountId).Name  + ' b/c it is already exists under the installation account.</td></tr>';
                        }
                    }
                    else if (tags.startsWith(automobileSensorPresencePattern)) {
                        if (!presenceSensorInsertMap.keySet().contains(tags) && !automobilePresenceSensorUpdateMap.keySet().contains(tags)) {
                            body += '<tr><td>Presence Sensor</td><td>' + tags + '</td><td>Presence Sensor cant inserted under installation account ' + acc.get(opp.AccountId).Name + ' b/c it is already exists under the installation account.</td></tr>';
                        }
                    }
                    else if (tags.startsWith(automobileTDUPattern)) {
                        if (!automobileTDUInsertMap.keySet().contains(tags) && !automobileTDUUpdateMap.keySet().contains(tags)) {
                            body += '<tr><td>TDU</td><td>' + tags + '</td><td>TDU cant inserted under installation account ' + acc.get(opp.AccountId).Name + ' b/c it is already exists under the installation account.</td></tr>';
                        }
                    }
                    else if (splitted[0].isNumeric()) {
                        if (!automobileTagInsertMap.keySet().contains(tags) && !automobileTagUpdateMap.keySet().contains(tags)) {
                            body += '<tr><td>Tag</td><td>' + tags + '</td><td>Tag cant inserted under installation account ' + acc.get(opp.AccountId).Name + ' b/c it is already exists under the installation account.</td></tr>';
                        }
                    }
                }
            }
            body += '</table>';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        if(!mails.isEmpty()){
			Messaging.sendEmail(mails);
		}
    }
} 
/*
00:11:CE:00:123
00:11:CE:D12
00:11:CE:E12
123-ABC-ABZ
*/
