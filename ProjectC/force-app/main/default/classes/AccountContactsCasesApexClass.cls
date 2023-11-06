public class AccountContactsCasesApexClass {
    
    //Method1 Create account
    public void MapAccountContactsCases(){
        
        Map<account,Map<contact,list<case>>> accMap = new Map<account,Map<contact,list<case>>>();
        
        //Get the account related contacts and contact related cases. Map the account related contacts and contact related cases.
        List<Account> acnt = [SELECT Id, (Select Id, AccountId From Contacts), (Select Id, ContactId From Cases) From Account];
        
        //for each loop to touch each and every account record
        for(Account acc: acnt){
            //for account we have multiple contacts and each contact can have multiple cases. Map the contact related cases
            Map<Contact,List<Case>> ConCasMap = new Map<Contact,List<Case>>();
            //collect contacts which are related to contacts
            for(Contact con: acc.Contacts){
                //collect the multiple cases in a collection variable
                List<case> caseList = new List<case>();
                //collect all the contact related cases in a variable
                for(case cas: con.cases){
                    caseList.add(cas);
                }
                //map the contact and its related cases = Map2
               ConCasMap.put(con,caseList); 
            }
            //map the account and Map2(contact and cases)
            accMap.put(acc,ConCasMap);
        }
    }
}