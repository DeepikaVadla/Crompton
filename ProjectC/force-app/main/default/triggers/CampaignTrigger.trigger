trigger CampaignTrigger on Campaign (before insert, after insert, After Update) {
    
    // For Usecase 002 - Initially we must Query the User Id details, because to create a task to fill the field Assigned to We must get the user Id details
    public Id oaUserId = [Select Id from User Where UserName = 'orderadmin@crompton.co.in.smbsales'].Id;
    
    //UseCase-001 -
    /* When we create a campaign and set the status as 'In Progress' then after saving the record Active checkbox must become true.
* When the active checkbox is active/true then the record must be saved only after providing the start date and end date fields.
* If start date and end date fields are empty then an error message must be populated and abort the save operation.
----------------------------------------------------------------------------------------------------------------------------------------------------
* No.of objects involved in the usecase - Campaign
*On which object we should write trigger - Campaign
*When the trigger should be fired - before the campaign record is saved
*Which event to be used - Before Trigger
*/
    
    /*Here we are using the event as 'before insert'. 
* If we want to ensure that the trigger to be fired only for before insert event then we need to provide the if condition as below.
* This condition is helpful when we provide multiple events in trigger syntax.
*/
    if(Trigger.IsBefore && Trigger.IsInsert){
        for(campaign cam : Trigger.New){
            if(cam.Status == 'In Progress'){
                cam.IsActive = True;
            }
            if(cam.StartDate == Null || cam.EndDate == Null){
                cam.addError('Please provide Start Date and End Date');
            }
        }
        //Unit test: Expectation: As we create a new campaign by only adding Status field data as In Progress then the error message to be populated. 
        //Also by entering start date and end date the record must be saved and after the record is saved active checkbox must be checked.
    }
    //Unit Test: Result: Is same as expection.
    
    
    //Use Case-002:
    /*When a child campaign is created then for that campaign record new task has to be created.
-----------------------------------------------------------------------------------------------------------------------------------------------------
* No. of objects involved in this usecase: Campaign & Task
* On which object we must write the trigger - Campaign
* When the trigger to be fired - After the child campaign is created
* What event to be used - After Insert
*/
    else if(Trigger.isAfter && Trigger.isInsert){
        List<Task> tsList = new List<Task>();
        for(campaign cm: Trigger.New){
            if(cm.ParentId != Null){
                Task tk = new Task();
                tk.Subject = 'New Campaign is created - Work on it';
                tk.ActivityDate = system.today();
                tk.WhatId = cm.Id; //If whatId is not added then the orphan task will be created
                tk.OwnerId = oaUserId;
                tk.Status = 'Not Started'; 
                tsList.add(tk);
            }
        }
        if(!tsList.isEmpty()){
            Insert tsList;
        }
        /*Unit test: Expected Result: When A new campaign is created by providing status as In progress, start date, end date and parent Id 
*then after saving for the campaign record active checkbox to be checked and a new task has to be created to the user OrderAdmin.
*Before saving the campaign record if start date and end date are not provided then the campaign record should not be saved and an error message must be populated.
*/
    }
    //Unit test: Result is same as expected result
    
    
    //Use Case - 003a - Error Message - System.Final Exception: Read Only
    /*When a campaign record is updated(even any one field is updated) then 
     * if Start Date and End Date are different then after saving the record End Date value should be Same as Start Date.
--------------------------------------------------------------------------------------------------------------------------------------------------------------
* On Which object the trigger to be written - Campaign
* When the trigger to be fired - After the record is updated
*What event to be used - After Update
*/
    
    /*else if(Trigger.isAfter && Trigger.isUpdate){
        for(campaign camp : Trigger.New){
            if(camp.StartDate != camp.EndDate){
                camp.EndDate = camp.StartDate;
            }
        }
    }*/
    
    //Use Case - 003b - Record will be saved but Error message will not be displayed and expected result is not achieved
    /*else if(Trigger.isAfter && Trigger.isUpdate){
        List<Campaign> ca = [Select Id, StartDate, EndDate From Campaign Where ID IN:Trigger.NewMap.KeySet()];
        for(campaign cam : ca){
            if(cam.StartDate != cam.EndDate){
                cam.StartDate = cam.EndDate;
            }
        }
    }*/
    
    
    //Use Case - 003c - Record to be saved without Error and record to be updated as extpected result as start date = End Date
    else if(Trigger.isAfter && Trigger.isUpdate){
        List<campaign> caList = [Select Id, StartDate, EndDate From Campaign Where ID IN:Trigger.NewMap.KeySet()];
        List<Campaign> cp = new List<Campaign>();
        for(campaign c : caList){
            if(c.StartDate != c.EndDate){
                c.EndDate = c.StartDate;
                cp.add(c);
            }
        }
        Update cp;
    }
    /*Unit Test: When we edit the campaign record and save the record then the record will be saved (no error message will be showed) and expected result is achieved i.e start date = End Date
    To create a recurssion error then we should not provide the if condition. so the trigger will 
    
    
    */
    
    //Use Case - 003d - Create a trigger so that Recurssion error occurs
    
    
}