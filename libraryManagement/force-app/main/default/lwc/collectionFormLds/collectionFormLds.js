import {api, LightningElement } from 'lwc';

export default class CollectionFormLds extends LightningElement {
    @api recordId;
    @api objectApiName;

    fields = ['Title__c','Rack__c','Copies__c','Price__c'];
}