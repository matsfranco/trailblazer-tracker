public with sharing class TrailblazerProfileTrackerController {
    
    public static void updateContactWithProfileCounts(String profile, TrailblazerProfileCounts profileCounts) {
       
        Contact trailblazerContact = findRelatedContact(profile);

        System.debug(createNewProfileStatusRecord(trailblazerContact,profileCounts));

    }

    public static Contact findRelatedContact(String profile) {
        List<Contact> relatedContacts = [SELECT Id,FirstName,TrailblazerId__c FROM Contact WHERE TrailblazerId__c =: profile];
        return relatedContacts != null ? relatedContacts[0] : null;
    } 

    public static String createNewProfileStatusRecord(Contact c, TrailblazerProfileCounts counts) {
        TrailblazerProfileStatus__c newProfileStatus = new TrailblazerProfileStatus__c();
        newProfileStatus.Name = c.FirstName + ' ('+c.TrailblazerId__c+') '+' - '+Date.Today();
        newProfileStatus.Contact__c = c.Id;
        newProfileStatus.StatusDate__c = Date.Today();
        newProfileStatus.Rank__c = counts.RankLabel;
        newProfileStatus.RankImageUrl__c = counts.RankImageUrl;
        newProfileStatus.TotalCompletedTrails__c = counts.CompletedTrailTotal;
        newProfileStatus.TotalEarnedBadges__c = counts.EarnedBadgeTotal;
        newProfileStatus.TotalEarnedPoints__c = counts.EarnedPointTotal;
        newProfileStatus.BadgesForNextRank__c = counts.BadgeTotalForNextRank;
        newProfileStatus.PointsForNextRank__c = counts.PointTotalForNextRank;
        insert(newProfileStatus);

        c.Rank__c = counts.RankLabel;
        c.RankImageUrl__c = counts.RankImageUrl;
        update(c);

        return 'New status '+ newProfileStatus.Name + 'created for '+c.TrailblazerId__c+'!!';
    }



}