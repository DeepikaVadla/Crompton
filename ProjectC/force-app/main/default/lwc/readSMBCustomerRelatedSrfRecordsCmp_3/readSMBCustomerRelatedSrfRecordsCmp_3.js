import { LightningElement, wire, api } from 'lwc';
import relatedSRFs from '@salesforce/apex/SmbCustomersLwcController.relatedSRFs';

export default class ReadSMBCustomerRelatedSrfRecordsCmp_3 extends LightningElement {
@api recordId;
listOfSrfs = null;


@wire(relatedSRFs, {acntId: '$recordId'})
srfData({ error, data }) {
  if (data) {
    console.log('Data', data);
    this.listOfSrfs = data;
  } else if (error) {
    console.error('Error:', error);
  }
}

}