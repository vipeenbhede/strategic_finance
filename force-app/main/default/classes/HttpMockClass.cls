/*******************************************************************************************
* @Name         DataTableActionsTest 
* @Author       Vipeen Bhede
* @Date         26-09-2022
* @Description  This class contains all service methods test  Mockup
*******************************************************************************************/
/* MODIFICATION LOG
* Version          Developer              Date               Description
*-------------------------------------------------------------------------------------------
*  1.0              Vipeen Bhede        26-09-2022          Initial Creation                                                      
*******************************************************************************************/
@isTest
global class HttpMockClass implements HttpCalloutMock {
    /**************************************************************************************
    * @Description  This method create Mock Data to test the apex service
    * @Example     
    **************************************************************************************/ 
   // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        String debtBody = '[  {    "id": 1,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 1363.00  },  {    "id": 2,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 2763.00  },  {    "id": 3,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 429.00  },  {    "id": 4,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 1363.00  },  {    "id": 5,    "creditorName": "DISCOVERBANK",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 2644.00  },  {    "id": 6,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 5464.00  },  {    "id": 7,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 2345.00  },  {    "id": 8,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 836.00  },  {    "id": 9,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 3.50,    "balance": 687.00  },  {    "id": 10,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 3.50,    "balance": 235.00  }]';
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://raw.githubusercontent.com/StrategicFS/Recruitment/master/data.json', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(debtBody);
        res.setStatusCode(200);
        return res;
    }
}
