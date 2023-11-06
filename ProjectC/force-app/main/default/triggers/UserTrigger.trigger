trigger UserTrigger on User (after update) {
   
    UserTriggerHandlerApex.doAfterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
     
}