import { LightningElement } from 'lwc';
export default class MySecondLwcComponent extends LightningElement {
    personName = 'Raghu';
    address;
    sometext = '';
    someDate = '';

    connectedCallback() {
        this.address = 'KPHB';
    }

    handleOnchange(event){
        this.sometext = event.target.value;        
    }
    handleOnchange1(event){        
        this.someDate = event.target.value;
    }

}