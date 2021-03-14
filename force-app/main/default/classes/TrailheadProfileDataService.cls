public with sharing class TrailheadProfileDataService {
    
    public static void getTrailheadProfileData() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://go-trailhead-leaderboard-api.herokuapp.com/trailblazer/matsfranco');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {

            String responseBody = response.getBody();
            System.debug(responseBody);
            TrailheadProfileDataModel profileData = (TrailheadProfileDataModel)JSON.deserialize(responseBody,TrailheadProfileDataModel.class);
            System.debug(profileData);
            System.debug('EarnedPointTotal: '+profileData.getProfileCount());

        }

    }

}
