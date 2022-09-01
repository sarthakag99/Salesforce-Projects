import { api, LightningElement } from 'lwc';

export default class CollectionEditFormLds extends LightningElement {
    @api recordId;
    @api objectApiName;
}