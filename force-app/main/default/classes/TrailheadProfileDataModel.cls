public class TrailheadProfileDataModel {

    List<TrailheadProfileDataValues> value;

    public TrailheadProfileDataValues.ProfileCount getProfileCount() {
        return this.value[0].getProfileCount();
    }
}
