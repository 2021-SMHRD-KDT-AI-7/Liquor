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
	
	//DB���� �޼ҵ�
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// ī��Ű
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_a_1111";
			String db_pw = "smhrd1";
			// ����
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// DB���� �޼ҵ�
	public void dbClose() {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
		}
		
	}
	
	// Ĭ���� �������� ��������
	public ArrayList<Integer> CockSeqs() {
		getConn();
		ArrayList<Integer> seq_list = new ArrayList<Integer>();
		try {
			String sql = "select cocktail_seq from tbl_cocktail ";
				
					
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int cocktail_seq = rs.getInt("cocktail_seq");
//				String cocktail_img = rs.getString("cocktail_img");
				
				System.out.println(cocktail_seq);
				
				dto = new Cock_SeqsDTO(cocktail_seq);
				seq_list.add(dto.getCocktail_seq());
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return seq_list;
	}
	}

