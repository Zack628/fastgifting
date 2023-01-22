package java_fastgifting;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {
	 /**
		 * This method returns a List with all Clients
		 * 
		 * @return List<Client>
		 */
		public List<Client> getClients() throws Exception {
				

			List<Client> clients = new ArrayList<Client>();
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			 
			String sql1 = "SELECT * FROM clients_fastgifting;";
	
			try {
	
				con = db.getConnection();
				stmt = con.prepareStatement(sql1);
	
				rs = stmt.executeQuery();
	
				while ( rs.next() ) {
	
					clients.add( new Client( rs.getString("firstnamecl"),rs.getString("lastnamecl"),rs.getString("emailcl"),rs.getString("citycl"),rs.getString("postalcodecl"),rs.getString("addresscl"), rs.getString("customerUsername"),rs.getString("passwordcl"), rs.getString("phonecl") ) );
	
				}
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
				
				return clients;
				
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
		 * Search client by username
		 * 
		 * @param username, String
		 * @return Client, the Client object or null
		 * @throws Exception
		 */
		public Client findClient(String username) throws Exception {
			
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql2 = "SELECT * FROM clients_fastgifting WHERE usernamecl=?;";
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql2);
	
				// setting parameter
				stmt.setString(1, username);
	
				rs = stmt.executeQuery();
	
				if ( !rs.next() ) {
	
					rs.close(); //closing ResultSet
					stmt.close(); //closing PreparedStatement
					throw new Exception("Invalid Client username: " + username);
	
				}
	
				Client clients = new Client( rs.getString("firstnamecl"),rs.getString("lastnamecl"),rs.getString("emailcl"),rs.getString("citycl"),rs.getString("postalcodecl"),rs.getString("addresscl"), rs.getString("customerUsername"),rs.getString("passwordcl"), rs.getString("phonecl")  );
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
	
				return clients;
	
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
		public Client authenticate(String username, String password) throws Exception {
			
				
            Connection con = null;
		    DB_FastGifting db = new DB_FastGifting();

		    String sqlQuery = "SELECT * FROM clients_fastgifting WHERE usernamecl=? AND passwordcl=?;";
		    PreparedStatement stmt = null;


		    try {

			    con = db.getConnection();
			    stmt = con.prepareStatement(sqlQuery);
			    stmt.setString(1, username);
			    stmt.setString(2, password);
			    ResultSet rs = stmt.executeQuery();

			    if (rs.next()) {
				    Client client = new Client(rs.getString("firstnamecl"),rs.getString("lastnamecl"),rs.getString("emailcl"),rs.getString("citycl"),rs.getString("postalcodecl"),rs.getString("addresscl"), rs.getString("usernamecl"),rs.getString("passwordcl"), rs.getString("phonecl") );
				    return client;
		    	} else {
				    throw new Exception("Username or password must be wrong.");
			    }

		    } catch (Exception e) {

			    throw new Exception(e.getMessage());

		    } finally {
		    	try {
			    	db.close();
			    } catch (Exception e) {
				    throw new Exception(e.getMessage());
			    }

		   }
			
		
	}


	
				
	
		 //End of authenticate
		
		/**
		 * Register/create new Client.
		 * 
		 * @param client, User
		 * @throws Exception, if encounter any error.
		 */
		public void register(Client client) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
	
			String sql4 = "SELECT * FROM clients_fastgifting WHERE usernamecl=? OR emailcl=?;";
			String sql5= "INSERT INTO clients_fastgifting (usernamecl, firstnamecl, lastnamecl, emailcl, passwordcl, citycl, addresscl, postalcodecl, phonecl) " + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
			
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql4);
	
				// setting parameter
				stmt.setString(1, client.getUsername());
				stmt.setString(2, client. getEmail());
	
				rs = stmt.executeQuery();
	
				if ( rs.next() ) {
					rs.close();
					stmt.close();
					throw new Exception("Sorry, username or email already registered");
	
				}
	
				stmt = con.prepareStatement(sql5);
	
				 //set values to all parameters
				
				stmt.setString(1, client.getUsername());
				stmt.setString(2, client.getName());
				stmt.setString(3, client.getSurname());
				stmt.setString(4, client.getEmail());
				stmt.setString(5, client.getPassword());;
				stmt.setString(6, client.getCity());
				stmt.setString(7, client.getAddress());
				stmt.setString(8, client.getPostalcode());
				stmt.setString(9, client.getPhone());
		
					
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
			
			
		}//end of re

		public void deleteprofile(Client client) throws Exception {
			
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			
			
			String sql7= "DELETE FROM clients_fastgifting WHERE usernamecl=?";
			
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql7);
	
				// setting parameter
				stmt.setString(1, client.getUsername());
	

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
	
	
			String sql= "UPDATE clients_fastgifting SET passwordcl = ? WHERE usernamecl = ? ;";
	
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
	
	
			String sql= "UPDATE clients_fastgifting SET citycl = ? WHERE usernamecl = ? ;";
	
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
	
	
			String sql= "UPDATE clients_fastgifting SET phonecl = ? WHERE usernamecl = ? ;";
	
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

		public void editAddress(String username, String address) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE clients_fastgifting SET addresscl = ? WHERE usernamecl = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setString(1, address);
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

		public void editPostalcode(String username, String postalcode) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE clients_fastgifting SET postalcodecl = ? WHERE usernamecl = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setString(1, postalcode);
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
	