package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs=null;
	int cnt = 0;
	MemberDTO mdto;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			conn = DriverManager.getConnection(url, "campus_c_a_1111", "smhrd1");

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberDTO join(String id, String pw, String name, String birth, String gender,String admin_yn) {
		// class 찾기 : 이클립스와 db 사이에 통로를 만들어주는 클래스
		try {
			conn();
			//public MemberDTO(String id, String pw, String name, String birth, String gender, String admin_yn, String join_date)

			String insertSql = "insert into member values (?, ?, ?,?,?,?)";
			ps = conn.prepareStatement(insertSql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, birth);
			ps.setString(5, gender);
			ps.setString(6, admin_yn);
			
			cnt = 0;
			// executeUpdate : 수행결과로 int타입의 값을 반환, select문을 제외한 다른 구문을 수행 할 때 사용하는 함수

			String selectSql = "select bookmark_id from member where id=?";
			ps = conn.prepareStatement(selectSql);
			rs = ps.executeQuery();
			if (rs.next()) {				
				mdto=login(id, pw);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mdto;

	}

	public MemberDTO login(String id, String pw) {
		try {
			conn();

			String sql = "select id, pw, name, birth, gender, admin_yn,join_date from member2 where id=? and pw=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);

			rs = ps.executeQuery();
			
			if (rs.next()) {
				
				id = rs.getString(1);
				pw=rs.getString(2);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				String gender = rs.getString(5);
				String admin_yn = rs.getString(6);
				String join_date = rs.getString(7);
				mdto=new MemberDTO(id,pw, name, birth,gender, admin_yn,join_date);
				//public MemberDTO(String id, String pw, String name, String birth, String gender, String admin_yn, String join_date)
			}
			return mdto;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return mdto;
	}

}
