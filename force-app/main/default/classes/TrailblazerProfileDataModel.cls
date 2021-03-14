public class TrailblazerProfileDataModel {

    List<TrailblazerProfileDataValues> value;
    
    public TrailblazerProfileCounts getProfileCounts() {
        return this.value[0].getProfileCount();
    }
}