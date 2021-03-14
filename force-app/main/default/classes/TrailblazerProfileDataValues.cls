public with sharing class TrailblazerProfileDataValues {

    public String Id;
    public List<TrailblazerProfileCounts> profileCounts;
  
    // The API returns only an unitary array. That's why you can see zeros everywhere :P
    public TrailblazerProfileCounts getProfileCount() {
        return this.profileCounts[0];
    }
    
}