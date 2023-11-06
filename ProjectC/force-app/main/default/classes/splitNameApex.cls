public class splitNameApex {
    public string name = 'Deepika';
    public string i;
    
    public void display(){
        for(integer i=0;i<name.length();i++){
            system.debug(name.substring(i, i+1));
        }
    }
}