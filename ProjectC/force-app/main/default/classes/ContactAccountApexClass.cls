public class ContactAccountApexClass {
    Public void MapAccountContactRecords(){
        List<Account> alVar = [SELECT Id, AnnualRevenue, (SELECT Id, AccountId From Contacts Where AccountId != Null) From Account Where AnnualRevenue > 500000];
        Map<account,List<contact>> accVar = new Map<account,List<contact>>();
        for(Account a : alVar){
            accVar.put(a,a.Contacts);
        }
        system.debug(accVar);
    }
    //try
    public void MapContactAccountRecords(){
        Map<Contact,List<Account>> mVar = new Map<Contact,List<Account>>();
        List<Contact> clVar = [Select Id, LastName, AccountId From Contact Where AccountId != Null];
        List<Account> accVar = new List<Account>([Select Id, AnnualRevenue From Account Where AnnualRevenue > 500000]);
        //Set<Id> cVar = new Set<Id>();
        //for(Account a : accVar ){
        // cVar.add(a.Contacts);
        //}
        
        // Map<Id,account> mVar = new Map<Id,account>([SELECT Id, AnnualRevenue From Account Where AnnualRevenue > 500000]);
        
    }
    //try
    public void conAccMap(){
        Map<Id,Contact> cVar = new Map<Id,Contact>([Select Id, LastName, AccountId From Contact Where AccountId != null]);
        Map<Id,Account> aVar = new Map<Id,Account>([Select Id, Name, AnnualRevenue From Account Where AnnualRevenue > 500000]);
        
        
        
    }
    
    
    public void addMaps(){
        // Initialize Map1 to map Contact records to their IDs for associated accounts.
        Map<Id, Id> map1 = new Map<Id, Id>();
        
        // Query for Contact records associated with an Account and map them.
        for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId != null]) {
            map1.put(con.Id, con.AccountId);
        }
        
        // Initialize Map2 to map Account records to their IDs for accounts with Annual Revenue > 500,000.
        Map<Id, Id> map2 = new Map<Id, Id>();
        
        // Query for Account records with Annual Revenue > 500,000 and map them.
        for (Account acc : [SELECT Id FROM Account WHERE AnnualRevenue > 500000]) {
            map2.put(acc.Id, null); // We only need the Account ID in Map2.
        }
        
        // Initialize Map3 to map Contact records to their IDs and Account records to their IDs.
        Map<Id, Id> map3 = new Map<Id, Id>();
        
        // Iterate through Map1 (Contact records) and Map2 (Account records) to build Map3.
        for (Id contactId : map1.keySet()) {
            Id accountId = map1.get(contactId);
            if (map2.containsKey(accountId)) {
                map3.put(contactId, accountId);
            }
        }
        system.debug(map3);
        
        // Now, map3 contains the Contact records associated with an Account where the Account's Annual Revenue is > 500,000.
        
    }    
    
}