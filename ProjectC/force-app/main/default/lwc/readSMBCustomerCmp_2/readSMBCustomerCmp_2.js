import { LightningElement,wire } from 'lwc';
import doGetSMBCustomersList from '@salesforce/apex/SmbCustomersLwcController.doGetSMBCustomersList';

const columns = [
    { label: 'SMB Customer Name', fieldName: 'Name', type: 'text' },
    { label: 'Account Number', fieldName: 'AccountNumber', type: 'text' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];

export default class ReadSMBCustomerCmp_2 extends LightningElement {

    ListofAccounts = null;
    columns = columns;

    @wire(doGetSMBCustomersList)
    accounts({ error, data }) {
      if (data) {
        console.log('Data', data);
        this.ListofAccounts = data;
      } else if (error) {
        console.error('Error:', error);
      }
    }
}