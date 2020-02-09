public Class ContactTriggerHandler{

    
    /* ************************************************************************************************************
    Method Name: handleAfterInsertUpdate
    Input Parameters: Trigger.new
    Return Type: NA
    Method Description: This Method is used to handle the logic after the DML operation (Insert & Undelete) on Contact object and updates
                        related Account object by passing set of Account Id as a parameter to updateAccountFields function .    
    *************************************************************************************************************** */
    public static void handleAfterInsert(List<Contact> TriggerNew){
    
        Set<Id> conIds = new Set<Id>();
        for(Contact con : TriggerNew){
            if(con.Email== null || con.Email==''){
                con.addError('Enter Email');
            }
        }     
     }
  }