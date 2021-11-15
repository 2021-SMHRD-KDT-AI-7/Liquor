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
	
	public void addCocktail(String cocktail_name,String cocktail_speciality, String cocktail_degree, String cocktail_color, String ingredient_name, String ingredient_amount, String ingredient_caution) {
		//name speciality degree color 
		//ingredient_name ingredient_amount ingredient_caution
		conn();
		
		try {
			int seq=0;

			String sql="insert into tbl_cocktail (cocktail_seq,cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color, reg_date)"
					+ "values(cocktail_seq,?, ?, ?,?, sysdate)";//seq 자리에 시퀀스이름 추가하기
			//cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color
			ps=conn.prepareStatement(sql);
			ps.setString(1, cocktail_name);
			ps.setString(2, cocktail_speciality);
			ps.setString(3, cocktail_degree);
			ps.setString(4, cocktail_color);
			if(ps.executeUpdate()!=0) {
				String seqSql="select cocktail_seq from tbl_cocktail where cocktail_name="+cocktail_name;
				ps=conn.prepareStatement(seqSql);
				rs=ps.executeQuery();
				if(rs.next()) {
					seq=rs.getInt(1);
					if(seq!=0) {
						//ingredient_name ingredient_amount ingredient_caution
						String reciSql="insert into tbl_cocktail_recipe (시퀀스 넣을거,?,?,?,?)";
						ps=conn.prepareStatement(reciSql);
						ps.setInt(1, seq);
						ps.setString(2, ingredient_name);
						ps.setString(3, ingredient_amount);
						ps.setString(4, ingredient_caution);
					}
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
