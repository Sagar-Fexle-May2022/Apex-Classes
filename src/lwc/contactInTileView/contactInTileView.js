import { LightningElement, api } from 'lwc';
import getContactInTileView from '@salesforce/apex/FetchingContactRecords.getContactInTileView';
export default class ContactInTitleView extends LightningElement {
    //To expose a public method, decorate it with @api
    @api flexipageRegionWidth;
    contacts;
	columnSize;
    tileSize;
	renderedCallback() {
        this.columnSize = this.flexipageRegionWidth;
        if(this.columnSize === 'LARGE') {
            this.tileSize = 3;
        }
        if(this.columnSize === 'MEDIUM') {
            this.tileSize = 4;
        }
        if(this.columnSize === 'SMALL') {
            this.tileSize = 6;
        }
    }
    connectedCallback(){
		this.loadContact();
	}
	loadContact(){
        getContactInTileView()
		.then(result => {
		    this.contacts = result;
		})
	}
}