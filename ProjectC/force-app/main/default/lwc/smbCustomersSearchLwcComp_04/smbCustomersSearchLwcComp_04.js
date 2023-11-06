import { LightningElement,wire } from 'lwc';
import getAccountRecords from '@salesforce/apex/SmbCustomersLwcController.getAccountRecords';

export default class SmbCustomersSearchLwcComp_04 extends LightningElement {

    searchKeyvalue = null;
    @wire(getAccountRecords, { searchKey: '$searchKeyvalue' }) receivedwiredSmbAccounts;
    
    searchKeyAction(event){
            this.searchKeyvalue = event.target.value;
    }
}