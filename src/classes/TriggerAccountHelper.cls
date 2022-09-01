public with sharing class TriggerAccountHelper {
    public static Boolean AVOID_SUPPORTIVE_ACCOUNT_STAGE = true;
    public static void letsUpdate(){
        List<Account> changeList = Trigger.New;
        List<Account> newChange = new List<Account>();
        for(Account anc : changeList){
            newChange.add(new Account(Id = anc.Id , Name = 'Warning'));
        }
        // To Avoid Such Fixing Things
        TriggerAccountHelper.AVOID_SUPPORTIVE_ACCOUNT_STAGE = false;
        
        // Not to do such things
        update newChange;
    }
    public static void checkCondition(){
        List<Account> newList = Trigger.New;
        List<Account> oldList = Trigger.Old;
        Integer count = 0;
        for(Account acc : newList){
            if(acc.Phone == '3221' && oldList[count].Phone != ''){
                acc.Phone.addError('Approach Wrong');
            }
            if(acc.AnnualRevenue != oldList[count].AnnualRevenue && acc.AnnualRevenue > 1000){
                acc.Discount__c = 50;
            }
        }
    }
    public static void analizingData(){
        List<Account> newList = Trigger.New;
        List<Account> oldList = Trigger.Old;
        List<Opportunity> listOfOpp = [SELECT Id, Name, Amount, AccountId FROM Opportunity WHERE AccountId IN :newList];
        Set<Id> idList = new Set<Id>();
        for(Opportunity opp : listOfOpp){
            if(opp.Amount > 1000){
                idList.add(opp.AccountId);
            }
        }
        Integer count = 0;
        for(Account acd: newList){
            if(idList.contains(acd.Id)){
                acd.Type = 'Technology Partner';
            }
        }
        count++;
    }
}