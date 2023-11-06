public class ConditionalStatementEgApex {
    public Decimal c;
    Public Decimal d;
    //Method declaration
    public Decimal conditional(decimal a, decimal b){
        if(a>1.1 && b<10.1){
            c=a+b;  
        }
        else if(a<5.1 && b>10.1){
            decimal d;
            d=a-b;
        }
        else{
            system.debug('null');
        }
        return c;
    }
}