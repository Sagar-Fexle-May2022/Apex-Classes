/**
* Description   - Opportunity Trigger Handler
* Created by    - Sagar Nirwal
* Created Date  - 01/08/2022
* Revision log  -  V_1.0 - Created  - Sagar Nirwal - 01/08/2022
*                  V_1.1 - Modified - Sagar NIrwal - 01/08/2022 -  Details what you modified
**/
public with sharing class OpportunityTriggerHandler {
    /**   Description :   Method to create Child records if opportunity is created
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<Opportunity>,Map<Id, Opportunity>
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 01/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 01/08/2022 - Details what you modified
    **/
    public static void automobileSensor(List<Opportunity>  newOppList, Map<Id, Opportunity> oldMapOpp){
        List<SObject> listRecordsToInsert = new List<SObject>();
        Set<String> sensorofSet = new Set<String>();
        for(Opportunity opp : newOppList){
            if(oldMapOpp == null || opp.StageName != oldMapOpp.get(opp.Id).StageName){
                if(opp.StageName=='Shipped to Customer' || opp.StageName=='Return to Customer'){
                    if(opp.Automobile_Tag_Details_1__c != null){
                        sensorofSet.addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
                    }
                    if(opp.Automobile_Tag_Details_2__c != null){
                        sensorofSet.addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
                    }
                    if(opp.Automobile_Tag_Details_3__c != null){
                        sensorofSet.addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
                    }
                }else if(opp.StageName=='Return to HQ'){
                    if(opp.Return_To_HQ__c != null){
                        sensorofSet.addAll(opp.Return_To_HQ__c.split('\n'));
                    }
                }
                if(!sensorofSet.isEmpty()){
                    for(String name : sensorofSet){
                        name = name.trim();
                        if(name.length()>18){
                            name = name.substring(0,18).trim();
                        }
                        if(name.startsWith('00:11:CE:00')){
                            Automobile_Sensor__c autoSensor = new Automobile_Sensor__c();
                            autoSensor.Name = name;
                            autoSensor.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                    autoSensor.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoSensor.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoSensor);
                        } 
                        else if(name.startsWith('00:11:CE:D')){
                            Automobile_Presence_Sensor__c autopresSensor = new Automobile_Presence_Sensor__c();
                            autopresSensor.Name = name;    
                            autopresSensor.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autopresSensor.Account__c = opp.Shipment_Account__c;
                            }else{
                                autopresSensor.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autopresSensor);  
                        }
                        else if(name.startsWith('00:11:CE:E')){
                            Automobile_TDU__c autoTdu = new Automobile_TDU__c();
                            autoTdu.Name = name;   
                            autoTdu.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autoTdu.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoTdu.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoTdu);
                        }
                        else if(name.substring(0,3).isNumeric() || name.substring(3,4)=='-'){
                            Automobile_Tag__c autoTag = new Automobile_Tag__c();
                            autoTag.Name = name;
                            autoTag.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autoTag.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoTag.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoTag);    
                        }
                    }
                }
            }
        }
        if(!listRecordsToInsert.isEmpty()){
            insert listRecordsToInsert;
        }
        sendMailToOwner(newOppList);
    }
    /**   Description :  Method to create Child records if opportunity updated
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<Opportunity>,Map<Id, Opportunity>,Boolean
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 01/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 01/08/2022 - Details what you modified
    **/
    public static void automobileRecords(List<Opportunity>  newOppList, Map<Id, Opportunity> oldMapOpp){
        List<SObject> listRecordsToInsert = new List<SObject>();

        for(Opportunity opp : newOppList){
            Opportunity oldOpp = oldMapOpp.get(opp.Id);

            List<String> listOldAutomobile = new List<String>();
            if(oldOpp.Automobile_Tag_Details_1__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_1__c.split('\n'));
            }
            if(oldOpp.Automobile_Tag_Details_2__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_2__c.split('\n'));
            }
            if(oldOpp.Automobile_Tag_Details_3__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_3__c.split('\n'));  
            }
            if(opp.Return_To_HQ__c!=null){
                listOldAutomobile.addAll(opp.Return_To_HQ__c.split('\n'));
            }

            List<String> listNewAutomobile = new List<String>();
            if(opp.Automobile_Tag_Details_1__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
            }
            if(opp.Automobile_Tag_Details_2__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
            }
            if(opp.Automobile_Tag_Details_3__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
            }
            if(opp.Return_To_HQ__c!=null){
                listNewAutomobile.addAll(opp.Return_To_HQ__c.split('\n'));
            }
            if(listNewAutomobile!=listOldAutomobile){
                for(String name : listNewAutomobile){
                    if(!listOldAutomobile.contains(name)){
                        if(name.startsWith('00:11:CE:00')){
                            Automobile_Sensor__c autoSensor = new Automobile_Sensor__c();
                            autoSensor.Name = name;
                            autoSensor.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                    autoSensor.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoSensor.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoSensor);
                        } 
                        else if(name.startsWith('00:11:CE:D')){
                            Automobile_Presence_Sensor__c autopresSensor = new Automobile_Presence_Sensor__c();
                            autopresSensor.Name = name;    
                            autopresSensor.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autopresSensor.Account__c = opp.Shipment_Account__c;
                            }else{
                                autopresSensor.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autopresSensor);  
                        }
                        else if(name.startsWith('00:11:CE:E')){
                            Automobile_TDU__c autoTdu = new Automobile_TDU__c();
                            autoTdu.Name = name;   
                            autoTdu.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autoTdu.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoTdu.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoTdu);
                        }
                        else if(name.substring(0,3).isNumeric() || name.substring(3,4)=='-'){
                            Automobile_Tag__c autoTag = new Automobile_Tag__c();
                            autoTag.Name = name;
                            autoTag.Opportunity__c = opp.id;
                            if(opp.StageName =='Return To HQ'){
                                autoTag.Account__c = opp.Shipment_Account__c;
                            }else{
                                autoTag.Account__c = opp.AccountId;
                            }
                            listRecordsToInsert.add(autoTag);    
                        }
                    }
                }
            }
            if(!listRecordsToInsert.isEmpty()){
                update listRecordsToInsert;
            }
        }
        sendMailToOwner(newOppList);
    }
    //Method to delete Child records if opportunity updated
   /* public static void deleteAutomobileRecords(List<Opportunity>  newOppList, Map<Id, Opportunity> oldMapOpp){
        List<Sobject> listRecordsToDelete = new List<Sobject>();

        for(Opportunity opp : newOppList){
            Opportunity oldOpp = oldMapOpp.get(opp.Id);

            List<String> listOldAutomobile = new List<String>();
            if(oldOpp.Automobile_Tag_Details_1__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_1__c.split('\n'));
            }
            if(oldOpp.Automobile_Tag_Details_2__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_2__c.split('\n'));
            }
            if(oldOpp.Automobile_Tag_Details_3__c!=null){
                listOldAutomobile.addAll(oldOpp.Automobile_Tag_Details_3__c.split('\n'));  
            }
            if(oldOpp.Return_To_HQ__c!=null){
                listOldAutomobile.addAll(oldOpp.Return_To_HQ__c.split('\n'));
            }

            List<String> listNewAutomobile = new List<String>();
            if(opp.Automobile_Tag_Details_1__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
            }
            if(opp.Automobile_Tag_Details_2__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
            }
            if(opp.Automobile_Tag_Details_3__c!=null){
                listNewAutomobile.addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
            }
            if(opp.Return_To_HQ__c!=null){
                listNewAutomobile.addAll(opp.Return_To_HQ__c.split('\n'));
            }

            if(listNewAutomobile!=listOldAutomobile){
                for(String oldAutomobile : listOldAutomobile){
                    if(!listNewAutomobile.contains(oldAutomobile)){
                        for(Sobject sobjectFromMap : mapSobject.values()){
                            if(sobjectFromMap.get('Name')==oldAutomobile){
                                listRecordsToDelete.add(sobjectFromMap);
                            }
                        }
                    }
                }
            }
        }
        if(listRecordsToDelete!=null){
            delete listRecordsToDelete;
        }
    }*/
    /**   Description :   Method to send mail to Opportunity owner
    *     Created By  :   Sagar Nirwal
    *     Arguments   :   List<Opportunity>,Map<Id, Opportunity>,Boolean
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Sagar Nirwal - 01/08/2022
    *                     V_1.1 - Modified - Sagar Nirwal - 01/08/2022 - Details what you modified
    **/
    public static void sendMailToOwner(List<Opportunity> newOppList){

        List <Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Set<String> setofSussesfull = new Set<String>();
        Set<String> setofUnsussesfull = new Set<String>();
        for(Opportunity opp : newOppList ){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(opp.OwnerId);
            mail.setToAddresses(sendTo);
            mail.setSenderDisplayName('Sagar');
            mail.setSubject(opp.Name +' '+ opp.CreatedDate);
            String body ='Sensor shipment process is completed' ;
            body += 'Please refer below mentioned details to get all the success and failure details.'+'<br/>';
            body +=  'Sussesfull : ' + '<br/>';
            body +=  '<table border="1" cellspacing="0"><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
            if(opp.StageName == 'Shipped To Customer'||opp.StageName == 'Return To Customer' ||opp.StageName == 'Return To HQ') {
                if(opp.Automobile_Tag_Details_1__c != null){
                    setofSussesfull.addAll(opp.Automobile_Tag_Details_1__c.split('\n'));
                }
                if(opp.Automobile_Tag_Details_2__c != null){
                    setofSussesfull.addAll(opp.Automobile_Tag_Details_2__c.split('\n'));
                }
                if(opp.Automobile_Tag_Details_3__c != null){
                    setofSussesfull.addAll(opp.Automobile_Tag_Details_3__c.split('\n'));
                }
                if(opp.Return_To_HQ__c != null){
                    setofSussesfull.addAll(opp.Return_To_HQ__c.split('\n'));
                }
                System.debug('--->>>>'+setofSussesfull);
                if(setofSussesfull.size()>0){
                    for(String sensorName : setofSussesfull) {
                        if(sensorName.startsWith('00:11:CE:00')){
                            body +='<tr><td>'+'Sensor'+'</td><td>'+sensorName+
                                '</td><td>'+'Sensor inserted under Installation account '+opp.AccountId+'</td></tr>';
                        } else if(sensorName.startsWith('00:11:CE:D')) {
                            body +='<tr><td>'+'Presence_Sensor'+'</td><td>'+sensorName+
                                '</td><td>'+'Sensor inserted under Installation account '+opp.AccountId+'</td></tr>';
                        } else if(sensorName.startsWith('00:11:CE:E')){
                            body +='<tr><td>'+'TDU_Sensor'+'</td><td>'+sensorName+
                                '</td><td>'+'Sensor inserted under Installation account '+opp.AccountId+'</td></tr>';
                        } else if(sensorName.substring(0,3).isNumeric()) {
                            body +='<tr><td>'+'Tag_Sensor'+'</td><td>'+sensorName+
                                '</td><td>'+'Sensor inserted under Installation account '+opp.AccountId+'</td></tr>';
                        } else{
                            setofUnsussesfull.add(sensorName);
                        }              
                    }
                    System.debug('--->>>>'+setofUnsussesfull);
                    body += '</table><br/><br/>';
                    if(!setofUnsussesfull.isEmpty()){
                        body += 'Unsussesfull : ' + '<br/>';
                        body +=  '<table border="1" cellspacing="0"><tr><th>Automobile Type</th><th>Name</th><th>Message</th></tr>';
                        for(String sensor :setofUnsussesfull ){
                            body += '<tr><td>'+'Sensor'+'</td><td>'+sensor+'</td><td>'+'Invalid Sensor'+'</td></tr>';
                        }
                        body += '</table>';
                        }
                    }      
                mail.setHtmlBody(body);
                mails.add(mail); 
            }  
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