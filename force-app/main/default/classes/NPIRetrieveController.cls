public with sharing class NPIRetrieveController {
    @AuraEnabled
    public static void retrieveAndUpdateNPI(Id recordId){
        try {
            Contact c = [select Id, FirstName, LastName, MailingPostalCode from Contact where Id = :recordId WITH USER_MODE];

            NPIResponseCleaner res = NPIService.getNPIResults(c.FirstName, c.LastName, c.MailingPostalCode);

            c.NPI__c = res?.results?.get(0)?.numberX;
            update c;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}