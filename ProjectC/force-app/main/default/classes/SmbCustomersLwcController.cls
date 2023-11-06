public class SmbCustomersLwcController {
    @AuraEnabled(cacheable=true)
    public static Account doGetSMBCustomer(string acntId){
        Account acnt = [SELECT Id, Name, AccountNumber, Phone, Industry FROM Account Where ID =: acntId];
        return acnt;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> doGetSMBCustomersList(){
        List<Account> acntList = [SELECT Id, Name, AccountNumber, Phone, Industry FROM Account];
        return acntList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Service_Request_Form__c> relatedSRFs(String acntId){
        List<Service_Request_Form__c> srfList  = [SELECT Id, Name, SMB_Customer_Account__c, SMB_Location__c 
                                                  FROM Service_Request_Form__c 
                                                  WHERE SMB_Customer_Account__c =: acntId];
    return srfList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecords(string searchKey){
        string searchItem = '%' +searchKey+ '%';
        List<Account> acntList = [SELECT Id, Name, Phone FROM Account WHERE Name LIKE : searchItem limit 10];
        return acntList;
    }
}