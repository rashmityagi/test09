public with sharing class MWTAccountControler {
    
    @auraEnabled
    public static List<Account> showAccounts(){
       return [Select id, Name, BillingStreet from Account limit 10];
    }

}