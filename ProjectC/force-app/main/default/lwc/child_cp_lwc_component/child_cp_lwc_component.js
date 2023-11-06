import { LightningElement } from 'lwc';

export default class Child_cp_lwc_component extends LightningElement {
  varfromchild = 'This is the message from child CompositionEvent';
  handleclick() {
    //to pass the data from child to parent component use the lwc:customEvent - this.dispatchEvent(customEvent)
    const customEvent = new CustomEvent('childeventname', {
      detail: {
        message: this.varfromchild
      }
    })
    this.dispatchEvent(customEvent);
    //we can also write the above code in single line as below
    //this.dispatchEvent(new CustomEvent('childeventName', {detail:{message:this.varfromchild}}));
  }
}