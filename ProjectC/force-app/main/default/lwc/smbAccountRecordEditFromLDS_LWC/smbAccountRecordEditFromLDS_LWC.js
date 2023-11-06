import { LightningElement } from 'lwc';
export default class SmbAccountRecordEditFromLDS_LWC extends LightningElement {

    resetAction(event){
        const currentElementFields = this.template.querySelectorAll('lightning-input-field');
        currentElementFields.forEach(field => {
            field.reset();
        });
    }

    handleOnSubmitAction(event){
        console.log('Verification On Submit');
        event.preventDefault();
        const fields = event.detail.fields;

        fields.Name = fields.Name + ' Prevent Default Save';
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

}