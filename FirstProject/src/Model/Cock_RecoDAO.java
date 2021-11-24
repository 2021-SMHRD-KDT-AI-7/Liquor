package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Cock_RecoDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	Cock_RecoDTO dto = null;
	int cnt = 0;
	
	//DB연결 메소드
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 카드키
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_a_1111";
			String db_pw = "smhrd1";
			// 연결
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// DB종료 메소드
	public void dbClose() {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
		}
		
	}
	
	
	// 칵테일 정보 불러오기
	// 칵테일번호, 칵테일 이름,칵테일 특징,칵테일 도수,칵테일 색상,칵테일 이미지, 추천사유
	public ArrayList<Cock_RecoDTO> viewcock_RecoDTO() {
		getConn();
		ArrayList<Cock_RecoDTO> cr_list = new ArrayList<Cock_RecoDTO>();
		try {
			String sql = "select c.cocktail_seq, c.cocktail_name, c.cocktail_speciality, c.cocktail_degree,c.cocktail_color,"  
					+" c.cocktail_img, r.reco_opinion" 
					+" from tbl_cocktail c, tbl_recommend r"
					+" where c.cocktail_seq=r.cocktail_seq";
					
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
				String cocktail_name = rs.getString("cocktail_name");
				String cocktail_speciality = rs.getString("cocktail_speciality");
				int cocktail_degree = rs.getInt("cocktail_degree");
				String cocktail_color = rs.getString("cocktail_color");
				String cocktail_img = rs.getString("cocktail_img");
				String reco_opinion = rs.getString("reco_opinion");				
				
			
				dto = new Cock_RecoDTO(cocktail_seq, cocktail_name, cocktail_speciality, cocktail_degree, cocktail_color, cocktail_img, reco_opinion);
				cr_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return cr_list;
	}
	

	// 메인페이지에서 넘어와서 칵테일 정보 불러오기
	public void viewcock_main(String reco_opinion) {
		getConn();
		ArrayList<Cock_RecoDTO> crm_list = new ArrayList<Cock_RecoDTO>();
		try {
			String sql = "select c.cocktail_seq, c.cocktail_name, c.cocktail_speciality, c.cocktail_degree,c.cocktail_color,"  
					+" r.reco_opinion" 
					+" from tbl_cocktail c, tbl_recommend r"
					+" where c.cocktail_seq=r.cocktail_seq"
					+" and r.reco_opinion=?";
			
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, reco_opinion);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
				String cocktail_name = rs.getString("cocktail_name");
				String cocktail_speciality = rs.getString("cocktail_speciality");
				int cocktail_degree = rs.getInt("cocktail_degree");
				String cocktail_color = rs.getString("cocktail_color");
				String reco_opinion2 = rs.getString("reco_opinion");				
				
			
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
}
