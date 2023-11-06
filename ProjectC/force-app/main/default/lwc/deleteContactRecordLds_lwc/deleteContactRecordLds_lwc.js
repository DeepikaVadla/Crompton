import { LightningElement, api } from 'lwc';
import { deleteRecord  } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class DeleteContactRecordLds_lwc extends NavigationMixin(LightningElement) {

    @api recordId;
    @api objectApiName;
    
   
    performDeleteAction(event){
        deleteRecord(this.recordId).then(() =>{
           this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                    attributes: {
                            objectApiName: 'Contact',
                            actionName: 'home' 
                    },
            }); 
        }).catch(error=>{
            alert('Error message: ---'+error.body.message);
        }); 
    }
}