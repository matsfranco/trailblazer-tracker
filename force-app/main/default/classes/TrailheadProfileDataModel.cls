public class TrailheadProfileDataModel {

    List<TrailheadProfileDataValues> value;

    public TrailheadProfileDataValues.ProfileCount getProfileCounts() {
        return this.value[0].getProfileCount();
    }
}
