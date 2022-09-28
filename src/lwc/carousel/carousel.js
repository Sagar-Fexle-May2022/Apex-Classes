import { LightningElement } from 'lwc';
import TH_CHAR from "@salesforce/resourceUrl/TrailHead_Character"

export default class Carousel extends LightningElement {
    thCharImg 
    calledOnce = false

    renderedCallback(){

        if(!this.calledOnce){//Let thishook run only once
            this.calledOnce = true
            this.template.querySelectorAll("lightning-button").forEach((btnEle)=>{
                btnEle.addEventListener("mouseover", (event)=>{
                    this.thCharImg = `${TH_CHAR}/Image/${event.target.label}.png`//(`) Template Literals
                })
            })
        }
    }
}