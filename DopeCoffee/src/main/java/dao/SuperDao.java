package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
protected Connection conn = null;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "cafe";
	private String password = "cafe";
	
	public SuperDao() {
		try {
			Class.forName(this.driver) ;
			this.conn = this.getConnection();
			if (conn!= null) {
				//System.out.println("데이터 베이스 접속 성공");
			} else {
				System.out.println("데이터 베이스 접속 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected Connection getConnection() {		
		try { // 커넥션 객체 생성
			return DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
