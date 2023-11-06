public class lwcApexClassController {

    @AuraEnabled(cacheable=true)
    public static string demoShowMe(){
        return 'Invoke Apex Class into LWC Component'; 
    }

    @AuraEnabled(cacheable=true)
    public static string demoDisplayMe(string someInputdata){
        return 'Yodha GTC' +someInputdata; 
    }

}