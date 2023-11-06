public class passportverifyApex {
    public String passportId = 'J8369855';
    public String passengerName = 'RAMADUGULA';
    public String mobile = '+91 9876543219';
    
    //Method-1
    public void passport(String ID){
        if(ID != passportId){
            system.debug('Please verify your Passport ID');   
        }
        else{
            system.debug('Passport ID: Verified');
        }
    }
    //Method-2
    public void passengerdetails(string Name, string PhoneNumber){
        if(Name != passengerName){
            system.debug('Verify Passenger Name details');
        }
        else{
            system.debug('Name: Verified');
        }
        if(PhoneNumber != mobile){
            system.debug('Verify Passenger Phone Number details');
        }
        else{
            system.debug('Phone: Verified ');
        }
    }
}