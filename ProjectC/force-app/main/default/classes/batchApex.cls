public class batchApex implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('-----Start-----');
        string query = 'SELECT Id, Name, Title, Company FROM Lead Where Title = null';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> leadList){
        system.debug('-----Execute-----');
        List<Lead> lds = (List<Lead>) leadList;
        List<lead> leadtoUpdate = new List<lead>();
        
        for(lead ld:lds){
            ld.title = 'Batch Apex Field Update';
            ld.Phone = '8965302147';
            leadtoUpdate.add(ld);
        }
        if(!leadtoUpdate.isEmpty()){
            Update leadtoUpdate;
        }
    }
    
    public void finish(Database.BatchableContext BC){
        system.debug('-----Finish-----');
    }
    
}