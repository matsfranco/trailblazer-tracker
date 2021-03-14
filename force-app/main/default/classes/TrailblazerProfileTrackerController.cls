public with sharing class TrailblazerProfileTrackerController {
    
    public static void updateContactWithProfileCounts(String profile, TrailblazerProfileCounts profileCounts) {
       
        Contact trailblazerContact = findRelatedContact(profile);

        createNewProfileStatusRecord(trailblazerContact,profileCounts);

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

    public static void updateContactWithCertifications(String profile, List<TrailblazerCertification> certificationList) {
        Contact trailblazerContact = findRelatedContact(profile);

        upsertCertificationListRecords(trailblazerContact, certificationList);
    }

    public static void upsertCertificationListRecords(Contact trailblazerContact, List<TrailblazerCertification> certifications) {

        List<TrailblazerCertification__c> certificationsToUpsert = new List<TrailblazerCertification__c>();

        for(TrailblazerCertification certification : certifications) {
            TrailblazerCertification__c newCert = new TrailblazerCertification__c();
            newCert.Name = certification.title;
            newCert.Key__c = trailblazerContact.TrailblazerId__c + '/' + certification.dateCompleted + '/' + certification.title;
            newCert.Description__c = certification.description;
            newCert.IssueDate__c = getDateFromString(certification.dateCompleted);
            newCert.ExpiredAt__c = getDateFromString(certification.dateExpired);
            newCert.CertificationUrl__c = certification.certificationUrl;
            newCert.Status__c = certification.certificationStatus;
            newCert.CertificationImageUrl__c = certification.certificationImageUrl;
            newCert.Contact__c = trailblazerContact.Id;
            certificationsToUpsert.add(newCert);
        }

        upsert certificationsToUpsert  Key__c;

    }

    public static Date getDateFromString(String sdate) {
        List<String> sDateSplited = sdate.split('-');
        if(sDateSplited.size() == 3) {
            Integer year    = Integer.valueOf(sDateSplited[0]);
            Integer month   = Integer.valueOf(sDateSplited[1]);
            Integer day     = Integer.valueOf(sDateSplited[2]);
            return Date.newInstance(year,month,day);
        } else {
            return null;
        } 
    }


}