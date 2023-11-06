import { LightningElement, wire, api } from 'lwc';
import doGetContact from '@salesforce/apex/SMBcontactsControllerApex.doGetContact';

import { updateRecord} from 'lightning/uiRecordApi';

import CONTACT_FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_LAST_NAME from '@salesforce/schema/Contact.LastName';
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone';
import CONTACT_ID from '@salesforce/schema/Contact.Id';


export default class Smb_contact_update_recordAPI_lwc extends LightningElement {

    @api recordId;
    contactVar;
    firstName = null;
    lastName = null;
    phone = null;
    

    @wire(doGetContact, { recId: '$recordId' })
    wiredData({ error, data }) {
      if (data) {
        console.log('Data', JSON.stringify(data));
        this.firstName = data.FirstName;
        this.lastName = data.LastName;
        this.phone = data.Phone;

      } else if (error) {
         console.error('Error:', error);
      }
    }

    captureInputs(event){
        const name = event.target.name;
        if(name == 'fName'){
            this.firstName = event.target.value;
        }else if(name == 'lName'){
            this.lastName = event.target.value;
        }else if (name == 'phone'){
            this.phone = event.target.value;
        }
    }

    updateContactAction(event){

            const fields ={};
            fields[CONTACT_ID.fieldApiName] = this.recordId;
            fields[CONTACT_FIRST_NAME.fieldApiName] = this.firstName;
            fields[CONTACT_LAST_NAME.fieldApiName] =  this.lastName;
            fields[CONTACT_PHONE.fieldApiName] = this.phone;

            const recordInput = {fields};
            updateRecord(recordInput).then(response=>{
                    alert('contact updated');
            }).catch(error=>{
                    alert('contact NOT updated');
            });
    }

}