public class DMLOperationApexClass {
    
    public DMLOperationApexClass(){
        create1();
        create2();
        create3();
        getRecord();
        getAccRecord();
        Create4();
        create5();
        createTask1();
        Create6();
        create7();
        uprecord();
        create8();
        create9();
        create10();
        convertionpro();
    }
    
    //Method 1 Insert Single Account Record 
    public void create1(){
        Account accVar = new Account(); //object instantiation
        accVar.Name = 'Apex Code DML Operation - INSERT';
        accVar.Active__c = 'Yes';
        accVar.Industry = 'Banking';
        accVar.Phone = '9874850123';
        accVar.AnnualRevenue = 215478036;
        accVar.Total_No_Of_Contacts__c = 2;
        accVar.Email__c = 'test.apexcodeDMLoperation@gmtest.com';
        Insert accVar;
        system.debug('Created New Record is:'+accVar);
    }
    
    //Method 2 Create a Contact
    public void create2(){
        Contact conVar = new Contact();
        conVar.LastName = 'Test Contact Creation 008';
        conVar.Salutation = 'Mr';
        conVar.FirstName = 'Apex Code';
        conVar.Birthdate = system.today();
        conVar.MailingPostalCode = '502032';
        conVar.LeadSource = 'Web';
        conVar.Email = 'deepika.vadla4@gmail.com';
        insert conVar;
        system.debug('New Contact Created through Apex Code is:' +conVar);       
    }
    
    //Method 3 Associate a New Contact to a New Account
    public void create3(){
        Account acnt = new Account();
        acnt.Name = 'Mr.Test Acnt';
        acnt.Active__c = 'Yes';
        acnt.Total_No_Of_Contacts__c = 2;
        acnt.Rating = 'Hot';
        Insert acnt;
        System.debug('New Account Created is:'+acnt);
        
        Contact cont = new Contact();
        cont.AccountId = acnt.Id;
        cont.LastName = 'Associate Contact to Account Record';
        cont.Phone = '7801008397';
        cont.Birthdate = date.newInstance(1992, 12, 19);
        cont.Email = 'test.contact1245@gm.com';
        INSERT cont;
        system.debug('New Contact Created is:' +cont);        
    } 
    
    //Method 4 Get the existing record from the database using SOQL 
    public void getRecord(){
        Account acntVar = [SELECT Id, Name, Type 
                           FROM Account 
                           WHERE Name = 'Mr.Test Acnt' LIMIT 1];
        system.debug('Get Record DML Operation:'+acntVar);
        
        List <Contact> cntVar = [SELECT Id, Name, AccountId 
                                 FROM Contact 
                                 WHERE AccountId = '0015j00001Badkv'];
        system.debug('Related 3 contacts are:' +cntVar);
        
    }
    
    //Method 5 Try Catch Exception, by trying to get the record which doesnot exist and associate a new contact to it
    public void getAccRecord(){
        try{
            Account accVar1 = [SELECT Id, Name, Type, Industry, Email__c 
                               FROM Account
                               WHERE Name = 'Hello Baby']; 
            system.debug('The Account which doesnot exist: '+accVar1);
            Contact conVar1 = new Contact();
            conVar1.Lastname = 'Hello Kitty';
            conVar1.Phone = '7801007897';
            system.debug('New Contact is:' +conVar1); 
        }
        catch(Exception ex){
            system.debug('Account Doesnot exist. Plese create an Account Record Initially');
        }
    }
    
    //Method 6 Create New Campaign Record
    public void Create4(){
        Campaign campVar = new Campaign();
        campVar.Name = 'Test Campaign 1001';
        campVar.IsActive = True;
        campVar.Type = 'Partners';
        campVar.Status = 'Planned';
        campVar.StartDate = date.newinstance(2023,09,25);
        campVar.EndDate = date.newinstance(2023,10,02);
        campVar.ExpectedRevenue = 250000;
        campVar.BudgetedCost = 25000;
        campVar.ActualCost = 10000;
        campVar.Description = 'Trying to create a new campaign record through Apex Code';
        
        Insert campVar;
        System.debug('Created New Campaign Record:' +campVar);
        
    }
    
