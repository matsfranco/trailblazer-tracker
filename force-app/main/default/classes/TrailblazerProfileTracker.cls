public with sharing class TrailblazerProfileTracker {
    
    private String profile = '';
    private TrailblazerProfileCounts profileCounts;
    private List<TrailblazerCertification> profileCertifications;

    public TrailblazerProfileTracker(String profile) {
        this.profile = profile;
    }

    // Trailblazer Profile Counts - Trailhead
    public String getTrailblazerProfileCounts() {
        if(fetchProfileCounts()) {
            System.debug('success');
            TrailblazerProfileTrackerController.updateContactWithProfileCounts(this.profile, this.profileCounts);

            return 'Success';
        } else {
            System.debug('Fail');
            return 'Fail';
        }
    }
    
    public Boolean fetchProfileCounts() {

        this.profileCounts = TrailblazerProfileDataService.getTrailblazerProfileData(this.profile);
        if(this.profileCounts != null) {
            return true;
        } else {
            return false;
        }
    }

    @Future(callout=true)
    public static void fetchProfileCountsAsync(String profile) {
        TrailblazerProfileCounts profileCounts = TrailblazerProfileDataService.getTrailblazerProfileData(profile);
        TrailblazerProfileTrackerController.updateContactWithProfileCounts(profile, profileCounts);
    }

    // Certification List
    public String  getTrailblazerCertifications() {
        if(fetchCertifications()) {
            System.debug('success');
            TrailblazerProfileTrackerController.updateContactWithCertifications(this.profile, this.profileCertifications);

            return 'Success';
        } else {
            System.debug('Fail');
            return 'Fail';
        }
    }

    public Boolean fetchCertifications() {
        this.profileCertifications = TrailblazerCertificationDataService.getTrailblazerCertificationData(profile);
        if(this.profileCertifications != null) {
            return true;
        } else {
            return false;
        }
    }

    @Future(callout=true)
    public static void fetchCertificationsAsync(String profile) {
        List<TrailblazerCertification> profileCertifications = TrailblazerCertificationDataService.getTrailblazerCertificationData(profile);
        TrailblazerProfileTrackerController.updateContactWithCertifications(profile, profileCertifications);
    
    }

}