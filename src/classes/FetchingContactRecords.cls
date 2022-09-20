public with sharing class FetchingContactRecords {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactInTileView() {
        return [SELECT Id,Name,Phone,Email FROM Contact LIMIT 15];
    }
}