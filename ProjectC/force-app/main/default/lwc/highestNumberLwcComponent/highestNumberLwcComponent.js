import { LightningElement } from 'lwc';
    export default class HighestNumberLwcComponent extends LightningElement {
    firstInputVar = null;
    secondInputVar = null;
    thirdInputVar = null;

    /*
    //Method-1 
    firstInputCapture(event){
        this.firstInputVar = event.target.value;
        console.log('input One:' +this.firstInputVar);}
    //Method-2
    secondInputCapture(event){
        this.secondInputVar = event.target.value;
        console.log('input One:' +this.secondInputVar);}
    //Method-3
    thirdInputCapture(event){
        this.thirdInputVar = event.target.value;
        console.log('input One:' +this.thirdInputVar);}*/
    //Method-4
    capture(event){
        let inputVar = event.target.name;
        if(inputVar == 'First name'){
            this.firstInputVar = event.target.value;
            console.log('input One:' +this.firstInputVar);
        }
        if(inputVar == 'Second name'){
            this.secondInputVar = event.target.value;
            console.log('input One:' +this.secondInputVar);
        }
        if(inputVar == 'Third name'){
            this.thirdInputVar = event.target.value;
            console.log('input One:' +this.thirdInputVar);
        }
    }
    //Method-5
    calculateResults(event){
    const numberOneVar = parseInt(this.firstInputVar);
    const numberTwoVar = parseInt(this.secondInputVar);
    const numberThreeVar = parseInt(this.thirdInputVar);
    if(numberOneVar > numberTwoVar && numberOneVar > numberThreeVar){
    //console.log('First Number is the greatest among other numbers');
    alert('First Number is the greatest among other numbers');
    }
    else if(numberTwoVar > numberOneVar && numberTwoVar > numberThreeVar){
    //console.log('Second Number is the greatest among other numbers');
    alert('Second Number is the greatest among other numbers');
    }
    else if(numberThreeVar > numberOneVar && numberThreeVar > numberTwoVar){
    //console.log('Third Number is the greatest among other numbers');
    alert('Third Number is the greatest among other numbers');
    }
    }
    //Method-6
    reset(event){
        this.firstInputVar = null;
        this.secondInputVar = null;
        this.thirdInputVar = null;
        this.handleloop();
    }
    //Method-7    
    handleloop(){
        let i = 0;
        while(i<3){
        console.log('The _i_ value is: '+i);
        i++;
        }
        let j = 3;
        do{console.log('The _j_ value is: '+j);
        j++;
        }
        while(j<6);
        for(let k = 6; k<11; k++){
            console.log('The _k_ value is: '+k);
        }
    }
}