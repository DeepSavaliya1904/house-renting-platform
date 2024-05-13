package house_renting_platform;
import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
        	//jdbc connection 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
