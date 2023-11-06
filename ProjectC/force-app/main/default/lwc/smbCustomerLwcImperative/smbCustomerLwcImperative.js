/* eslint-disable no-unused-vars */
import { LightningElement } from "lwc";
import doGetSMBCustomersList from "@salesforce/apex/SmbCustomersLwcController.doGetSMBCustomersList";

export default class SmbCustomerLwcImperative extends LightningElement {
  smbAccountsList = null;

  getSMBCustomerRecords(event) {
    doGetSMBCustomersList()
      .then((response) => {
        this.smbAccountsList = response;
      })
      .catch((error) => {
        //handle error here
        console.log("Error: ", error.body.message);
      });
  }
}
