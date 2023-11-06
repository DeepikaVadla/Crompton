import { LightningElement } from 'lwc';
import doGetSMBCustomersList from '@salesforce/apex/SmbCustomersLwcController.doGetSMBCustomersList';
const columns = [
    { label: 'SMB Customer Name', fieldName: 'Name', type: 'text' },
    { label: 'Account Number', fieldName: 'AccountNumber', type: 'text' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];
export default class GetSMBCustomerTableOnClick extends LightningElement {

    smbAccountsList = null;
    columns = columns;
    
    getSMBCustomersListAction(event){
        doGetSMBCustomersList().then(result => {
        this.smbAccountsList = result;
        }).catch(error => {
            //used to handle Error
            console.log('Error while fetching data', error);
        });
    }


}