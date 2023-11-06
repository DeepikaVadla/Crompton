trigger accountTrigger on Account (after update) {
    //Usecase- When the account record's customer relationship status is changed to No relation then the account related contact related open cases to be closed
    /* 
// Create a set to store Account IDs with 'No Relation' status
Set<Id> accountIdsWithNoRelation = new Set<Id>();

// Iterate through the updated Account records
for (Account updatedAccount : Trigger.new) {
Account oldAccount = Trigger.oldMap.get(updatedAccount.Id);

// Check if the 'Customer Relation Status' field has changed to 'No Relation'
if (updatedAccount.Customer_Relationship_Status__c == 'No Relation' && oldAccount.Customer_Relationship_Status__c != 'No Relation') {
accountIdsWithNoRelation.add(updatedAccount.Id);
}
}

// If there are Account records with 'No Relation' status, find related Contacts and Cases
if (!accountIdsWithNoRelation.isEmpty()) {
List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIdsWithNoRelation];
List<Case> casesToUpdate = new List<Case>();
// Find Cases related to the Contacts with status 'Open'
for (Contact contact : relatedContacts) {
List<Case> openCases = [SELECT Id FROM Case WHERE ContactId = :contact.Id AND Status = 'Open'];

// Update the Cases to 'Closed'
for (Case openCase : openCases) {
openCase.Status = 'Closed';
casesToUpdate.add(openCase);
}
}

// Update the Cases
if (!casesToUpdate.isEmpty()) {
update casesToUpdate;
}
}*/
    
    /*if(Trigger.isAfter && Trigger.isUpdate){
Set<Id> accSetId = new Set<Id>();
List<case> cL = new List<case>();
for(Account updateCRSacc : Trigger.New){
Account PriorAccRec = Trigger.OldMap.get(updateCRSacc.Id);
if(updateCRSacc.Customer_Relationship_Status__c == 'No Relation' && PriorAccRec.Customer_Relationship_Status__c != 'No Relation'){
accSetId.add(updateCRSacc.Id);
}
}
if(!accSetId.isEmpty()){
List<Contact> ConCasList = [Select Id, AccountId, (Select Id, ContactId, Status From Cases Where ContactId != Null AND Status != 'Closed') From Contact Where AccountId != Null];
for(Contact con : ConCasList){
for(Case cas : con.cases){
if(cas.ContactId != Null){
cas.Status = 'Closed';
cL.add(cas);
}

} 
}
if(!cL.isEmpty()){
Update cL;
}
}
}*/
    
  /* Final code   
   if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accSetId = new Set<Id>();
        List<case> cL = new List<case>();
        for(Account updateCRSacc : Trigger.New){
            Account PriorAccRec = Trigger.OldMap.get(updateCRSacc.Id);
            if(updateCRSacc.Customer_Relationship_Status__c == 'No Relation' && PriorAccRec.Customer_Relationship_Status__c != 'No Relation'){
                accSetId.add(updateCRSacc.Id);
            }
        }
        if(!accSetId.isEmpty()){
            //Map<Id,Contact> conMap = new Map<Id,Contact>();
            list<Id> conIds = new list<Id>();
            List<Contact> cList = [Select Id, AccountId From Contact Where AccountId IN :accSetId];
            for(Contact con : cList){
                conIds.add(con.Id);
            }
            
            List<Case> closeCaseList = [Select Id, ContactId From Case Where ContactId IN :conIds AND Status != 'Closed'];
            for(Case ca : closeCaseList){
                if(ca.ContactId != Null){
                    ca.Status = 'Closed';
                    closeCaseList.add(ca);
                }
            }
            if(!closeCaseList.isEmpty()){
                Update closeCaseList;
            }
        }
    } */ 
    
    
}