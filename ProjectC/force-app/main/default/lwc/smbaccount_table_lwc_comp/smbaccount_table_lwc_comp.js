import { LightningElement, wire } from 'lwc';
import doGetSMBCustomersList from '@salesforce/apex/SmbCustomersLwcController.doGetSMBCustomersList';
import { refreshApex } from '@salesforce/apex';

const columns = [
  { label: 'Name', fieldName: 'Name', type: 'text' },
  { label: 'AccountNumber', fieldName: 'AccountNumber', type: 'text' },
  { label: 'Phone', fieldName: 'Phone', type: 'Phone' },
  { label: 'Industry', fieldName: 'Industry', type: 'text' },
  { label: 'Active', fieldName: 'Active', type: 'text' }
];

export default class Smbaccount_table_lwc_comp extends LightningElement {

  istocreate = false;

  @wire(doGetSMBCustomersList) accounts;
  columnsList = columns;

  createaccountrecord() {
    this.istocreate = true;
  }

  handlechildeventaction(event) {
    const flag = event.detail;
    if (flag) {
      refreshApex(this.accounts);
      this.istocreate = false;
    }
  }

}