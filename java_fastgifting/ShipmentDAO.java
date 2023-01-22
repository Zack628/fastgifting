package java_fastgifting;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShipmentDAO {

    /**
		 * This method returns a List with all Shipments
		 * 
		 * @return List<Shipment>
		 */
		public List<Shipment> getShipments() throws Exception {
				

			List<Shipment> shipments = new ArrayList<Shipment>();
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			 
			String sql1 = "SELECT * FROM shipments_fastgifting;";
	
			try {
	
				con = db.getConnection();
				stmt = con.prepareStatement(sql1);
	
				rs = stmt.executeQuery();
	
				while ( rs.next() ) {
	
					shipments.add( new Shipment( rs.getString("startingpoint"),rs.getString("postalcodesh"),rs.getString("destination"),rs.getString("shipDate"),rs.getFloat("weight"),rs.getFloat("volume"),rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"), rs.getInt("statusOfCompletion"), rs.getString("shipid") ) );
	
				}
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
				
				return shipments;
				
			} catch (Exception e) {
				
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of getShipment


        /**
		 * Create new Shipment.
		 * @throws Exception, if encounter any error.
		 */
		public void register(Shipment ship) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;



			String sql4 = "INSERT INTO shipments_fastgifting (startingpoint, destination, postalcodesh, shipDate, weight, volume, statusOfCompletion, usernamecl_fk, usernameco_fk ) " + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
			
			try {
				
				con = db.getConnection();

				stmt = con.prepareStatement(sql4);
	
				 //set values to all parameters
				
				stmt.setString(1, ship.getFrom());
				stmt.setString(2, ship.getPostalcode());
				stmt.setString(3,  ship.getTo());
				stmt.setString(4, ship.getShipDate());
				stmt.setFloat(5, ship.getWeight());
				stmt.setFloat(6, ship.getVolume());
				stmt.setString(7, ship.getUsernameclient());
				stmt.setString(8, ship.getUsernamecourier());
				stmt.setInt(8, ship.getStatusofcompletion());
			
					
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
			
			
		}//end of newShipment

		public void showShip(Shipment ship) throws Exception {

			System.out.println(ship);
				

			
	
			
		} //End of getShipment

		public List<Shipment> showClientHistory(String usernameclient) throws Exception {
				

			List<Shipment> ship = new ArrayList<Shipment>();
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			 
			String sql1 = "SELECT * FROM shipments_fastgifting WHERE usernamecl_fk=?;";
	
			try {
	
				con = db.getConnection();
				stmt = con.prepareStatement(sql1);

				stmt.setString(1, usernameclient);
	
				rs = stmt.executeQuery();
	
				while ( rs.next() ) {
	
					ship.add( new Shipment( rs.getString("startingpoint"),rs.getString("postalcodesh"),rs.getString("destination"),rs.getString("shipDate"),rs.getFloat("weight"),rs.getFloat("volume"),rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"), rs.getInt("statusOfCompletion"), rs.getString("shipid")   ) );
	
				}
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
				
				return ship;
				
			} catch (Exception e) {
				
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of getShipment


		
		public List<Shipment> showCourierHistory(String usernamecourier) throws Exception {
				

			List<Shipment> ship = new ArrayList<Shipment>();
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			 
			String sql1 = "SELECT * FROM shipments_fastgifting WHERE usernameco_fk=?;";
	
			try {
	
				con = db.getConnection();
				stmt = con.prepareStatement(sql1);

				stmt.setString(1, usernamecourier);
	
				rs = stmt.executeQuery();
	
				while ( rs.next() ) {
	
					ship.add( new Shipment( rs.getString("startingpoint"),rs.getString("postalcodesh"),rs.getString("destination"),rs.getString("shipDate"),rs.getFloat("weight"),rs.getFloat("volume"),rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"), rs.getInt("statusOfCompletion"), rs.getString("shipid")  ) );
	
				}
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
				
				return ship;
				
			} catch (Exception e) {
				
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		} //End of getShipment

		public Shipment findShip(String shipid) throws Exception {
			
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql2 = "SELECT * FROM shipments_fastgifting WHERE shipid=?;";
	
			try {
				
				con = db.getConnection();
				stmt = con.prepareStatement(sql2);
	
				// setting parameter
				stmt.setString(1, shipid);
	
				rs = stmt.executeQuery();
	
				if ( !rs.next() ) {
	
					rs.close(); //closing ResultSet
					stmt.close(); //closing PreparedStatement
					throw new Exception("Invalid Shipment id: " + shipid);
	
				}
	
				Shipment shipment = new Shipment(rs.getString("startingpoint"),rs.getString("postalcodesh"),rs.getString("destination"),rs.getString("shipDate"),rs.getFloat("weight"),rs.getFloat("volume"),rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"), rs.getInt("statusOfCompletion"), rs.getString("shipid")  );
	
				rs.close(); //closing ResultSet
				stmt.close(); //closing PreparedStatement
				db.close(); //closing Connection
	
				return shipment;
	
			} catch (Exception e) {
	
				throw new Exception(e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
					
				}
	
			}
			
		}

		public void completeShip(String shipid) throws Exception {
				
	
			DB_FastGifting db = new DB_FastGifting();
			Connection con = null;
			PreparedStatement stmt = null;
	
	
			String sql= "UPDATE shipments_fastgifting SET statusOfCompletion = ? WHERE shipid = ? ;";
	
			try {
				
				con = db.getConnection();
				
	
				stmt = con.prepareStatement(sql);
	
				 //set values to all parameters
				
				stmt.setInt(1, 1);
				stmt.setString(2, shipid);
				
		
					
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




		
}
