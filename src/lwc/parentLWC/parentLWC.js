import { LightningElement,track } from 'lwc';

export default class ParentLWC extends LightningElement {
    @track progressValue = 0;
    hanldeProgressValueChange(event) {
        this.progressValue = event.detail;
    }
}