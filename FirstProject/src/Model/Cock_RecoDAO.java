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
	
	//db연결 메소드
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
	
	// db종료 메소드
	public void dbClose() {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
		}
		
	}
	
	// 추천목록 불러오기
	public ArrayList<Cock_RecoDTO> viewcock_RecoDTO() {
		getConn();
		ArrayList<Cock_RecoDTO> cr_list = new ArrayList<Cock_RecoDTO>();
		try {
			String sql = "select * from tbl_recommend where reco_opinion=?";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int reco_seq = rs.getInt("reco_seq");
				int cocktail_seq = rs.getInt("cocktail_seq");
				String reco_date = rs.getString("reco_date");
				String reco_opinion = rs.getString("reco_opinion");

				dto = new Cock_RecoDTO(reco_seq, cocktail_seq, reco_date, reco_opinion);
				cr_list.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return cr_list;
	}

	// 추천목록 저장 사유:시즌별(flavor_seq)
	
	// 추천목록 저장(조회수)
}
