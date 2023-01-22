package java_fastgifting;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public void register(Review review) throws Exception {
			

	

		Connection con = null;
		DB_FastGifting db = new DB_FastGifting();
		String sql2 = "INSERT INTO reviews_fastgifting (usernamecl_fk, usernameco_fk, comment, speed, professionalism, friendliness, reviewDate) VALUES (?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement stmt2 = null;

		try {

			con = db.getConnection();
			
			    stmt2 = con.prepareStatement(sql2);
				stmt2.setString(1, review.getUsernameclient());
			    stmt2.setString(2, review.getUsernamecourier());
				stmt2.setString(3, review.getComment());
				stmt2.setString(4, review.getSpeed());
				stmt2.setString(5, review.getProfessionalism());
                stmt2.setString(6, review.getFriendliness());
                stmt2.setString(7, review.getReviewDate());
				stmt2.executeUpdate();
				stmt2.close();
				db.close();
			


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

    public Review findReview(String usernameclient, String usernamecourier) throws Exception {
			
	
        DB_FastGifting db = new DB_FastGifting();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql2 = "SELECT * FROM reviews_fastgifting WHERE usernamecl_fk=? && usernameco_fk=?;";

        try {
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql2);

            // setting parameter
            stmt.setString(1, usernameclient);
            stmt.setString(2, usernamecourier);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {

                rs.close(); //closing ResultSet
                stmt.close(); //closing PreparedStatement
                throw new Exception("Invalid credentials " + usernameclient);

            }

            Review review = new Review( rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"),rs.getString("comment"),rs.getString("speed"),rs.getString("professionalism"),rs.getString("friendliness"),rs.getString("reviewDate")   ) ;

            

            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            db.close(); //closing Connection

            return review;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
        
    }

    

                

            
    

    public List<Review> getReviews() throws Exception {
				

        List<Review> reviews = new ArrayList<Review>();

        DB_FastGifting db = new DB_FastGifting();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        String sql1 = "SELECT * FROM reviews_fastgifting;";

        try {

            con = db.getConnection();
            stmt = con.prepareStatement(sql1);

            rs = stmt.executeQuery();

            while ( rs.next() ) {

                reviews.add( new Review( rs.getString("usernamecl_fk"),rs.getString("usernameco_fk"),rs.getString("comment"),rs.getString("speed"),rs.getString("professionalism"),rs.getString("friendliness"),rs.getString("reviewDate")  ) );

            }

            rs.close(); //closing ResultSet
            stmt.close(); //closing PreparedStatement
            db.close(); //closing Connection
            
            return reviews;
            
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