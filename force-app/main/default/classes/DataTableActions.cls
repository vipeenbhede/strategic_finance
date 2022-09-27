/*******************************************************************************************
* @Name         DataTableActions 
* @Author       Vipeen Bhede
* @Date         26-09-2022
* @Description  This class contains all service methods to get endpoint data
*******************************************************************************************/
/* MODIFICATION LOG
* Version          Developer              Date               Description
*-------------------------------------------------------------------------------------------
*  1.0              Vipeen Bhede        26-09-2022          Initial Creation                                                      
*******************************************************************************************/
public with sharing class DataTableActions {  

    static final String ENDPOINT_URL = 'https://raw.githubusercontent.com/StrategicFS/Recruitment/master/data.json';

    /**************************************************************************************
    * @Description  This method gets Debts data from external application
    * @Return       Json String - Value retrieved from external application 
    * @Example     
    **************************************************************************************/ 
    @AuraEnabled(cacheable=true) 
    public static String getJSONData() {
        String json;
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        // set the method
        req.setMethod('GET');
        // generate the url for the request
        // and add the endpoint to the request
        req.setEndpoint(ENDPOINT_URL);
        // create the response object
        HTTPResponse resp = http.send(req);
        json = resp.getBody().replace('\n', '');
        system.debug('JSON STRING   '+json);
        return json;       
    }         
 
}

