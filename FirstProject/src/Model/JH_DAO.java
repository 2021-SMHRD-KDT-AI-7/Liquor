package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JH_DAO {
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
	
	public ArrayList<String[]> viewBookmark(String u_id) {
		ArrayList<String[]> cocktail_list = new ArrayList<>();
		String sql = "select cocktail_seq, cocktail_name from tbl_cocktail where cocktail_seq in (select cocktail_seq from my_cocktail where u_id=?)";
		conn();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				String cocktail_seq = rs.getString(1);
				String cocktail_name = rs.getString(2);
				String[] cocktail_set = {cocktail_seq, cocktail_name};
				cocktail_list.add(cocktail_set);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cocktail_list;
	}

}
