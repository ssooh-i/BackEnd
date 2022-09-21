package common;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {
	

	private static DBUtil instance = new DBUtil();

	public static DBUtil getInstance() {
		return instance;
	}
	
	public static Connection getConnection() throws SQLException {
        try {
            Context context = new InitialContext();
            Context root=(Context) context.lookup("java:comp/env");
            DataSource ds=(DataSource) root.lookup("jdbc/ssafy");
            return ds.getConnection();

        }catch(NamingException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	public void close(AutoCloseable... closeables) {
		for (AutoCloseable c : closeables) {
			if (c != null) {
				try {
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}



//-----------------------------------------------------------------
/*public class DBUtil {
 	시험에 나올 꺼같음
	private final String driverName = "com.mysql.cj.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/ssafyweb?serverTimezone=UTC";
	private final String user = "ssafy";
	private final String pass = "1234";

	private static DBUtil instance = new DBUtil();

	private DBUtil() {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static DBUtil getInstance() {
		return instance;
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, pass);
	}

	public void close(AutoCloseable... closeables) {
		for (AutoCloseable c : closeables) {
			if (c != null) {
				try {
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}*/
