trigger OpportunityTrigger on Opportunity (after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            OpportunityHandler.updateDescription(Trigger.new);
        }else if(Trigger.isAfter){
            OpportunityHandler.populateLatestOppAmt(Trigger.new);
        }
    }
}