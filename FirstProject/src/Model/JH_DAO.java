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
	ResultSet rs = null;
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

	// 북마크 리스트 반환하는 메소드
	public ArrayList<String[]> viewBookmark(String u_id) {
		ArrayList<String[]> cocktail_list = new ArrayList<>();
		String sql = "select cocktail_seq, cocktail_name from tbl_cocktail where cocktail_seq in (select cocktail_seq from my_cocktail where u_id=?)";
		conn();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, u_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				String cocktail_seq = rs.getString(1);
				String cocktail_name = rs.getString(2);
				String[] cocktail_set = { cocktail_seq, cocktail_name };
				cocktail_list.add(cocktail_set);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cocktail_list;
	}

	// 관리자 권한으로 칵테일, 레시피 테이블에 칵테일 추가하는 메소드 / 이름, 특성, 도수, 색상, 재료이름, 용량, 주의사항
	public void addCocktail(String cocktail_name, String cocktail_speciality, int cocktail_degree,
			String cocktail_color, String ingredient_name, String ingredient_amount, String ingredient_caution) {
		// name speciality degree color
		// ingredient_name ingredient_amount ingredient_caution
		conn();

		try {
			int seq = 0;

			String sql = "insert into tbl_cocktail (cocktail_seq, cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color, reg_date)"
					+ " values(tbl_cocktail_SEQ.nextval,?, ?, ?,?, sysdate)";// seq 자리에 시퀀스이름 추가하기
			// cocktail_name, cocktail_speciality, cocktail_degree,cocktail_color
			ps = conn.prepareStatement(sql);
			ps.setString(1, cocktail_name);
			ps.setString(2, cocktail_speciality);
			ps.setInt(3, cocktail_degree);
			ps.setString(4, cocktail_color);
			int a = ps.executeUpdate();
			if (a != 0) {
				String seqSql = "select COCKTAIL_SEQ from TBL_COCKTAIL where COCKTAIL_NAME=?";
				ps = conn.prepareStatement(seqSql);
				ps.setString(1, cocktail_name);
				rs = ps.executeQuery();
				System.out.println("2");
				ArrayList<String[]> ingre_list = transform(ingredient_name, ingredient_amount);
				if (rs.next()) {
					seq = rs.getInt(1);
					System.out.println(seq);
					if (seq != 0) {
						// ingredient_name ingredient_amount ingredient_caution
						for (int i = 0; i < ingre_list.size(); i++) {

							String reciSql = "insert into tbl_cocktail_recipe values(tbl_my_recipe_SEQ.nextval,?,?,?,?)";
							ps = conn.prepareStatement(reciSql);
							ps.setInt(1, seq);
							ps.setString(2, ingre_list.get(i)[0]);
							ps.setInt(3, Integer.parseInt(ingre_list.get(i)[1]));
							ps.setString(4, ingredient_caution);
							cnt = ps.executeUpdate();
							System.out.println("for문 안");
						}
					}
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<String[]> transform(String a, String c) {

		String[] b = a.split(",");
		String[] d = c.split(",");

		for (int i = 0; i < b.length; i++) {
			System.out.println(b[i].trim()); // .trim() >> 문자열 앞뒤로 여백 제거
		}
		for (int i = 0; i < d.length; i++) {
			System.out.println(d[i].trim()); // .trim() >> 문자열 앞뒤로 여백 제거
		}
		ArrayList<String[]> arr = new ArrayList<String[]>();
		for (int i = 0; i < b.length; i++) {
			String[] e = { b[i].trim(), d[i].trim() };
			arr.add(e);
		}
		return arr;
	}

	// 레시피 받아와서 비율 구해주고 어레이리스트로 반환하는 메소드
	public ArrayList<ArrayList> ratioFromRecipe(int cocktail_seq) {
		
		conn();
		
		ArrayList<String> ingredient_name_list = new ArrayList<String>();
		ArrayList<Integer> ingredient_ratio_list = new ArrayList<>();
		ArrayList<Integer> ingredient_amount_list = new ArrayList<Integer>();
		ArrayList<ArrayList> returns = new ArrayList<ArrayList>();

		try {
			String sql = "select INGREDIENT_NAME, INGREDIENT_AMOUNT from tbl_cocktail_recipe where cocktail_seq=?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cocktail_seq);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String name = rs.getString("ingredient_name");
				int amount = rs.getInt("ingredient_amount");
				ingredient_name_list.add(name);
				ingredient_amount_list.add(amount);
			
			}
			int sum = 0;
			for (int i = 0; i < ingredient_amount_list.size(); i++) {
				sum += ingredient_amount_list.get(i);
			
			}
			for (int i = 0; i < ingredient_amount_list.size(); i++) {
				int ratio =  (ingredient_amount_list.get(i)*100 / sum);
				ingredient_ratio_list.add(ratio);			
			}

			returns.add(ingredient_name_list);
			returns.add(ingredient_ratio_list);
			

		} catch (Exception e) {
			System.out.println("실패했음");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return returns;
	}

}
