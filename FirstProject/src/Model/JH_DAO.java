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
			String url = "jdbc:oracle:thin:@localHost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");

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
	
	public void addCocktail(String cocktail_name,String cocktail_speciality, int cocktail_degree, String cocktail_color, String ingredient_name, int ingredient_amount, String ingredient_caution) {
		//name speciality degree color 
		//ingredient_name ingredient_amount ingredient_caution
		conn();
		
		try {
			int seq=0;

			String sql="insert into tbl_cocktail (cocktail_seq, cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color, reg_date)"
					+ " values(tbl_cocktail_SEQ.nextval,?, ?, ?,?, sysdate)";//seq 자리에 시퀀스이름 추가하기
			//cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color
			ps=conn.prepareStatement(sql);
			ps.setString(1, cocktail_name);
			ps.setString(2, cocktail_speciality);
			ps.setInt(3, cocktail_degree);
			ps.setString(4, cocktail_color);
			int a=ps.executeUpdate();
			if(ps.executeUpdate()!=0) {
				ps=conn.prepareStatement("commit");
				String seqSql="select COCKTAIL_SEQ from TBL_COCKTAIL where COCKTAIL_NAME=?";
				ps=conn.prepareStatement(seqSql);
				ps.setString(1, cocktail_name);
				rs=ps.executeQuery();
				System.out.println("2");
				if(rs.next()) {
					seq=rs.getInt(1);					
					if(seq!=0) {
						//ingredient_name ingredient_amount ingredient_caution
						ps=conn.prepareStatement("commit");
						String reciSql="insert into tbl_cocktail_recipe values(tbl_my_recipe_SEQ.nextval,?,?,?,?)";
						ps=conn.prepareStatement(reciSql);
						ps.setInt(1, seq);
						ps.setString(2, ingredient_name);
						ps.setInt(3, ingredient_amount);
						ps.setString(4, ingredient_caution);
						cnt=ps.executeUpdate();						
					}
				}
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
