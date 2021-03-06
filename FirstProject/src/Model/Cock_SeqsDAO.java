package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Cock_SeqsDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	Cock_SeqsDTO dto = null;
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
	
	// 칵테일 시퀀스만 가져오기
	public ArrayList<Cock_SeqsDTO> CockSeqs() {
		getConn();
		ArrayList<Cock_SeqsDTO> seq_list = new ArrayList<Cock_SeqsDTO>();
		try {
			String sql = "select cocktail_seq,  cocktail_img, cocktail_name from tbl_cocktail ";
				
					
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
				String cocktail_img = rs.getString("cocktail_img");
				String cocktail_name = rs.getString("cocktail_name");
				
				System.out.println(cocktail_seq);
				System.out.print(cocktail_img);
				System.out.print(cocktail_name);
				
				dto = new Cock_SeqsDTO(cocktail_seq,cocktail_img,cocktail_name);
				seq_list.add(dto);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return seq_list;
	}
	}

