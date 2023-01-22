package java_fastgifting;

public class Shipment{

    
    private String usernameclient;
    private String from;
    private String postalcode;
	private String to;
	private String shipdate;
	private Float weight;
	private Float volume;
    private String usernamecourier;
    private int statusofcompletion;
    private String shipid;

 

    public Shipment(String from, String postalcode, String to, String shipdate, Float weight, Float volume, String usernameclient,  String usernamecourier, int statusofcompletion, String shipid) {        
       
        
        this.from = from;
        this.postalcode = postalcode;
        this.to = to;
        this.shipdate = shipdate;
        this.weight = weight;
        this.volume = volume;
        this.usernameclient = usernameclient;
        this.usernamecourier = usernamecourier;
        this.statusofcompletion = statusofcompletion;
        this.shipid = shipid;
        
    }

    
    public String getUsernameclient() {
        return usernameclient;
    }

    public void setUsernameclient(String usernameclient) {
        this.usernameclient = usernameclient;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getShipDate() {
        return shipdate;
    }

    public void setShipDate(String shipdate) {
        this.shipdate= shipdate;
    }
    
    public void setWeight(Float weight) {
        this.weight = weight;        
    }  

    public Float getWeight() {
        return weight;
    }
    
    public void setVolume(Float volume) {
        this.volume = volume;        
    }  

    public Float getVolume() {
        return volume;
    }
    
    public void setUsernamecourier(String usernamecourier) {
        this.usernamecourier = usernamecourier;        
    }  

    public String getUsernamecourier() {
        return usernamecourier;
    }

    public void setStatusofcompletion(int statusofcompletion) {
        this.statusofcompletion = statusofcompletion;        
    }  

    public int getStatusofcompletion() {
        return statusofcompletion;
    }

    public void setShipId(String shipid) {
        this.shipid = shipid;        
    }  

    public String getShipId() {
        return shipid;
    }


}