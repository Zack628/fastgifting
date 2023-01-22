package java_fastgifting;


public class Review {

    private String usernameclient;
    private String usernamecourier;
    private String reviewDate;
	private String speed;
	private String friendliness;
	private String professionalism;
	private String comment;
    

    public Review(String usernameclient, String usernamecourier, String reviewDate, String speed, String friendliness, String professionalism, String comment) {        
        this.usernameclient = usernameclient;
        this.usernamecourier = usernamecourier;
        this.reviewDate = reviewDate;
        this.speed = speed;
        this.friendliness = friendliness;
        this.professionalism = professionalism;
        this.comment = comment;
    }

    public String getUsernameclient() {
        return usernameclient;
    }

    public void setUsernameclient(String usernameclient) {
        this.usernameclient = usernameclient;
    }

    public String getUsernamecourier() {
        return usernamecourier;
    }

    public void setUsernamecourier(String usernamecourier) {
        this.usernamecourier = usernamecourier;
    }

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }
    
    public void setFriendliness(String friendliness) {
        this.friendliness = friendliness;        
    }  

    public String getFriendliness() {
        return friendliness;
    }

    public void setProfessionalism(String professionalism) {
        this.professionalism = professionalism;        
    }  

    public String getProfessionalism() {
        return professionalism;
    }

    public void setComment(String comment) {
        this.comment = comment;        
    }  
    
    public String getComment() {
        return comment;    
    }
}