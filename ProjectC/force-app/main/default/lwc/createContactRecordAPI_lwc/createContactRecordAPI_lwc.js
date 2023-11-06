import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateContactRecordAPI_lwc extends LightningElement {
    //to hold the field data create variable w.r.t its fieldnames
    lastNameVar = null;
    firstNameVar = null;
    birthDateVar = null;
    emailVar = null;
    phoneVar = null;

    handleSubmitAction(event){
        const fields = {
            //write the API name of object
            'LastName':this.lastNameVar,
            'FirstName':this.firstNameVar,
            'Email':this.emailVar,
            'Phone':this.phoneVar,
            'BirthDate':this.birthdateVar
        }

        const recordData = {apiName:'Contact', fields};
        createRecord(recordData).then(response=>{
            alert('Record Saved Success');
        }).catch(error=>{
            alert('Error - Record Saved Failed'+error.body.message);
        });
    }

    
    getInputData(event){
        const inputData = event.target.name;
        if(inputData == 'lastName'){
            this.lastNameVar = event.target.value;
        }else if(inputData == 'firstName'){
            this.firstNameVar = event.target.value;
        }else if(inputData == 'birthDate'){
            this.birthDateVar = event.target.value;
        }else if(inputData == 'email'){
            this.emailVar = event.target.value;
        }else if(inputData == 'phone'){
            this.phoneVar = event.target.value;
        }
    }
}