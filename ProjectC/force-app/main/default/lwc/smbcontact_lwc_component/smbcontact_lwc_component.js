import { LightningElement, api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class smbcontact_lwc_component extends LightningElement {
  fnameVar = null;
  lnameVar = null;

  @api
  acntid;

  collectinput(event) {
    const input = event.target.name;
    if (input === 'firstname') {
      this.fnameVar = event.target.value;
    } else if (input === 'lastname') {
      this.lnameVar = event.target.value;
    }
  }

  // eslint-disable-next-line no-unused-vars
  tosavecontactaction(event) {
    const fields = {
      'LastName': this.lnameVar,
      'FirstName': this.fnameVar,
      'AccountId': this.acntid
    }
    const contactinput = { apiName: 'Contact', fields };
    createRecord(contactinput).then(response => {
      console.log('Record Saved Successfully: ' + response.Id);
      // eslint-disable-next-line @lwc/lwc/no-api-reassignments
      //this.acntid = response.id;
    }).catch(error => {
      console.log('ERROR: Contact record is not created' + error.body.message);
    });
  }
}