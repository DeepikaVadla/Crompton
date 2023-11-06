public class FibonacciSeriesApex {
    integer a = 0;
    integer b = 1;
    integer d;
    
    public void fibonacci(integer n){
        for(d=0;d<=n;d++){
          system.debug(a); 
            integer c=a+b;
            a=b;
            b=c;
        }
    }
}