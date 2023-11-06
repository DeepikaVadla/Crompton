import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
  result = '';

  handleButtonClick(event) {
    this.result += event.target.value;
  }

  calculate() {
    try {
      this.result = eval(this.result);
    } catch (error) {
      this.result = 'Error';
    }
  }

  reset() {
    this.result = '';
  }
}