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
	public ArrayList<Cock_RecoDTO> viewcock_RecoDTO() {
		getConn();
		ArrayList<Cock_RecoDTO> cr_list = new ArrayList<Cock_RecoDTO>();
		try {
			String sql = "select c.cocktail_seq, c.cocktail_name, c.cocktail_speciality, c.cocktail_degree,c.cocktail_color,"  
					+"f.flavour_seq, f.cocktail_base_liquid, f.sweet_seq, f.sour_seq, f.alcohol_seq, r.reco_opinion" 
					+" from tbl_cocktail_feature f, tbl_cocktail c, tbl_recommend r"
					+" where f.cocktail_seq=c.cocktail_seq"
					+" and c.cocktail_seq=r.cocktail_seq";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
				String cocktail_name = rs.getString("cocktail_name");
				String cocktail_speciality = rs.getString("cocktail_speciality");
				int cocktail_degree = rs.getInt("cocktail_degree");
				String cocktail_color = rs.getString("cocktail_color");
				int flavour_seq = rs.getInt("flavour_seq");
				String cocktail_base_liquid = rs.getString("cocktail_base_liquid");
				int sweet_seq = rs.getInt("sweet_seq");
				int sour_seq = rs.getInt("sour_seq");
				int alcohol_seq = rs.getInt("alcohol_seq");
				String reco_opinion = rs.getString("reco_opinion");				
				
			
				dto = new Cock_RecoDTO(cocktail_seq, cocktail_name, cocktail_speciality, cocktail_degree, cocktail_color, flavour_seq, cocktail_base_liquid, sweet_seq, sour_seq, alcohol_seq, reco_opinion);
				cr_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return cr_list;
	}
	
	// 시즌추천 칵테일 목록 불러오기
	public ArrayList<Cock_RecoDTO> viewcocktail_season() {
		getConn();
		ArrayList<Cock_RecoDTO> ses_list = new ArrayList<Cock_RecoDTO>();
		try {
			String sql = "select tbl_cocktail.cocktail_seq,tbl_cocktail.cocktail_name, "
					+ "tbl_recommend.reco_seq, tbl_recommend.reco_date, tbl_recommend.reco_opinion"
					+ " from tbl_recommend, tbl_cocktail"
					+ " where tbl_cocktail.cocktail_seq=tbl_recommend.cocktail_seq";
		
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
		
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
				String cocktail_name = rs.getString("cocktail_name");
				int reco_seq = rs.getInt("reco_seq");
				String reco_date = rs.getString("reco_date");
				String reco_opinion = rs.getString("reco_opinion");
			
				dto = new Cock_RecoDTO(cocktail_seq, cocktail_name, reco_seq, reco_date, reco_opinion);
				ses_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return ses_list;
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
				
			
				dto = new Cock_RecoDTO(cocktail_seq, cocktail_name, cocktail_speciality, cocktail_degree, cocktail_color, reco_opinion2);
				crm_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
}
