import { LightningElement, wire, api } from 'lwc';
import relatedSRFs from '@salesforce/apex/SmbCustomersLwcController.relatedSRFs'

export default class SmbCustomersRelatedSRFsCmp_3 extends LightningElement {
@api recordId;
listOfSRFs = null;


@wire(relatedSRFs, {acntId: '$recordId'})
    srfData({ error, data }) {
        if (data) {
            console.log('Data', data);
            this.listOfSRFs = data;
        } else if (error) {
            console.error('Error:', error);
        }
    }
}