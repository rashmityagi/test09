trigger ContactTrigger on Contact (after insert) {
    
    if(Trigger.isAfter)
        if(Trigger.isInsert){
            ContactTriggerHandler.handleAfterInsert(Trigger.new);
        }
}