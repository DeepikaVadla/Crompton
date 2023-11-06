public class ReportCardApex {
    public String name;
    public String rollNo;
    public Integer total;
    public Integer average;
    public string grade;
    public string overallresult;
    public string report;
        // Method 1 Student details
    public void hallTicketDetails(string name, string rollNo){
        system.debug('Name: '+name + '\n RollNo: '+rollNo);
        Date day = Date.today();
        system.debug('Result Date: ' +day);
    }    
    // Method 2  Each subject details result to be displayed only if the marks are entered within range of 0 to 100.
    public void subjectMarks(Integer telugu, Integer hindi, Integer english, Integer maths, Integer science, Integer social){
        
        if(telugu<0 || telugu>100){
            system.debug('Telugu : Marks entered are wrong. Please Verify');
        }
        if(telugu>=35 && telugu<=100){
            system.debug('Telugu: Pass' );
        }
        else{
            system.debug(' Telugu: Fail');
        }
        
        if(hindi<0 || hindi>100){
            system.debug('Hindi : Marks entered are wrong. Please Verify');
        }
        if(hindi>=35 && hindi<=100){
            system.debug('Hindi: Pass');
        }
        else {
            system.debug('Hindi: Fail');
        }
        if(english<0 || english>100){
            system.debug('English : Marks entered are wrong. Please Verify');
        }
        if(english>=35 && english<=100){
            system.debug('English: Pass');
        }
        else {
            system.debug('English: Fail');
        }
        if(maths<0 || maths>100){
            system.debug('Maths : Marks entered are wrong. Please Verify');
        }
        if(maths>=35 && maths<=100){
            system.debug('Maths: Pass');
        }
        else {
            system.debug('Maths: Fail');
        }
        if(science<0 || science>100){
            system.debug('Science : Marks entered are wrong. Please Verify');
        }
        if(science>=35 && science<=100){
            system.debug('Science: Pass');
        }
        else {
            system.debug('Science: Fail');
        }
        if(social<0 || social>100){
            system.debug('Social : Marks entered are wrong. Please Verify');
        }
        if(social>=35 && social<=100){
            system.debug('Social: Pass');
        }
        else {
            system.debug('Social: Fail');
        }
        
        //Total calculation
        total = telugu+hindi+english+maths+science+social;
        if(total<=600){
            system.debug('Total: '+total  +'/600');
        }
        else{
            system.debug('Total: Verify Subject Marks');
        }
        //average calculation
        average= total/6;
        if(average<=100){
            system.debug('Percentage: '+average +'%');
        }
        else{
            system.debug('Percentage: Verify Subject Marks');
        }      
        
        //Overall Result
        if(telugu<0 || telugu>100 || hindi<0 || hindi>100 || english<0 || english>100 || maths<0 || maths>100 || science<0 || science>100 || social<0 || social>100){
            system.debug('Overall Result: Verify Subject Marks');   
        }
        
        else if(telugu>=35 && telugu<=100 && hindi>=35 && hindi<=100 && english>=35 && english<=100 && maths>=35 && maths<=100 && science>=35 && science<=100 && social>=35 && social<=100){
            overallresult  = 'Pass';
            system.debug('Overall Result: '+overallresult);
        }
        Else{
            system.debug('Overall Result: Fail');
        }
        //Grade Calculation
        if(telugu<0 || telugu>100 || hindi<0 || hindi>100 || english<0 || english>100 || maths<0 || maths>100 || science<0 || science>100 || social<0 || social>100){
            system.debug('Grade: Verify Subject Marks');   
        }
        
        else if(telugu>=35 && telugu<=100 && hindi>=35 && hindi<=100 && english>=35 && english<=100 && maths>=35 && maths<=100 && science>=35 && science<=100 && social>=35 && social<=100){   
            if(total<=600 && total>500){
                report = 'A1';
                system.debug('Overall Grade: ' +report);
            }
            else if(total<=500 && total>400){
                report = 'A2';
                system.debug('Overall Grade: ' +report);
            }
            else if(total<=400 && total>300){
                report = 'B1';
                system.debug('Overall Grade: ' +report);
            }
            else if(total<=300 && total>200){
                report = 'B2';
                system.debug('Overall Grade: ' +report);
            }
            else if(total<=200 && total>100){
                report = 'C';
                system.debug('Overall Grade: ' +report);
            }
        }
        else{
            system.debug('Overall Grade: F');
        }
    } 
}