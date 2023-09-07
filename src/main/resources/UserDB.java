
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import resources.User;
import resources.MyDatabase;

public class UserDB {
    String s1 = null;

    public String insertUser(User rb) {
        MyDatabase db = new MyDatabase();
        Connection con = db.getCon();
        PreparedStatement pstmt = null;

        try {
            String query = "INSERT INTO user (icnum, gender, dob, postcode, town) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, rb.getIcnum());
            pstmt.setString(2, rb.getGender());
            pstmt.setString(3, rb.getDob());
            pstmt.setString(4, rb.getPostcode());
            pstmt.setString(5, rb.getTown());

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                s1 = "Data Insert Successfully";
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Close PreparedStatement and Connection here
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return s1;
    }


}
