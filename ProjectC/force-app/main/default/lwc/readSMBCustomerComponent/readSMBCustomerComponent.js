import { LightningElement,wire,api } from 'lwc';
import doGetSMBCustomer from '@salesforce/apex/SmbCustomersLwcController.doGetSMBCustomer';

export default class readSMBCustomerComponent extends LightningElement {

    @api recordId;

        acntName = null;
        acntNumber = null;
        acntPhone = null;
        acntIndustry = null;
        isToShow = false;
   
   @wire(doGetSMBCustomer, { acntId: '$recordId' })
      returnAcntResult({ error, data }) {
          if (data) {
              console.log('Data', data);
              this.acntName = data.Name;
              this.acntNumber = data.AccountNumber;
              this.acntPhone = data.Phone;
              this.acntIndustry = data.Industry;
              this.isToShow = true;
          } else if (error) {
              console.error('Error:', error);
          }
      }

}