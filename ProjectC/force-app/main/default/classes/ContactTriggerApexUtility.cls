/*
* Author: Deepika
* Date: 07-10-2023
* Description: This is an contact trigger uitility class
* 1.1) it handles to calculate count of associated contacts.
*/
public with sharing class ContactTriggerApexUtility {
    
    /*
* Method Name: noOfcontactsCountCalculation
* Description: this method will count the numer of associated contacts and update the account No_of_Contacts_Count__c field value.
*/
    public static void noOfcontactsCountCalculation(List<Contact> consList, Map<Id, Contact> consMap){
        set<Id> accountIdset = new set<Id>();
        for(contact con: consList){
            if(String.isNotBlank(con.AccountId) && consMap==null){
                accountIdSet.add(con.AccountId);
            }else if(String.isNotBlank(con.AccountId) && !consMap.isEmpty()){
                //for update operation//
                contact oldCon = consMap.get(con.id); //prior contact record
                if(oldCon.AccountId != con.AccountId){
                    accountIdSet.add(con.AccountId);
                    accountIdSet.add(oldCon.AccountId);
                }
            }
        }
        List<Account> acntList = new List<Account>();
        //this is sub query which get list of account with related contacts.
        for(Account acnt: [select Id, No_of_Contacts_Count__c, (select Id from contacts) 
                           from Account where Id IN: accountIdSet ]){
                               acnt.No_of_Contacts_Count__c = acnt.contacts.size();
                               acntList.add(acnt);
                           }
        if(!acntList.isEmpty()){
            update acntList; //dml
        }
    }//method end
    
    public static void totalSumofSalaryCalculation(List<Contact> consList, Map<Id, Contact> consMap){
        set<Id> accountIdset = new set<Id>();
        for(contact con: consList){
            if(String.isNotBlank(con.AccountId) && consMap==null){
                accountIdSet.add(con.AccountId);
            }else if(String.isNotBlank(con.AccountId) && !consMap.isEmpty()){
                //for update operation//
                contact oldCon = consMap.get(con.id); //prior contact record
                if(oldCon.AccountId != con.AccountId || oldCon.salary__c != con.salary__c){
                    accountIdSet.add(con.AccountId);
                    accountIdSet.add(oldCon.AccountId);
                }
            }
        }
        List<Account> toupdateAccountsList = new List<Account>();
        List<AggregateResult> arlist = [Select AccountId, sum(salary__c)sal 
                                        From contact 
                                        Where AccountId !=null Group by AccountId];
        for(AggregateResult ar: arlist){
            Decimal amount  = (decimal)ar.get('sal');
            Account acnt  = new Account(id = (id)ar.get('AccountId'));
            acnt.Total_Contacts_Salary__c = amount;
            toupdateAccountsList.add(acnt);
        }
        if(!toupdateAccountsList.isEmpty()){
            update toupdateAccountsList;
        }
        
    }
    
}