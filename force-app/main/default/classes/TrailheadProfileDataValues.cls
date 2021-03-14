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

    public String getId() {
        return this.Id;
    }

    public String getRankLabel() {
        return this.profileCounts[0].RankLabel;
    }

    public String getRankImageUrl() {
        return this.profileCounts[0].RankImageUrl;
    }

    public Integer getEarnedPointTotal() {
        return this.profileCounts[0].EarnedPointTotal;
    }

    public Integer getEarnedBadgeTotal() {
        return this.profileCounts[0].EarnedBadgeTotal;
    }

    public Integer getCompletedTrailTotal() {
        return this.profileCounts[0].CompletedTrailTotal;
    }

    public Integer getPointTotalForNextRank() {
        return this.profileCounts[0].PointTotalForNextRank;
    }

    public Integer getBadgeTotalForNextRank() {
        return this.profileCounts[0].BadgeTotalForNextRank;
    }

}
