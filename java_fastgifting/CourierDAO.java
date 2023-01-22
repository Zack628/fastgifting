package java_fastgifting;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourierDAO {

/**
		 * This method returns a List with all Couriers
		 * 
		 * @return List<Courier>
		 */
		public List<Courier> getCouriers() throws Exception {
				

			List<Courier> couriers = new ArrayList<Courier>();
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			 
			String sql1 = "SELECT * FROM couriers_fastgifting;";
	
			try {
	
				con = db.getConnection();
				stmt = con.prepareStatement(sql1);
	
				rs = stmt.executeQuery();
	
				while ( rs.next() ) {
					couriers.add( new Courier( rs.getString("firstnameco"), rs.getString("lastnameco"), rs.getString("emailco"), rs.getString("cityco"), rs.getString("phoneco"), rs.getFloat("maxWeightco"),rs.getFloat("maxVolumeco"), rs.getString("usernameco"),rs.getString("passwordco"), rs.getInt("availability") ) );
	
				}
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
				
				return couriers;
				
			} catch (Exception e) {
				
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of getClients
	
		/**
		 * Search courier by username
		 * 
		 * @param area, String
		 * @return Courier, the Courier object or null
		 * @throws Exception
		 */
		public Courier findCourier(String username) throws Exception {
			
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql2 = "SELECT * FROM couriers_fastgifting WHERE usernameco=?;";
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql2);
	
				// setting parameter
				stmt.setString(1, username);
	
				rs = stmt.executeQuery();
	
				if ( !rs.next() ) {
	
					rs.close(); //closing ResultSet
					stmt.close(); //closing PreparedStatement
					throw new Exception("Invalid Courier username: " + username);
	
				}
	
				Courier courier = new Courier( rs.getString("firstnameco"), rs.getString("lastnameco"), rs.getString("emailco"), rs.getString("cityco"), rs.getString("phoneco"), rs.getFloat("maxWeightco"),rs.getFloat("maxVolumeco"), rs.getString("usernameco"),rs.getString("passwordco"), rs.getInt("availability") );
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
	
				return courier;
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of findClient
	
		/**
		 * This method is used to authenticate a client.
		 * 
		 * @param username, String
		 * @param password, String
		 * @return Client, the Client object
		 * @throws Exception, if the credentials are not valid
		 */
		public Courier authenticate(String username, String password) throws Exception {
			
				
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql3 = "SELECT * FROM couriers_fastgifting  WHERE usernameco=? AND passwordco=?;";
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql3);
	
				// setting parameter
				stmt.setString(1, username);
				stmt.setString(2, password);
	
				rs = stmt.executeQuery();
	
				if ( !rs.next() ) {
	
					rs.close(); //closing ResultSet
					stmt.close(); //closing PreparedStatement
					throw new Exception("Wrong username or password");
	
				}
	
				Courier courier = new Courier( rs.getString("firstnameco"), rs.getString("lastnameco"), rs.getString("emailco"), rs.getString("cityco"), rs.getString("phoneco"), rs.getFloat("maxWeightco"),rs.getFloat("maxVolumeco"), rs.getString("usernameco"),rs.getString("passwordco"), rs.getInt("availability") );
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
	
				return courier;
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		} //End of authenticate
		
		/**
		 * Register/create new Client.
		 * 
		 * @param client, User
		 * @throws Exception, if encounter any error.
		 */
		public void register(Courier courier) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
	
			String sql4 = "SELECT * FROM couriers_fastgifting WHERE usernameco=? OR emailco=?;";
			String sql5= "INSERT INTO couriers_fastgifting (usernameco, firstnameco, lastnameco, emailco, passwordco, cityco, phoneco, maxWeightco, maxVolumeco, availability ) " + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql4);
	
				// setting parameter
				stmt.setString(1, courier.getUsername());
				stmt.setString(2, courier. getEmail());
	
				rs = stmt.executeQuery();
	
				if ( rs.next() ) {
					rs.close();
					stmt.close();
					throw new Exception("Sorry, username or email already registered");
	
				}
	
				stmt = con.prepareStatement(sql5);
	
				 //set values to all parameters
				
				stmt.setString(1, courier.getUsername());
				stmt.setString(2, courier.getName());
				stmt.setString(3, courier.getSurname());
				stmt.setString(4, courier.getEmail());
				stmt.setString(5, courier.getPassword());
				stmt.setString(6, courier.getCity());
				stmt.setString(7, courier.getPhone());
				stmt.setFloat(8, courier.getMaxweight());
				stmt.setFloat(9, courier.getMaxvolume());
				stmt.setInt(10, courier.getAvailability());
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		}//end of register

		public void deleteprofile(Courier courier) throws Exception {
			
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			
			
			String sql7= "DELETE FROM couriers_fastgifting WHERE usernameco=?";
			
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql7);
	
				// setting parameter
				stmt.setString(1, courier.getUsername());
	

				stmt.executeUpdate();


				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
	
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of findClient

		public void editPassword(String username, String password) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE couriers_fastgifting SET passwordco = ? WHERE usernameco = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setString(1, password);
				stmt.setString(2, username);
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		}//end of register

		public void editCity(String username, String city) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE couriers_fastgifting SET cityco = ? WHERE usernameco = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setString(1, city);
				stmt.setString(2, username);
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		}

		public void editPhone(String username, String phone) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE couriers_fastgifting SET phoneco = ? WHERE usernameco = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setString(1, phone);
				stmt.setString(2, username);
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		}

		public void editMaxweight(String username, Float maxweight) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE couriers_fastgifting SET maxWeightco = ? WHERE usernameco = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setFloat(1, maxweight);
				stmt.setString(2, username);
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
			
		}

		public void editMaxvolume(String username, Float maxvolume) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE couriers_fastgifting SET maxVolumeco = ? WHERE usernameco = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setFloat(1, maxvolume);
				stmt.setString(2, username);
				
		
					
				//execute the SQL statement (INSERT)	
				stmt.executeUpdate();
	
				stmt.close();
				db.close();
			   
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
		}

			public void editAvailability(String username, int availability) throws Exception {
				
	
				DB_FastGifting db = new DB_FastGifting();
				Connection con = null;
				PreparedStatement stmt = null;
		
		
				String sql= "UPDATE couriers_fastgifting SET availability = ? WHERE usernameco = ? ;";
		
				try {
					
					con = db.getConnection();
					
		
					stmt = con.prepareStatement(sql);
		
					 //set values to all parameters
					
					stmt.setInt(1, availability);
					stmt.setString(2, username);
					
			
						
					//execute the SQL statement (INSERT)	
					stmt.executeUpdate();
		
					stmt.close();
					db.close();
				   
		
				} catch (Exception e) {
		
					throw new Exception(e.getMessage());
		
				} finally {
		
					try {
						db.close();
					} catch (Exception e) {
						
					}
		
				}
			
			
		    }
			
			
		



	
	} //End of class
	
    
