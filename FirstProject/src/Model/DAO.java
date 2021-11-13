package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	// 레시피 불러오는 메소드
	// ArrayList 안에 ArrayList 형태. 불러와서 쓸 때 조심할것 
	public ArrayList<ArrayList> loadRecipe(String cocktail_seq) {
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> amounts = new ArrayList<>();
		ArrayList<String> cautions = new ArrayList<>();
		ArrayList<ArrayList> returns = new ArrayList<>();
 		conn();
		try {
			String sql = "select * from tbl_cocktail_recipe where cocktail_seq = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, cocktail_seq);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				names.add(rs.getString("ingredient_name")); // 성분 명
				amounts.add(rs.getInt("ingredient_amount")); // 투입 량
				cautions.add(rs.getString("ingredient_caution")); // 주의사항			
				}
			returns.add(names);
			returns.add(amounts);
			returns.add(cautions);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return returns;
	}
	
	// 불러온 레시피 나만의 레시피에 저장 메소드(@@@@@@@@@@@@@@@@@@@@)
	public void saveMyRecipe() {
		conn();
		try {
			String sql = "insert into tbl_my_recipe";
			//my_ingredient_name(1), my_ingredient_amount(2), my_ingredient_method
			//1. "설탕물, 콜라, 커피, 진, 럼, 오렌지주스"
			//2. "30ml, 50ml, 10ml, 50ml, 30ml, 20ml"
			
			//위의 형태로 저장해줘야함.
			//transform() 메소드 역순으로 진행
			//위에서는 ml 단위 넣었지만 그냥 비율만 해서 넣는게 맞을듯
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	// 저장된 나만의 레시피 불러오는 메소드 (@@@@@@현주형 끝날 시 수정하기)
	// 용량들 받아서 각각의 비율 구해서 넘겨줄것같긴 함
	public void loadMyRecipe(String my_recipe_seq) {
		conn();
		try {
			String sql = "select my_ingredient_name, my_ingredient_amount from tbl_my_recipe where my_recipe_seq = ?";
			
			ps = conn.prepareStatement(sql);			
			ps.setString(1, my_recipe_seq);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String a = rs.getString(1);
				String b = rs.getString(2);
				
				ArrayList<String[]> recipe = transform(a, b);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		// 리턴 구조(현주형이 하는일 끝나면 추가예정), 현주형이 정하는 변수명
	}
	
	// 레시피 변환 메소드 
	// 나만의 레시피 칼럼 하나에 들어간 여러 재료, 여러 용량들을 재료별로 구분해서 ArrayList로 만들어서 반환해줌
	public ArrayList<String[]> transform(String a, String c) {
		
		String[] b=a.split(",");
		String[] d=c.split(",");
		
		for(int i=0;i<b.length;i++) {
			System.out.println(b[i].trim()); //.trim()  >> 문자열 앞뒤로 여백 제거
		}
		for(int i=0;i<d.length;i++) {
			System.out.println(d[i].trim()); //.trim()  >> 문자열 앞뒤로 여백 제거
		}
		ArrayList<String[]> arr=new ArrayList<String[]>();
		for(int i=0;i<b.length;i++) {
			String[] e= {b[i].trim(), d[i].trim()};
			arr.add(e);
		}
		return arr;
	}
	
		
	// 레시피 수정본 저장 메소드
		
		
	// 저장된 나만의 레시피 수정 메소드
		
		
	// 나만의 레시피 클릭 시 정보 보여주는 메소드
	public ArrayList<String[]> showMyRecipeInfo(String my_recipe_seq) {
		conn();
		ArrayList<String[]> recipe = null;
		try {
			String sql = "select my_ingredient_name, my_ingredient_amount from tbl_my_recipe where my_recipe_seq = ?";
			
			ps = conn.prepareStatement(sql);			
			ps.setString(1, my_recipe_seq);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String a = rs.getString(1);
				String b = rs.getString(2);
				
				recipe = transform(a, b);
			}	
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return recipe;
	}
		
	// 나만의 레시피 개별삭제하는 메소드
	public int deleteMyRecipe(String my_recipe_seq) {
		conn();
		try {
			String sql = "delete from tbl_my_recipe where my_recipe_seq=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, my_recipe_seq);
			
			cnt = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
		//회원가입. 가입 성공하면 로그인까지 진행. 세션에 객체 던져줌
	public MemberDTO join(String id, String pw, String name, String birth, String gender,String admin_yn) {
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
			}else {//회원가입 실패, 부족한 값을 입력하라고 출력시킬 예정
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mdto;

	}
	//로그인 메소드
	//id pw, birth, name gender, admin, joindate 다 객체로 묶어서 세션에 던져줌
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
