public class GetAccountRecordApexClass {
    
    public void getRecord(){
    
       Account accVar = [SELECT Id, Name, RecordTypeId, Phone, Rating, Active__c, Email__c FROM Account Limit 1];
       Account recordRec = [SELECT Id, Name, RecordTypeId, Phone, Rating, Active__c, Email__c FROM Account Where Id = '0015j000016vXxEAAU']; //specific record
        system.debug(accVar);
        system.debug(recordRec);
    }
}