package java_fastgifting;

public class Client {
    
    private String name;
	private String surname;
	private String email;
	private String username;
	private String password;
	private String city;
	private String postalcode;
	private String address;
    private String phone;

    /**
     * Full constructor
     *   
     * @param name
     * @param surname
     * @param email
     * @param city
     * @param postalcode
     * @param address
     * @param username
     * @param password
     * @param phone
     */
    public Client(String name, String surname, String email, String city, String postalcode, String address,String username, String password, String phone ) {        
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.city = city;
        this.postalcode = postalcode;
        this.address = address;
        this.username = username;
        this.password = password;
        this.phone = phone;
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
    
    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;        
    }  

    public String getPostalcode() {
        return postalcode;
    }
    
    public void setAddress(String address) {
        this.address = address;        
    }  

    public String getAddress() {
        return address;
    }

    public void setPhone(String phone) {
        this.phone = phone;        
    }  

    public String getPhone() {
        return phone;
    }
    
}