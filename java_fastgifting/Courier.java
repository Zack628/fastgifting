package java_fastgifting;

public class Courier {
    private String name;
	private String surname;
	private String email;
	private String username;
	private String password;
	private String city;
	private String phone;
	private Float maxweight;
    private Float maxvolume;
    private int availability;
    
    /**
     * Full constructor
     *   
     * @param name
     * @param surname
     * @param email
     * @param city
     * @param phone
     * @param maxweight
     * @param maxvolume
     * @param username
     * @param password
     * @param availability;
     */
    public Courier(String name, String surname, String email, String city, String phone, Float maxweight, Float maxvolume, String username, String password, int availability ) {        
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.city = city;
        this.phone = phone;
        this.maxweight = maxweight;
        this.maxvolume = maxvolume;
        this.username = username;
        this.password = password;
        this.availability = availability;
    }
    
      


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }
    
    public void setCity(String city) {
        this.city = city;        
    }  

    public String getCity() {
        return city;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;        
    }  

    public String getPhone() {
        return phone;
    }
    
    public void setMaxweight(Float maxweight) {
        this.maxweight = maxweight;        
    }  

    public Float getMaxweight() {
        return maxweight;
    }

    public void setMaxvolume(Float maxvolume) {
        this.maxvolume = maxvolume;        
    }  

    public Float getMaxvolume() {
        return maxvolume;
    }

    public void setAvailability(int availability) {
        this.availability = availability;        
    }  

    public int getAvailability() {
        return availability;
    }
    
}
    
