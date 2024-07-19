import { LightningElement, api } from 'lwc';

export default class NpiRetrieve extends LightningElement {
    @api recordId;
    @api invoke() {
        console.log("Hi, I'm an action.",this.recordId);
    }
}