trigger Casetrigger on Case (after insert, after update, after undelete) {
 List<Account> accounts = new List<Account>();
   
   Set<Id> caseid = new Set<Id>();
   
   if(Trigger.isDelete) {
     for(Case c:Trigger.Old) {
      
        caseid.add(c.AccountId);   
    
     }   
   
   }
   else
   if(Trigger.isUpdate) {

     for(case c:Trigger.New) {
      
        caseid.add(c.AccountId);   
    
     }

     for(case c:Trigger.Old) {
      
        caseid.add(c.AccountId);   
    
     }   
   
   }
   else
   {
     for(Case c:Trigger.New) {
      
        caseid.add(c.AccountId);   
    
     }
   }
   
   AggregateResult[] groupedResults = [SELECT COUNT(Id), Accountid FROM case where AccountId IN :caseId GROUP BY Accountid ];
   
   for(AggregateResult ar:groupedResults) {
     
     Id custid = (ID)ar.get('AccountId');
     
     Integer count = (INTEGER)ar.get('expr0');
     
     Account cust1 = new Account(Id=custid);
     
     cust1.Case_Count__c = count;
     
     accounts.add(cust1);
      
   }
   
   
   update accounts;

}