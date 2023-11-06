/* eslint-disable no-unused-vars */
import { LightningElement, api } from 'lwc'
import { createRecord } from 'lightning/uiRecordApi';

export default class ambcustomer_lwc_component extends LightningElement {

  nameVar = null;
  phoneVar = null;
  activeVar = null;
  countryVar = null;
  stateVar = null;
  showchildcomponent = false;

  @api
  acntrecid = null;

  collectionInput(event) {
    const input = event.target.name;
    if (input === 'name') {
      this.nameVar = event.target.value;
    } else if (input === 'phone') {
      this.phoneVar = event.target.value;
    } else if (input === 'active') {
      this.activeVar = event.target.value;
    } else if (input === 'country') {
      this.countryVar = event.target.value;
    } else if (input === 'state') {
      this.stateVar = event.target.value;
    }
  }
  createsmbaccount(event) {
    const fields = {
      'Name': this.nameVar,
      'Phone': this.phoneVar,
      'Active__c': this.activeVar,
      'Country__c': this.countryVar,
      'State__c': this.stateVar
    }
    const inputrecorddata = { apiName: 'Account', fields };
    createRecord(inputrecorddata).then(result => {
      console.log('Account record created');
      // eslint-disable-next-line @lwc/lwc/no-api-reassignments
      this.acntrecid = result.id;
      this.showchildcomponent = true;
    }).catch(error => {
      console.log('ERROR: ' + error.body.message);
    });
  }
}