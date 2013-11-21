package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DBUtil {

	private static DataSource ds;// 获取数据库连接池
	private static ThreadLocal<Connection> connLocal = new ThreadLocal<Connection>();// 创建线程局部变量
	static {
		Properties props = new Properties();
		try {
			props.load(DBUtil.class.getClassLoader().getResourceAsStream(
					"mysql.properties"));
			ds = BasicDataSourceFactory.createDataSource(props);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		Connection conn = connLocal.get();
		if (conn == null) {
			conn = ds.getConnection();
			connLocal.set(conn);
		}
		return conn;
	}

	public static void closeConnection() throws SQLException {
		Connection conn = connLocal.get();
		connLocal.set(null);
		if (conn != null) {
			conn.close();
		}
	}	
	public static void main(String[] args) {
		try {
			System.out.println(getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
