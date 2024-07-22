import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import retrieveAndUpdateNPI from '@salesforce/apex/NPIRetrieveController.retrieveAndUpdateNPI';
import { updateRecord } from 'lightning/uiRecordApi';

export default class NpiRetrieve extends LightningElement {
    loading = true;
    error;
    _recordId;

    @api set recordId(value) {
        this._recordId = value;
    }
    
    get recordId() {
        return this._recordId;
    }
    
    @api async invoke() {
        try {
            await retrieveAndUpdateNPI({ recordId: this.recordId });
            console.log('retrieved...');
            updateRecord({ fields: { Id: this.recordId } });
            console.log('refreshed.');
            this.error = undefined;
        } catch (error) {
            this.error = error;
        }
    }

}