public class UserTriggerHandlerApex { 
    public static void doAfterUpdate(List<User> newUsersList, Map<Id,User> newUsersMap, List<User> oldUsersList, Map<Id,User> oldUsersMap){
        Map<Id,Id> deactivatedUserWithManagerIDMap = new Map<Id,Id>();
        for(User ur: newUsersList){
            //check for deactivated users ---> ur.isActive == false
            if(!ur.isActive){
                deactivatedUserWithManagerIDMap.put(ur.Id, ur.ManagerId);
            }
        } 
        if(!deactivatedUserWithManagerIDMap.isEmpty()){
            doChangeOwnerShip(deactivatedUserWithManagerIDMap);
        }
    }
    @future
    public static void doChangeOwnerShip(Map<Id,Id> deactivatedUserWithManagerIDMap){
        List<Account> toUpdateAcntList = new List<Account>();
        for(Account acnt: [SELECT Id, OwnerId FROM ACCOUNT WHERE OwnerId In:deactivatedUserWithManagerIDMap.keyset()]){
            acnt.ownerId = deactivatedUserWithManagerIDMap.get(acnt.ownerId);
            toUpdateAcntList.add(acnt);
        }
        if(!toUpdateAcntList.isEmpty()){
            update toUpdateAcntList;
        }
    }
}