import { LightningElement } from 'lwc';
import getCollection from '@salesforce/apex/CollectionController.getCollection';
export default class ImperativeBookSearch extends LightningElement {

    collections;
    error;
    handleClick(){
        getCollection().then((result) => {
            this.collections = result;
        }).catch((error)=>{
            this.error = error;
        })
    }
}