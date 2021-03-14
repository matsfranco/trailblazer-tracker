public with sharing class TrailheadProfileDataService {
    
    public static void getTrailheadProfileData() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:TrailheadProfileService');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            System.debug(responseBody);
            TrailheadProfileDataModel profileData = (TrailheadProfileDataModel)JSON.deserialize(responseBody,TrailheadProfileDataModel.class);
            System.debug(profileData);
            System.debug('EarnedPointTotal: '+profileData.getProfileCount());

        }

    }

}
