public class NPIService {
    private static final String VERSION = '2.1';
    
    public static NPIResponseCleaner getNPIResults(String firstName, String lastName, String postalCode) {
        String endpoint = 'callout:NPI/?version='+VERSION;
        endpoint += '&first_name=' + encode(firstName);
        endpoint += '&last_name=' + encode(lastName);
        endpoint += '&postal_code=' + encode(postalCode);
        
        HTTPRequest req = buildRequest(endpoint);
        HTTPResponse res = new Http().send(req);
        System.debug('body: '+res.getBody());
        
        return NPIResponseCleaner.parse(res.getBody());
    }
    
    @TestVisible
    private static String encode(String input) {
        return EncodingUtil.urlEncode(input ?? '', 'UTF-8');
    }
    
    @TestVisible
    private static HTTPRequest buildRequest(String endpoint) {
        HTTPRequest req = new HTTPRequest();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        req.setHeader('Accept', 'application/json');
        return req;        
    }
}