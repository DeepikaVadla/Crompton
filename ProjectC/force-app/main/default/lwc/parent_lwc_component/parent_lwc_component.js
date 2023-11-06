import { LightningElement,api } from 'lwc';
export default class Parent_lwc_component extends LightningElement {

    @api
    publishparentvarmessage = 'This is Parent component message'

    istoShow = false;
    ShowChildComponent(event){
        this.istoShow=true;
    }

}