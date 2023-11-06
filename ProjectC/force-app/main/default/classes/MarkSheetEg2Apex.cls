public class MarkSheetEg2Apex{
    public String result;
    public string grade;
    public string report;
    public string overallresult;
    //Method1
    public void details(string name, String rollNo){
        system.debug('Name: '+name +'\nRoll Number: '+rollNo);
        Date day = Date.today();
        system.debug('Date: '+day);
    }
    //Method2
    public void report(integer Telugu,integer Hindi, integer English, integer Maths, integer Science, integer Social){
        if(Telugu>100){
            system.debug('Marks entered for Telugu are >100. Please Verify');
            if(Telugu>=35 && Telugu<=100){
                system.debug('Telugu: Pass');
            }
            Else{
                system.debug('Telugu: Fail');
            }
        }
        if(Hindi>100){
            system.debug('Marks entered for Hindi are >100. Please Verify');
            if(Hindi>=35 && Hindi<=100){
                system.debug('Hindi: Pass');  
            }
            Else{
                system.debug('Hindi: Fail');
            }
        }
        if(English>100){
            system.debug('Marks entered for English are >100. Please Verify');
            if(English>=35 && English<=100){
                system.debug('English: Pass'); 
                
            }
        } 
        Else{
            system.debug('English: Fail');
        }
        if(Maths>100){
            system.debug('Marks entered for Maths are >100. Please Verify');
            if(Maths>=35 && Maths<=100){
                system.debug('Maths: Pass');
            }
        } 
        Else{
            system.debug('Maths: Fail');
        }
        if(Science>100){
            system.debug('Marks entered for science are >100. Please Verify');
            if(Science>=35 && Science<=100){
                system.debug('Science: Pass');
            }
        } 
        Else{
            system.debug('Science: Fail');
        }
        if(Social>100){
            system.debug('Marks entered for Social are >100. Please Verify');
            if(Social>=35 && Social<=100){
                system.debug('Social: Pass');
            }
        } 
        Else{
            system.debug('Social: Fail');
        }
        
        
        integer total;
        integer average;
        
        total = Telugu+Hindi+English+Maths+Science+Social; 
        system.debug('Total Marks = '+total+'/600');
        average = total/6;
        system.debug('Average = '+average +'%');
        
        
        if(Telugu>=35 && Telugu<=100 && Hindi>=35 && Hindi<=100 && English>=35 && English<=100 && Maths>=35 && Maths<=100 && Science>=35 && Science<=100 && Social>=35 && Social<=100){
            overallresult  = 'Pass';
            system.debug('Result: '+overallresult);
        }
        Else{
            system.debug('Result: Fail');
        }
        
        if(Telugu>=35 && Telugu<=100 && Hindi>=35 && Hindi<=100 && English>=35 && English<=100 && Maths>=35 && Maths<=100 && Science>=35 && Science<=100 && Social>=35 && Social<=100 ){   
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