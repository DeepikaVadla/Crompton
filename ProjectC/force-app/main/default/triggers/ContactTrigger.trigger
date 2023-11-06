trigger ContactTrigger on Contact (After insert, After update, After delete, After undelete) {
   
    if(!ContactTriggerApexHandler.istoBypass()){
        if(!ContactTriggerApexHandler.isRun()){
            if(Trigger.isAfter){
                if(Trigger.isInsert){
                    ContactTriggerApexHandler.doAfterInsert(Trigger.New, Trigger.NewMap);
                }else if (Trigger.isUpdate){
                    ContactTriggerApexHandler.doAfterUpdate(Trigger.New, Trigger.NewMap, Trigger.old, Trigger.oldMap);
                }else if (Trigger.isDelete){
                    ContactTriggerApexHandler.doAfterDelete(Trigger.old, Trigger.oldMap);
                }else if (Trigger.isUnDelete){
                    ContactTriggerApexHandler.doAfterUnDelete(Trigger.New, Trigger.NewMap);
                }
            }
             //end of the transaction//
            ContactTriggerApexHandler.isAlreadyRun = true;
        }
    }
    
}