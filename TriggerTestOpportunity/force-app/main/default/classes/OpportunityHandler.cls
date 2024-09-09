public with sharing class OpportunityHandler {
    public static void updateDescription(List<Opportunity> oppList){
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.Amount != null && opp.Amount >= 100000 && opp.Amount <= 500000){
                    opp.Description = 'This is a Hot Opportunity';
                }
            }
        }
    }

    //When an Opportunity is created on any Account, put the latest opportunity Amount on the Account in the Latest Opportunity Amount field
    public static void populateLatestOppAmt(List<Opportunity> oppList){
        if(!oppList.isEmpty()){
            List<Account> accList = new List<Account>();
            for(Opportunity opp : oppList){
                if(opp.Amount != null && opp.AccountId != null){
                    Account acc = new Account();
                    acc.Id = opp.AccountId;
                    acc.Latest__c = opp.Amount;
                    accList.add(acc);
                }
            }
            if(!accList.isEmpty()){
                update accList;
            }
        }
    }
}