public with sharing class ContactListCtrl {
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [Select id, Name from Contact where AccountId!=null];
        
    }
 
    @AuraEnabled
    public static void createRecord(Contact newCon){
        insert newCon;
        System.debug('Contact @@'+newcon);
        
    }
}