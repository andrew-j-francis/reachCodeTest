import { LightningElement, api } from 'lwc';

export default class ApplicationProcessOfferPresentation extends LightningElement {
    headers = [
        {
            label: 'Term (Months)',
            field: 'termInMonths'
        },
        {
            label: 'Interest Rate Percentage',
            field: 'interestRatePercentage',
        },
        {
            label: 'Monthly Payment',
            field: 'monthlyPayment'
        }
    ];

    @api loanData = "";

    tableData = "";

    connectedCallback(){
        this.tableData = Json.parse(this.loanData);
    }




}