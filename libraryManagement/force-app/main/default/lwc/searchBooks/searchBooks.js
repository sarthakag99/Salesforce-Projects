import { api, LightningElement, wire } from 'lwc';
import getCollectionByTitle from '@salesforce/apex/CollectionController.getCollectionByTitle';

export default class SearchBooks extends LightningElement {
    
    bookTitle;
    
    @wire(getCollectionByTitle,{bookTitle : '$bookTitle'})
    collections;

    handleChange(event){
        //alert('hi');
        this.bookTitle = event.target.value;
    }
}