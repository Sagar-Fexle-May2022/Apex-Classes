trigger HelloWorldTrigger on Book__c (before insert) {

   MyHelloWorld.applyDiscount(Trigger.new);
}