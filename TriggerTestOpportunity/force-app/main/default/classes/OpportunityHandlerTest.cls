@isTest 
public with sharing class OpportunityHandlerTest {
    @isTest
    public static void updateDescriptionTest(){
        //Create data
        List<Opportunity> listOpp = new List<Opportunity>();
        for(Integer x =1; x <= 5; x++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Copado' + x;
            opp.CloseDate = Date.today().addDays(15);
            opp.StageName = 'Value Proposition';
            opp.Description = 'This is a Hot Opportunity';
            opp.Amount = 230000;

            listOpp.add(opp);
        }
        //Add data
        Test.startTest();
            insert listOpp;
        Test.stopTest();

        //Retrieve data
        List<Opportunity> lstOpportunity = [SELECT Id, Description FROM Opportunity WHERE Id =: listOpp[0].Id];

        //Compare data
        System.assertEquals('This is a Hot Opportunity', lstOpportunity[0].Description);
    }
    @isTest
    public static void populateLatestOppAmtTest(){
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();

        for(Integer x = 1; x <= 5; x++){
            Account acc = new Account();
            acc.Name = 'Test' + x;
            accList.add(acc);
        }
        insert accList;

        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = Date.today().addDays(23);
            opp.StageName = 'Value Proposition';
            opp.Amount = 230000;

            opp.AccountId = acc.Id;
            oppList.add(opp);
        }

        test.startTest();
        insert oppList;
        Test.stopTest();

        List<Account> lstAccount= [SELECT Id, Latest__c FROM Account WHERE Id =: accList[0].Id];

        system.assertEquals(oppList[0].Amount, lstAccount[0].Latest__c);
    }
}