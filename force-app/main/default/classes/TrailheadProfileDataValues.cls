public with sharing class TrailheadProfileDataValues {

    public String Id;
    public List<ProfileCount> profileCounts;

    public class ProfileCount {
        String Id;
        String RankLabel;
        String RankImageUrl;
        Integer EarnedPointTotal;
        Integer EarnedBadgeTotal;
        Integer CompletedTrailTotal;
        Integer PointTotalForNextRank;
        Integer BadgeTotalForNextRank;
    }

    // The API returns only an unitary array. That's why you can see zeros everywhere :P
    public ProfileCount getProfileCount() {
        return this.profileCounts[0];
    }


}
