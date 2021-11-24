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

	// ������ �ҷ����� �޼ҵ�
	// ArrayList �ȿ� ArrayList ����. �ҷ��ͼ� �� �� �����Ұ� 
	public ArrayList<ArrayList> loadRecipe(String id) {
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> seqs = new ArrayList<>();
		ArrayList<String> cautions = new ArrayList<>();
		ArrayList<String> imgs = new ArrayList<>();
		ArrayList<String> ig_names = new ArrayList<>();
		ArrayList<Integer> amounts = new ArrayList<>();
		ArrayList<String> mixings = new ArrayList<>();
		ArrayList<ArrayList> returns = new ArrayList<>();
 		conn();
		try {
			
			
				String sql="select cocktail_seq, cocktail_name, cocktail_img from tbl_cocktail where cocktail_img is not null";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					names.add(rs.getString("cocktail_name")); // ���� ��
					seqs.add(rs.getInt("cocktail_seq")); // ���� ��
					imgs.add(rs.getNString("cocktail_img"));
				}
			
			System.out.println("names len"+names.size());
			System.out.println("seqs len"+seqs.size());
			
			returns.add(names);
			returns.add(seqs);
			returns.add(imgs);
			
			sql="select ingredient_name, ingredient_amount, ingredient_mixing from tbl_cocktail_recipe where cocktail_seq=?";
			for(int i=0;i<seqs.size();i++) {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, seqs.get(i));
			rs=ps.executeQuery();
			while(rs.next()) {
				ig_names.add(rs.getString("ingredient_name")); // ���� ��
				amounts.add(rs.getInt("ingredient_amount"));
				mixings.add(rs.getString("ingredient_mixing"));
				}
			}
			System.out.println("imgs len"+imgs.size());
			returns.add(ig_names);
			returns.add(amounts);
			returns.add(mixings);
			System.out.println("returns len"+returns.size());
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return returns;
	}
	
	// �ҷ��� ������ ������ �����ǿ� ���� �޼ҵ�(@@@@@@@@@@@@@@@@@@@@)(@@@DB���� seq�̸� Ȯ���ؼ� �����@@@), �� ����� ���� �ٽ� ������ ����
	public int saveMyRecipe() {
		conn();
		try {
			 String sql = "insert into tbl_my_recipe values(recipe_seq.nextval, ?, ?, ?)";
	         
	         ps = conn.prepareStatement(sql);
	         
//	         ps.setInt(1, crdto.getCocktail_seq()); // Ĭ���� ����
//	         ps.setString(2, crdto.getIngredient_name()); // ���� ��
//	         ps.setInt(3, crdto.getIngredient_amount()); // ���� �� 
	         
	         // ���� ����
	         String[] d= {};
	         String e="";
	         for(int i=0;i<d.length;i++) {
	            if(i==d.length-1) e=e+d[i];
	            else e=e+d[i]+",";
	         }
	         System.out.println(e);
	         
	         cnt = ps.executeUpdate();
	         
			//my_ingredient_name(1), my_ingredient_amount(2), my_ingredient_method
			//1. "������, �ݶ�, Ŀ��, ��, ��, �������ֽ�"
			//2. "30ml, 50ml, 10ml, 50ml, 30ml, 20ml"
			
			//���� ���·� �����������.
			//transform() �޼ҵ� �������� ����
			//�������� ml ���� �־����� �׳� ������ �ؼ� �ִ°� ������	
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return cnt;
	}
	
	// ����� ������ ������ �ҷ����� �޼ҵ�
	// �뷮�� �޾Ƽ� ������ ���� ���ؼ� �Ѱ��ٰͰ��� ��
	public ArrayList<String[]> loadMyRecipe(String my_recipe_seq) {
		
		ArrayList<String[]> recipe = new ArrayList<String[]>();
		conn();
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
	
	// ������ ��ȯ �޼ҵ� 
	// ������ ������ Į�� �ϳ��� �� ���� ���, ���� �뷮���� ��Ằ�� �����ؼ� ArrayList�� ���� ��ȯ����
	public ArrayList<String[]> transform(String a, String c) {
		
		String[] b=a.split(",");
		String[] d=c.split(",");
		
		for(int i=0;i<b.length;i++) {
			System.out.println(b[i].trim()); //.trim()  >> ���ڿ� �յڷ� ���� ����
		}
		for(int i=0;i<d.length;i++) {
			System.out.println(d[i].trim()); //.trim()  >> ���ڿ� �յڷ� ���� ����
		}
		ArrayList<String[]> arr=new ArrayList<String[]>();
		for(int i=0;i<b.length;i++) {
			String[] e= {b[i].trim(), d[i].trim()};
			arr.add(e);
		}
		return arr;
	}	
	
	// ������ ������ ���� �޼ҵ�
	public int updateMyRecipe(MyRecipeDTO myRecipeDTO) {
	      conn();
	      try {
	         String sql = "update tbl_my_recipe set my_ingredient_name=?, my_ingredient_amount=?, my_ingredient_method=? where my_recipe_seq=?";
	         
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, myRecipeDTO.getMy_ingredient_name());
	         ps.setInt(2, myRecipeDTO.getMy_ingredient_amount());
	         ps.setString(3, myRecipeDTO.getMy_ingredient_method());
	         ps.setInt(4, myRecipeDTO.getMy_recipe_seq());
	         
	         cnt = ps.executeUpdate();
	         
	      }catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }return cnt;
	   }
		
	// ������ ������ Ŭ�� �� ���� �����ִ� �޼ҵ�
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
		
	// ������ ������ ���������ϴ� �޼ҵ�
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
	
	// ȸ������. ���� �����ϸ� �α��α��� ����. ���ǿ� ��ü ������
	public MemberDTO join(String id, String pw, String name, String birth, String gender) {
		try {
			conn();
			String admin_yn="n";
			//public MemberDTO(String id, String pw, String name, String birth, String gender, String admin_yn, String join_date)

			String insertSql = "insert into tbl_user values (?, ?, ?,?,?,sysdate,?)";
			
			ps = conn.prepareStatement(insertSql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, birth);
			ps.setString(5, gender);
			ps.setString(6, admin_yn);
			
			cnt = 0;
			// executeUpdate : �������� intŸ���� ���� ��ȯ, select���� ������ �ٸ� ������ ���� �� �� ����ϴ� �Լ�
			
//			String selectSql = "select bookmark_id from member where id=?";
//			ps = conn.prepareStatement(selectSql);
			rs = ps.executeQuery();
			if (rs.next()) {				
				mdto=login(id, pw);
			}else {//ȸ������ ����, ������ ���� �Է��϶�� ��½�ų ����
				System.out.println("�̰� ���� ����� �� ������");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mdto;

	}
	
	// �α��� �޼ҵ�
	// id pw, birth, name gender, admin, joindate �� ��ü�� ��� ���ǿ� ������
	public MemberDTO login(String id, String pw) {
		try {
			conn();

			String sql = "select u_id, u_pwd, u_name, u_birthdate, u_gender, admin_yn,u_joindate from tbl_user where u_id=? and u_pwd=?";
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
			}else {
				System.out.println("�α��� ����");
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
