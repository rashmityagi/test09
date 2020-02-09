public class AccountsController {
public List<Account> accList{get;set;}

public AccountsController(){
    accList = new List<Account>();
   // accList =getAccountList();
}
  @AuraEnabled
  public static List<Account> getAccounts() {
     return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone
    FROM Account ORDER BY createdDate ASC];
  }
  
  public pagereference getAccountList() {
   accList = [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone
    FROM Account ORDER BY createdDate ASC ];
    System.debug('In accList >>');
     System.debug('accList >>'+accList );
    return null;
   
  }
}