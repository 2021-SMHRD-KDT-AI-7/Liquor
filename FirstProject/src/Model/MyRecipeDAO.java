package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MyRecipeDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	MyRecipeDTO dto = null;
	int cnt = 0;

	// DB���� �޼ҵ�
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// ī��Ű
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_a_1111";
			String db_pw = "smhrd1";
			// ����
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB���� �޼ҵ�
	public void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// ������ �ҷ�����
	
	// �ҷ��� ������ �����ϱ�
	
	// ������ ������ �����ϱ�
	
	// ����� ������ ������ �����ϱ�
	
	// ������ ������ Ŭ�� �� ����
	
}
