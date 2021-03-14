public with sharing class TrailblazerProfileTracker {
    
    private String profile = '';
    private TrailblazerProfileCounts profileCounts;

    public TrailblazerProfileTracker(String profile) {
        this.profile = profile;
    }


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


}