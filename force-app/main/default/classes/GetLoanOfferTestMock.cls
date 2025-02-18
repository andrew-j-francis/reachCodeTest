@isTest
public with sharing class GetLoanOfferTestMock implements HttpCalloutMock{
    public static HttpResponse respond(HttpRequest request){
        String body = '{' +
    '"consumers": [' +
    '    {' +
    '        "firstName": "Damien",' +
    '        "lastName": "Lee",' +
    '        "middleName": null,' +
    '        "dob": "19710109",' +
    '        "SSN": "123456789",' +
    '        "clientId": "79011",' +
    '        "addressSourceBureauName": "EX",' +
    '        "addressMismatchIndicator": "Y",' +
    '        "bestMatchAddress": {' +
    '            "line1": "100, Main St",' +
    '            "line2": " ",' +
    '            "city": "Allen",' +
    '            "state": "Texas",' +
    '            "zipCode": "12345"' +
    '        }' +
    '    }' +
    '],' +
    '"offers": [' +
    '    {' +
    '        "termInMonths": 24,' +
    '        "interestRatePercentage": 50,' +
    '        "monthlyPayment": 500.00,' +
    '        "expirationDate": "20200330T1236K",' +
    '        "effectiveDate": "20200330T1236k",' +
    '        "finderNumber": "A12123123",' +
    '        "campaignId": "Aug_Campaign",' +
    '        "eligibilityFlag": "A",' +
    '        "tradeBaseDate": "20211020"' +
    '    }' +
    '],' +
    '"status": {' +
    '    "code": "000",' +
    '    "message": "Successful offer first time"' +
    '}' +
'}';
        HttpResponse response = new HttpResponse();
        response.setStatus('200');
        response.setBody(body);

        return response;
    }
}