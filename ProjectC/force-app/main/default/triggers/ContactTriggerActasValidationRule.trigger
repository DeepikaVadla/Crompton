trigger ContactTriggerActasValidationRule on Contact (Before Insert) {
    
    //Trigger acts as validation rule
    
    /*trigger is an code included automation process which listens the events on Sobjects for before and after mode
Events are as Insert, Update, Delete and Undelete. And Also Merge and Upsert events can be performed. Modes are Before and After.
The total number of events are before Insert, After Insert, Before Update, After Update, Before Delete, After Delete and After Undelete


trigger contactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete){}
In the above statement trigger is the keyword, contactTrigger is the Trigger name, on is the keyword, Contact is the SObject, Before Insert is the mode of event.
Within paranthesis we can mention all 7 modes of operation 

Trigger is similar to Record-Triggered flow, which can be invocked by itself as the sobject is mentioned and mode of event is registered.
Apex class is similar to auto-launched flow, which cannot be invocked by itself. Apex can be invoked by using triggers.


*/
    
    /*
trigger contactTrigger on Contact (before insert){
list<Contact> conList = Trigger.New; // trigger.new is a list type collection variable
Map<Id,Contact> conMap = Trigger.NewMap; //trigger.newMap is used to Map the contact records with its respective ID.
}
*/ 
    
    /*Including a validation rule in the trigger
* Which event should be considered - Before Insert
* check the condition and add the error which should be shown at top of the record or show the error at specific field 

*/
    
    /*
* trigger contactTrigger on Contact (before insert, before update)
for(contact con:Trigger.New)
if(con.phone == null){
con.adderror('Please provide the phone number');
//con.Phone.adderror('Provide the Phone Number to save the record');
}
*/
    
    /* // Writing a Regular Expression Validation rule - Phone number has to be in specific pattern.
*trigger contactTrigger on Contact (before insert, before update){
for(contact con : Trigger.New){
String PhonePattern = '^((\\+91)?\\s?\\d{10})?$';

Pattern pattern = pattern.compile(PhonePattern); // pattern is a method in mather class. Use Pattern method to compile the regularexpression pattern

Matcher match = pattern.matcher(con.Phone); //use the matcher() method to create a matcher object

if(!match.matches()){ //matches() is a method in matcher class
con.addError('Please provide a valid phone number');
}        

}
}
*/
    
    /*
trigger contactTrigger on Contact (before insert, before update)
string currentloggedinUserId = userinfo.getUserId();
for(contact con : Trigger.old){
if(currentloggedinUserId != con.OwnerId){
con.addError('You are not authorised to delete the record');
}
}
*/
       //system.debug('Size:' +Trigger.New.size());
   
    
    
}