global class CreditCheckRequest {
    @InvocableMethod (label='Credit Check Request'
     Description='Used to check the credit of a customer')
    global static void CreditCheck(List<Account> accounts) {
        for (Account a: accounts){
            callCreditCheckAPI(a.Id);
        }
    }

    @future (callout=true)
    public static void callCreditCheckAPI(String accountId) {
        Account a = [SELECT Id,
                            Name,
                            Owner.Name,
                            Owner.Email
                    FROM Account
                    WHERE ID = :accountId
                    LIMIT 1];
    String url = 'https://splx201-developer-edition.na124.force.com/creditcheck';

    url += '?name=' + EncodingUtil.urlEncode(a.Name, 'UTF-8')
            + '&email=' + a.Owner.Email
            + '&requestor=' + EncodingUtil.urlEncode(a.Owner.Name, 'UTF-8');
    system.debug(url);

    Http h = new Http();

    HttpRequest req = new HttpRequest();
    req.SetEndPoint(url);
    req.setMethod('GET');

    HttpResponse res = h.send(req);

    system.debug(res.getBody());

    CreditCheckInfo__e cciEvent = new CreditCheckInfo__e();
    ccievent.Account_Name__c = a.Name;
    cciEvent.Approved__c = true;

    Database.SaveResult result = EventBus.publish(cciEvent);
        }

}
