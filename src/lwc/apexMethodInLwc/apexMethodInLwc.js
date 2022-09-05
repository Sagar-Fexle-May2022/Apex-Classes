import { LightningElement } from 'lwc';
import methodOne from '@salesforce/apex/MethodList.getTextMethod1';
import methodTwo from '@salesforce/apex/MethodList.getTextMethod2';
import methodThree from '@salesforce/apex/MethodList.getTextMethod3';

export default class ApexMethodInLwc extends LightningElement {
    statusOne;
    statusTwo;
    statusThree;

    One(){
        methodOne()
            .then(result => {
                this.statusOne = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

    Two(){
        methodOne()
            .then(result => {
                this.statusOne = result;
            })
        methodTwo()
            .then(result => {
                this.statusTwo = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

    Three(){
        methodOne()
            .then(result => {
                this.statusOne = result;
            })
        methodTwo()
            .then(result => {
                this.statusTwo = result;
            })
        methodThree()
            .then(result => {
                this.statusThree = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
    
}