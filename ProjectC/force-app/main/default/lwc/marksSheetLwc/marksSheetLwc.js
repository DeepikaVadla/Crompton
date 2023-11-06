import { LightningElement } from 'lwc';
export default class MarksSheetLwc extends LightningElement {

    teluguVar = null;
    hindiVar = null;
    englishVar = null;
    mathsVar = null;
    scienceVar = null;
    socialVar = null;
    totalVar = null;
    percentageVar = null;
    resultVar = null;
    gradeVar = null;

    marksCalculation(event){
        let inputMarksVar = event.target.name;
        if(inputMarksVar == 'Telugu'){
            this.teluguVar = event.target.value;
        }else if(inputMarksVar == 'Hindi'){
            this.hindiVar = event.target.value;
        }else if(inputMarksVar == 'English'){
            this.englishVar = event.target.value;
        }else if(inputMarksVar == 'Maths'){
            this.mathsVar = event.target.value;
        }else if(inputMarksVar == 'Science'){
            this.scienceVar = event.target.value;
        }else if(inputMarksVar == 'Social'){
            this.socialVar = event.target.value;
        }
    }

    totalAndPercentage(event){
    //total calculation
        this.totalVar = parseInt(this.teluguVar) + parseInt(this.hindiVar) + parseInt(this.englishVar) + parseInt(this.mathsVar) + 
        parseInt(this.scienceVar) + parseInt(this.socialVar);
        if((parseInt(this.teluguVar) >=35 && parseInt(this.teluguVar) <=100) && 
             (parseInt(this.hindiVar) >=35 && parseInt(this.hindiVar) <=100) &&
             (parseInt(this.englishVar) >=35 && parseInt(this.englishVar) <=100) &&
             (parseInt(this.mathsVar) >=35 && parseInt(this.mathsVar) <=100) &&
             (parseInt(this.scienceVar) >=35 && parseInt(this.scienceVar) <=100) && 
             (parseInt(this.socialVar) >=35 && parseInt(this.socialVar) <=100)){
            console.log('Total is:' +this.totalVar);            
        }
        else if(parseInt(this.teluguVar) >100  || parseInt(this.teluguVar) <0 ||
        parseInt(this.hindiVar) >100 || parseInt(this.hindiVar) <0 ||
        parseInt(this.englishVar) >100 || parseInt(this.englishVar) <0 ||
        parseInt(this.mathsVar) >100 || parseInt(this.mathsVar) <0 ||
        parseInt(this.scienceVar) >100 || parseInt(this.scienceVar) <0 ||
        parseInt(this.socialVar) >100 || parseInt(this.socialVar) <0 ){
            this.totalVar = +this.totalVar;
            alert('Wrong Marks Registered');
        }
    //Percentage Calculation
        this.percentageVar = ((this.totalVar / 600) * 100).toFixed(2);
        console.log('Percentage is: ' +this.percentageVar);

    //Result - Pass or Fail
        if( (parseInt(this.teluguVar) >=35 && parseInt(this.teluguVar) <=100) && 
             (parseInt(this.hindiVar) >=35 && parseInt(this.hindiVar) <=100) &&
             (parseInt(this.englishVar) >=35 && parseInt(this.englishVar) <=100) &&
             (parseInt(this.mathsVar) >=35 && parseInt(this.mathsVar) <=100) &&
             (parseInt(this.scienceVar) >=35 && parseInt(this.scienceVar) <=100) && 
             (parseInt(this.socialVar) >=35 && parseInt(this.socialVar) <=100)){
          this.resultVar = 'Pass';
          console.log('The Result is: '+this.resultVar);       
        }
        else if(parseInt(this.teluguVar) >100  || parseInt(this.hindiVar) >100 || parseInt(this.englishVar) >100 || 
                parseInt(this.mathsVar) >100 || parseInt(this.scienceVar) >100 || parseInt(this.socialVar) >100){
        this.resultVar = 'Error';
        console.log('Wrong Marks Registered');
        alert('Wrong Marks Registered');
        }
        else if(parseInt(this.teluguVar) <35  || parseInt(this.hindiVar) <35 || parseInt(this.englishVar) <35 || 
                parseInt(this.mathsVar) <35 || parseInt(this.scienceVar) <35 || parseInt(this.socialVar) <35){
        this.resultVar = 'Fail';
        console.log('The Result is: '+this.resultVar);
        }
    //Grade calculation based on percentage
        if(parseInt(this.percentageVar) >= 80){
            this.gradeVar = 'A';
        console.log('A Grade');
        }
        else if(parseInt(this.percentageVar) <80 || parseInt(this.percentageVar) >=70){
            this.gradeVar = 'B';
        console.log('B Grade');
        }
        else if(parseInt(this.percentageVar) <70 || parseInt(this.percentageVar) >=60){
            this.gradeVar = 'C';
        console.log('C Grade');
        }
        else if(parseInt(this.percentageVar) <60 || parseInt(this.percentageVar) >=50){
            this.gradeVar = 'D';
        console.log('D Grade');
        }
        else if(parseInt(this.percentageVar) <50 || parseInt(this.percentageVar) >=40){
            this.gradeVar = 'E+';
        console.log('E Grade');
        }
        else if(parseInt(this.percentageVar) <40 || parseInt(this.percentageVar) >=35){
            this.gradeVar = 'E';
        console.log('E Grade');
        }
        else if(parseInt(this.percentageVar) <35){
            this.gradeVar = 'F';
        console.log('F Grade');
        }
    }
        
    clear(event){
        this.teluguVar = null;
        this.hindiVar = null;
        this.englishVar = null;
        this.mathsVar = null;
        this.scienceVar = null;
        this.socialVar = null;
        this.totalVar = null;
        this.percentageVar = null;
        this.resultVar = null;
        this.gradeVar = null;
    }
}