trigger OpportunityHandler on Opportunity (before delete) {

    PreventDeletionOfOppWithClosedWon.PreventDeletion(Trigger.old);
}