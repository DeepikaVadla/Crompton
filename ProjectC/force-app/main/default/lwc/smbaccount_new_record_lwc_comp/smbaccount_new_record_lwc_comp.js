import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class smbaccount_new_record_lwc_comp extends LightningElement {

  nameVar = null;
  accountnumberVar = null;
  phoneVar = null;
  smbcountryVar = null;
  smbstateVar = null;
  showchildcomp = false;

  collectinput(event) {
    const input = event.target.name;
    if (input === 'name') {
      this.nameVar = event.target.value;
    } else if (input === 'accountnumber') {
      this.accountnumberVar = event.target.value;
    } else if (input === 'phone') {
      this.phoneVar = event.target.value;
    } else if (input === 'smbcountry') {
      this.smbcountryVar = event.target.value;
    } else if (input === 'smbstate') {
      this.smbstateVar = event.target.value;
    }
  }

  // eslint-disable-next-line no-unused-vars
  tosaveaccountaction(event) {
    const fields = {
      'Name': this.nameVar,
      'AccountNumber': this.accountnumberVar,
      'Phone': this.phoneVar,
      'Country__c': this.smbcountryVar,
      'State__c': this.smbstateVar,
    }
    const inputrecorddata = { apiname: 'Account', fields };
    createRecord(inputrecorddata).then(response => {
      this.accountrecordid = response.id;
      this.showchildcomp = true;
      const customevent = new CustomEvent('refreshdata', {
        details: true
      })
      this.dispatchEvent(customevent);
    }).catch(error => {
      console.log('Error: The error is' + error.body.message);
    });
  }
}