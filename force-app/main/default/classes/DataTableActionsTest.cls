/*******************************************************************************************
* @Name         DataTableActionsTest 
* @Author       Vipeen Bhede
* @Date         26-09-2022
* @Description  This class contains all service methods test 
*******************************************************************************************/
/* MODIFICATION LOG
* Version          Developer              Date               Description
*-------------------------------------------------------------------------------------------
*  1.0              Vipeen Bhede        26-09-2022          Initial Creation                                                      
*******************************************************************************************/
@isTest
public class DataTableActionsTest {
    /**************************************************************************************
    * @Description  This method test the apex service
    * @Example     
    **************************************************************************************/ 
    @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new HttpMockClass());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        
        String actualValue = DataTableActions.getJSONData();
        String expectedValue = '[  {    "id": 1,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 1363.00  },  {    "id": 2,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 2763.00  },  {    "id": 3,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 429.00  },  {    "id": 4,    "creditorName": "AMEX",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 1363.00  },  {    "id": 5,    "creditorName": "DISCOVERBANK",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 2.00,    "balance": 2644.00  },  {    "id": 6,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 5464.00  },  {    "id": 7,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 2345.00  },  {    "id": 8,    "creditorName": "CAPITAL ONE",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 4.00,    "balance": 836.00  },  {    "id": 9,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 3.50,    "balance": 687.00  },  {    "id": 10,    "creditorName": "CBNA",    "firstName": "Suman",    "lastName": "Tester79",    "minPaymentPercentage": 3.50,    "balance": 235.00  }]';
        System.assertEquals(actualValue, expectedValue);
    }
}
