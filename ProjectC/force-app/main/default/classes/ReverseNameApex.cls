public class ReverseNameApex {
    public string name = 'Deepika';
    public string reversedName = '';
    
    public void displayReverse(){
        for(integer i=name.length()-1; i>=0; i--){
            reversedName = name.substring(i, i+1);
            system.debug('Resersed Name is: '+reversedName);
        }
        
    }
    
}