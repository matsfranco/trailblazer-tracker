public with sharing class TrailblazerCertificationDataService {
    
    public static List<TrailblazerCertification> getTrailblazerCertificationData(String profile) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:TrailblazerProfileService'+'/'+profile+'/certifications');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            System.debug(responseBody);
            TrailblazerCertificationDataModel certificationData = (TrailblazerCertificationDataModel)JSON.deserialize(responseBody,TrailblazerCertificationDataModel.class);
            return certificationData.certificationsList;
        } else {
            return null;
        }

    }

}