public with sharing class ContactTriggerApexHandler {
    
    public static boolean isAlreadyRun = false;
    public static boolean isRun(){        
        return isAlreadyRun;
    }
    
    public static boolean istoBypass(){
        bypassTriggers__c mc = bypassTriggers__c.getValues('Contact Trigger');
        return mc.isBypass__c;
    }
    
    public static void doAfterInsert(List<Contact> newConsList, Map<Id, Contact> newConsMap){
        ContactTriggerApexUtility.noOfcontactsCountCalculation(newConsList, null);
        ContactTriggerApexUtility.totalSumofSalaryCalculation(newConsList, null);        
    }
    public static void doAfterUpdate(List<Contact> newConsList, Map<Id, Contact> newConsMap, List<Contact> oldConsList, Map<Id, Contact> oldConsMap){
        ContactTriggerApexUtility.noOfcontactsCountCalculation(newConsList, oldConsMap);
        ContactTriggerApexUtility.totalSumofSalaryCalculation(newConsList, oldConsMap);
    }
    public static void doAfterDelete(List<Contact> oldConsList, Map<Id, Contact> oldConsMap){
        ContactTriggerApexUtility.noOfcontactsCountCalculation(oldConsList, null);
        ContactTriggerApexUtility.totalSumofSalaryCalculation(oldConsList, null);
    }
    public static void doAfterUnDelete(List<Contact> newConsList, Map<Id, Contact> newConsMap){
        ContactTriggerApexUtility.noOfcontactsCountCalculation(newConsList, null);
        ContactTriggerApexUtility.totalSumofSalaryCalculation(newConsList, null);
    }
    
}