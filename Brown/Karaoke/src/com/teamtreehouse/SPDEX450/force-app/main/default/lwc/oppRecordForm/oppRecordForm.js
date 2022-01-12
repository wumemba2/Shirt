import { LightningElement, api } from 'lwc';

export default class OppRecordForm extends LightningElement {

    @api recordId;
    @api formMode = 'readonly';
    @api layoutType = 'Compact';
    @api objectApiName;

    handleCancel(event) {
       this.dispatchEvent(new CustomEvent('cancel')); 
    }

    handleSuccess(event) {
        this.dispatchEvent(new CustomEvent('save')); 
     }
}
