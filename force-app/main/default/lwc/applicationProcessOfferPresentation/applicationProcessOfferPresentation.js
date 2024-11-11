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
    @api application;
    tableData = "";
    isApproved = true;

    connectedCallback(){
        this.tableData = Json.parse(this.loanData);

        console.log(this.loanData);

        calculateApproval();
    }

    calculateApproval(){
        let totalLoanAmount = this.tableData.termInMonths * this.tableData.monthlyPayment;


        if(totalLoanAmount < 10000 || totalLoanAmount > 50000){
            this.isApproved = false;
        }

        if (application.Total_Lines_Of_Credit__c < 10){
            this.tableData.termInMonths = 36;
            this.tableData.interestRatePercentage = 10;
        }
    }








}