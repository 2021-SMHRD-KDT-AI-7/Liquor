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

	// DB연결 메소드
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 카드키
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_a_1111";
			String db_pw = "smhrd1";
			// 연결
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB종료 메소드
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

	// 레시피 불러오기
	
	// 불러온 레시피 저장하기
	
	// 레시피 수정본 저장하기
	
	// 저장된 나만의 레시피 수정하기
	
	// 나만의 레시피 클릭 시 정보
	
}
