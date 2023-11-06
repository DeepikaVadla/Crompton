import { LightningElement } from 'lwc';

export default class Parent_cp_lwc_component extends LightningElement {
  receiveVar = null;

  handlecustomeventaction(event) {
    const info = event.detail;
    this.receiveVar = info.message;
  }
}