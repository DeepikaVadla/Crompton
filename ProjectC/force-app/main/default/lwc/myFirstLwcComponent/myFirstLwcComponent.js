import { LightningElement } from 'lwc';

export default class MyFirstLwcComponent extends LightningElement {
personName = 'Deepika.V';
address;

connectedCallBack(event){
    this.address = 'Hyd';

}

}