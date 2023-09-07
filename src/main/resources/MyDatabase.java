import java.sql.Connection;
        import java.sql.DriverManager;
        import java.sql.SQLException;

public class MyDatabase {

    Connection con = null;

    public Connection getCon() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
