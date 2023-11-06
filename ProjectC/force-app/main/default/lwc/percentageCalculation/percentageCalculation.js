import { LightningElement } from 'lwc';
export default class PercentageCalculation extends LightningElement {

    marksScored = null;
    totalMarks = null;
    percentageVar = null;
    isTrue = false;
    fetchInputData(event){
        let inputName = event.target.name;
        if(inputName == 'Marks Scored'){
            this.marksScored = event.target.value;
        }else if(inputName == 'Total Numbers'){
            this.totalMarks = event.target.value;
        }
    }
    calculatePercentage(event){
        this.percentageVar = (this.marksScored / this.totalMarks) * 100;
        console.log('The Percentage is: '+this.percentageVar);
       this.isTrue = true;
    }
    reset(event){
        this.marksScored = null;
        this.totalMarks = null;
        this.percentageVar = null;
    }
}