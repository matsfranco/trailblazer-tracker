public with sharing class TrailblazerProfileDataService {
    
    public static TrailblazerProfileCounts getTrailblazerProfileData(String profile) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:TrailheadProfileService'+'/'+profile);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            TrailblazerProfileDataModel profileData = (TrailblazerProfileDataModel)JSON.deserialize(responseBody,TrailblazerProfileDataModel.class);
            return profileData.getProfileCounts();
        } else {
            return null;
        }

    }

}