import { LightningElement,api } from 'lwc';

export default class FormToggle extends LightningElement {

    @api recordId;
    @api objectApiName;
    @api editMode = false;

    handleCancel(event){
        this.editMode = false;
    }

    handleSave(event){
        this.editMode = false;
    }

    handleChange(event){
        this.editMode = !this.editMode;
    }
}