    //Method 7 - Update above created Campaign Record
    Public void create5(){
        Campaign camVar = new Campaign();
        camVar.Id = '7015j000001DtmYAAS';
        camVar.ExpectedResponse = 25.5;
        Update camVar;
        system.debug('Update the Expected Response % field as: '+camVar);
    }
    
    //Method 8 - Create a new task for the created campaign
    public void createTask1(){
        Campaign cpgnVar = [SELECT Id, Name, Type, Status FROM Campaign WHERE Name = 'Test Campaign 001'];
        Task dataVar = new Task();
        dataVar.Subject = 'Please Review This Campaign';
        dataVar.Priority = 'High';
        dataVar.Status = 'In Progress';
        dataVar.ReminderDateTime = datetime.newInstance(2023,09,23, 4,4,4);
        //dataVar.Id = cpgnVar.Id;
        dataVar.WhatId = cpgnVar.Id;
        
        Insert dataVar;
        system.debug('New Task is:'+dataVar);
        
    }
    
    //Method 9 - Associate a new SMB Order record for created Campaign record
    public void Create6(){
        Opportunity order1 = new Opportunity();
        order1.Name = 'Test Opportunity Record';
        order1.closeDate = date.newInstance(2023, 09, 27);
        order1.StageName = 'Value Proposition';
        order1.IsPrivate = True;
        order1.Amount = 125478963;
        order1.AccountId = '0015j000016xUb9AAE';
        order1.Type = 'New Customer';
        order1.LeadSource = 'Web';
        order1.CampaignId = '7015j000001DtmYAAS';
        Insert order1;
        system.debug('Created New SMB Order is associated to Campaign:' +order1);       
    } 
    
    //Method 10 - Create a new Lead
    public void create7(){
        Lead createrec = new Lead();
        createrec.LastName = 'New Lead Creation - Test';
        createrec.Company = 'CGI';
        createrec.LeadSource = 'Open - Not Contacted';
        createrec.Title = 'New Lead Creation using Apex Code';
        createrec.AnnualRevenue = 54782103;
        createrec.Phone = '9874563210';
        
        Insert createrec;
        system.debug('The New Lead Creation: '+createrec);
    }
    
    //Method 11 - Associate a lead to campaign
    public void uprecord(){
        CampaignMember creRec = new CampaignMember();
        creRec.campaignId = '7015j000001DraI';
        creRec.LeadId = '00Q5j00000SSMFh';
        Insert creRec;
        system.debug('Existing Lead Record Association to Campaign:'+creRec);
    }
    
    //Method 12 - Create Service request form
    public void create8(){
        Service_Request_Form__c hey = new Service_Request_Form__c();
        hey.SMB_Customer_Account__c = '0015j000019jyRp';
        hey.SMB_Location__c = 'a025j00000deVSB';
        hey.SMB_Warehouse__c = 'a035j00000Rqyay';
        Insert hey;
        system.debug('New SRF Record is:' +hey);
    }
    
    //Method 13 - Create SMB Location
    public void create9(){
        SMB_Location__c hello = new SMB_Location__c();
        hello.Name = 'Test Location Apex Code';
        Insert hello;
        system.debug('Create a new SMB location: '+hello);
    }
    
    //Method 14 - Create SMB Warehouse
    public void create10(){
        Warehouse__c house = new Warehouse__c();
        house.Name = 'Test Warehouse';
        Insert house;
        
    }
    
    //Method 15 - Lead Conversion
    public void convertionpro(){
        Lead myLead = new Lead(LastName = 'Fry', Company='Fry And Sons', LeadSource = 'Open - Not Contacted', Phone ='7093358123');
        insert myLead;        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(myLead.id);        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);      
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        system.debug('Lead Conversion is:'+lcr);
    }    
/*  public void convertion(){
lead mylead = new Lead(LastName = 'Test Lead Convert', Company = 'Info', LeadSource = 'Open - Not Contacted', Phone = '7093358123');
Insert mylead;

Database.LeadConvert lcn = new Database.leadConvert();
lcn.setLeadId(mylead.id);

LeadStatus const = [SELECT Id, MasterLabel From LeadStatus Where IsConverted=true];
lcn.setConvertedStatus(const.MasterLabel);
Database.LeadConvertResult lcr = Database.convertLead(lc);
System.assert(lcr.isSuccess());
}
*/
    
}