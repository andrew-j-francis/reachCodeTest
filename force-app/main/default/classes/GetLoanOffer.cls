public with sharing class GetLoanOffer {

    /*

    During the application process, the borrower should be presented with pricing that is pulled directly from this external API:

    https://raw.githubusercontent.com/ReachFinancial/salesforce-code-challenge/main/assets/data/reach-sample-api-response.json

    Use this class as a starting point for your callout.

    * Consider how this will be triggered, and how the data will flow back to the rest of the process
    * Consider best practices when calling out to 3rd parties from within Salesforce

    */

    public GetLoanOffer() {
        //
    }

    @InvocableMethod(label='Get Offer' description='Grabs an offer from our off-platform offer engine.' category='Application')
    public static List<String> getLoanOfferFromOfferService(List<Account> account) {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://raw.githubusercontent.com/ReachFinancial/salesforce-code-challenge/main/assets/data/reach-sample-api-response.json');
        request.setMethod('GET');

        HttpResponse response = new HttpResponse();
        try{
            response = http.send(request);
        }catch(CalloutException e){
            //write to debug object
            return new List<String>();
        }

        Map<String, Object> desrializedResponse = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        Map<String, Object> status = (Map<String, Object>)desrializedResponse.get('status');

        if(status?.get('code') != '000'){
            return new List<String>();
        } else{
            List<String> offerResponse = new List<String>();
            String offerObject = Json.serialize(desrializedResponse.get('offers'));
            offerResponse.add(offerObject);
            return offerResponse;
        }


    }
}