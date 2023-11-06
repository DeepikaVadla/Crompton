import { LightningElement,wire} from 'lwc';
import demoShowMe from '@salesforce/apex/lwcApexClassController.demoShowMe';
import demoDisplayMe from '@salesforce/apex/lwcApexClassController.demoDisplayMe';

export default class ApexClassLwc extends LightningElement {

    @wire (demoShowMe) returnResultValue; 
    @wire (demoDisplayMe, {someInputdata : 'LWC component with parameter in apex class method. Dynamically passing the data'}) returnResultValue2;
}