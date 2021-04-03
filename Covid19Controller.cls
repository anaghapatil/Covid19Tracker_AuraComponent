//wrapper class

public class Covid19Controller {
	@AuraEnabled
    public static Covid19Parser getCovidData(){
        string baseURL = 'https://api.covid19api.com/summary';
        HTTPRequest request = new HTTPRequest();
        request.setEndPoint(baseURL);
        request.setMethod('GET');
        request.setHeader('Accept', 'application/json');
        HTTP H = new HTTP();
        HttpResponse response = h.send(request);
        
        //we have to pass the string to the method, method convert json string to object and object is stored in wrapper class
        //then we have to access that wrapper class in our js file
        //
        //In the api there is Global, hence we cannotuse that keyword in our apex class because in apex its meaning is access modifier
        //so we are replacing Global using replace() function while getting the body to AllStats
        Covid19Parser prsr = Covid19Parser.parse(response.getBody().replace('"Global":','"AllStats":'));
        return prsr;
        
    }
}