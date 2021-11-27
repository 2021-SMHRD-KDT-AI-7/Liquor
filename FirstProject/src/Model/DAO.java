package Model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int cnt = 0;
	MemberDTO mdto;
	RecipeDTO rdto = null;

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
	public RecipeDTO loadRecipe(int seq) {
		ArrayList<String> ignames = new ArrayList<>();// 성분이름
		ArrayList<Integer> amounts = new ArrayList<>();// 용량
		ArrayList<String> mixings = new ArrayList<>();// 믹스 설명
		String name="";
		String img = "";
		
		conn();
		try {

			String sql = "select cocktail_seq, cocktail_name, cocktail_img from tbl_cocktail where cocktail_seq=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();

			if (rs.next()) {
				name=rs.getString("cocktail_name"); // 칵테일 이름
				
				img=rs.getNString("cocktail_img");
			}

//			returns.add(names);
//			returns.add(seqs);
//			returns.add(imgs);

			sql = "select ingredient_name, ingredient_amount, ingredient_mixing from tbl_cocktail_recipe where cocktail_seq=?";
			
				ps = conn.prepareStatement(sql);
				ps.setInt(1, seq);
				rs = ps.executeQuery();
				String igName = "";
				String igAmount = "";
				String igMixing = "";
				while (rs.next()) {
					if (igName.length() < 2) {
						igName = igName + ";" + rs.getString("ingredient_name"); // 성분 명
						igAmount = igAmount + ";" + rs.getInt("ingredient_amount");// 성븐 양
						igMixing = igMixing + ";" + rs.getString("ingredient_mixing");// 믹스 방법
					}
				}


				sql = "select ingredient_name, ingredient_amount, ingredient_mixing from tbl_cocktail_recipe where cocktail_seq=?";
	
					ps = conn.prepareStatement(sql);
					ps.setInt(1, seq);
					rs = ps.executeQuery();
					while (rs.next()) {
						ignames.add(rs.getString("ingredient_name")); // 성분 명
						amounts.add(rs.getInt("ingredient_amount"));
						mixings.add(rs.getString("ingredient_mixing"));
					}
					
				

				rdto = new RecipeDTO(name, seq, img, ignames, amounts, mixings);
				// name seq img <ignames> <amounts> <mixings>
				

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rdto;
	}

	// 불러온 레시피 나만의 레시피에 저장 메소드(@@@@@@@@@@@@@@@@@@@@)(@@@DB에서 seq이름 확인해서 만들기@@@), 웹
	// 만들고 나서 다시 수정할 예정
	public int saveMyRecipe(MyRecipeDTO rdto) {
		conn();
		try {
			String ig_name = rdto.getMy_ingredient_name();
			String ig_amount = rdto.getMy_ingredient_amount().replace(" ", ";");
			String ig_method = rdto.getMy_ingredient_mixing();
			String u_id = rdto.getU_id();
			String myCocktailName = rdto.getMy_cocktail_name();
			String sql = "insert into tbl_my_recipe values(tbl_my_recipe_SEQ.nextval, ?, ?, ?,?,?)";
			//
			// my_ingredient_name(1), my_ingredient_amount(2), my_ingredient_method
			// u_id, my_cocktail_name
			ps = conn.prepareStatement(sql);
			ps.setString(1, ig_name);
			ps.setString(2, ig_amount);
			ps.setString(3, ig_method);
			ps.setString(4, u_id);
			ps.setString(5, myCocktailName);

			// 수정 예정
			String[] d = {};
			String e = "";
			for (int i = 0; i < d.length; i++) {
				if (i == d.length - 1)
					e = e + d[i];
				else
					e = e + d[i] + ",";
			}
			System.out.println(e);

			cnt = ps.executeUpdate();

			// 1. "설탕물, 콜라, 커피, 진, 럼, 오렌지주스"
			// 2. "30ml, 50ml, 10ml, 50ml, 30ml, 20ml"

			// 위의 형태로 저장해줘야함.
			// transform() 메소드 역순으로 진행
			// 위에서는 ml 단위 넣었지만 그냥 비율만 해서 넣는게 맞을듯

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 저장된 나만의 레시피 불러오는 메소드
	// 용량들 받아서 각각의 비율 구해서 넘겨줄것같긴 함
	public ArrayList<String[]> loadMyRecipeList(String u_id) {
		ArrayList<String[]> recipeList = new ArrayList<String[]>();
		conn();
		try {
			String sql = "select my_recipe_seq, my_cocktail_name from tbl_my_recipe where u_id = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, u_id);
			System.out.println("dao 로드마이레시피 들어옴");

			rs = ps.executeQuery();
			while (rs.next()) {
				String a = rs.getString(1);
				String b = rs.getString(2);
				String[] recipe = new String[2];
				recipe[0] = a;
				recipe[1] = b;
				recipeList.add(recipe);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recipeList;
	}
	
	
	public ArrayList<String[]> loadMyRecipe(String my_recipe_seq) {

		ArrayList<String[]> recipe = new ArrayList<String[]>();
		conn();
		try {
			String sql = "select my_ingredient_name, my_ingredient_amount from tbl_my_recipe where my_recipe_seq = ?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, my_recipe_seq);
			System.out.println("dao 로드마이레시피 들어옴");

			rs = ps.executeQuery();
			if (rs.next()) {
				String a = rs.getString(1);
				String b = rs.getString(2);

				recipe = transform(a, b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recipe;
	}

	// 레시피 변환 메소드
	// 나만의 레시피 칼럼 하나에 들어간 여러 재료, 여러 용량들을 재료별로 구분해서 ArrayList로 만들어서 반환해줌
	public ArrayList<String[]> transform(String a, String c) {
		System.out.println("a>> "+a);
		System.out.println("c>> "+c);
		String[] b = a.split("\\+");
		String[] d = c.split(";");
		System.out.println("b 길이>>"+b.length);
		System.out.println("d 길이>>"+d.length);

		for (int i = 0; i < b.length; i++) {
			System.out.println(b[i].trim()); // .trim() >> 문자열 앞뒤로 여백 제거
		}
		for (int i = 0; i < d.length; i++) {
			System.out.println(d[i].trim()); // .trim() >> 문자열 앞뒤로 여백 제거
		}
		ArrayList<String[]> arr = new ArrayList<>();
		for (int i = 0; i < b.length; i++) {
			String[] e = { b[i].trim(), d[i].trim() };
			arr.add(e);
		}
		return arr;
	}

	// 나만의 레시피 수정 메소드
	public int updateMyRecipe(MyRecipeDTO myRecipeDTO) {
		conn();
		try {
			
			String sql = "update tbl_my_recipe set my_ingredient_name=?, my_ingredient_amount=?, my_ingredient_method=? where my_recipe_seq=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, myRecipeDTO.getMy_ingredient_name());
			ps.setString(2, myRecipeDTO.getMy_ingredient_amount());
			ps.setString(3, myRecipeDTO.getMy_ingredient_mixing());
			ps.setInt(4, myRecipeDTO.getMy_recipe_seq());

			cnt = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 나만의 레시피 클릭 시 정보 보여주는 메소드
	public ArrayList<String[]> showMyRecipeInfo(String my_recipe_seq) {
		conn();
		ArrayList<String[]> recipe = null;
		try {
			String sql = "select my_ingredient_name, my_ingredient_amount from tbl_my_recipe where my_recipe_seq = ?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, my_recipe_seq);

			rs = ps.executeQuery();
			if (rs.next()) {
				String a = rs.getString(1);
				String b = rs.getString(2);

				recipe = transform(a, b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recipe;
	}

	// 나만의 레시피 개별삭제하는 메소드
	public int deleteMyRecipe(String my_recipe_seq) {
		conn();
		try {
			String sql = "delete from tbl_my_recipe where my_recipe_seq=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, my_recipe_seq);

			cnt = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 회원가입. 가입 성공하면 로그인까지 진행. 세션에 객체 던져줌
	public MemberDTO join(String id, String pw, String name, String birth, String gender) {
		try {
			conn();
			String admin_yn = "n";
			// public MemberDTO(String id, String pw, String name, String birth, String
			// gender, String admin_yn, String join_date)

			String insertSql = "insert into tbl_user values (?, ?, ?,?,?,sysdate,?)";

			ps = conn.prepareStatement(insertSql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, birth);
			ps.setString(5, gender);
			ps.setString(6, admin_yn);

			cnt = 0;
			// executeUpdate : 수행결과로 int타입의 값을 반환, select문을 제외한 다른 구문을 수행 할 때 사용하는 함수

//			String selectSql = "select bookmark_id from member where id=?";
//			ps = conn.prepareStatement(selectSql);
			rs = ps.executeQuery();
			if (rs.next()) {
				mdto = login(id, pw);
			} else {// 회원가입 실패, 부족한 값을 입력하라고 출력시킬 예정
				System.out.println("이게 떠야 제대로 된 실패임");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mdto;

	}

	// 로그인 메소드
	// id pw, birth, name gender, admin, joindate 다 객체로 묶어서 세션에 던져줌
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
				pw = rs.getString(2);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				String gender = rs.getString(5);
				String admin_yn = rs.getString(6);
				String join_date = rs.getString(7);
				mdto = new MemberDTO(id, pw, name, birth, gender, admin_yn, join_date);
				// public MemberDTO(String id, String pw, String name, String birth, String
				// gender, String admin_yn, String join_date)
			} else {
				System.out.println("로그인 실패");
			}
			return mdto;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return mdto;
	}

	// 북마크 리스트 반환하는 메소드
	public ArrayList<String[]> viewBookmark(String u_id) {
		ArrayList<String[]> cocktail_list = new ArrayList<>();
		ArrayList<Integer> seq_list = new ArrayList<>();
		String sql = "select cocktail_seq from my_cocktail where u_id = ?";
		//String sql = "select cocktail_seq, cocktail_name from tbl_cocktail where cocktail_seq in (select cocktail_seq from my_cocktail where u_id=?)";
		conn();
		System.out.println("일단 뷰 들어옴");
		try {
			System.out.println("아이디는>>"+u_id);
			ps = conn.prepareStatement(sql);
			ps.setString(1, u_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("WHILE문 들어옴. 한줄에 칵테일 하나씩");
				int seq = rs.getInt("cocktail_seq");
				seq_list.add(seq);
				System.out.println("seq="+seq);
			}
			if(seq_list.size()>0) {
				
				System.out.println("if문 들어옴");
				for(int i=0;i<seq_list.size();i++) {
					System.out.println("for문 들어옴");
					sql="select cocktail_name, cocktail_img from tbl_cocktail where cocktail_seq = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, seq_list.get(i));
					rs=ps.executeQuery();
					if(rs.next()) {
						System.out.println("for문 안에 if문 들어옴");
						String name = rs.getString("cocktail_name");
						String img = rs.getString("cocktail_img");
						String[] cocktail_set = {Integer.toString(seq_list.get(i)), name, img };
						cocktail_list.add(cocktail_set);
					}
				}
				
			}else {
				System.out.println("결과 없음");
			}
			String cocktail_seq = rs.getString(1);
			String cocktail_name = rs.getString(2);

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
					+ " values(tbl_cocktail_SEQ.nextval,?, ?, ?,?, sysdate)";
			// seq 자리에 시퀀스이름 추가하기
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

			e.printStackTrace();
		}

	}

	public int saveMyRecipe(String igname, String igamount, String igmethod, String uid, String ctname) {
		conn();
		String sql = "insert into tbl_my_recipe values (tbl_my_recipe_SEQ.nextval, ?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			igamount.replace(" ", ";");
			cnt = ps.executeUpdate();
			ps.setString(1, igname);
			ps.setString(2, igamount);
			ps.setString(3, igmethod);
			ps.setString(4, uid);
			ps.setString(5, ctname);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// csv 읽어오는 메소드
	public ArrayList<String[]> readCSV(String path) {

		BufferedReader br = null;
		ArrayList<String[]> reciList = new ArrayList<>();

		try {
			br = Files.newBufferedReader(Paths.get(path));
			// Charset.forName("UTF-8");
			String line = "";

			while ((line = br.readLine()) != null) {

				String array[] = line.split(",");
				// 배열에서 리스트 반환
				reciList.add(array);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return reciList;
	}

	// 레시피 받아와서 비율 구해주고 어레이리스트로 반환하는 메소드
	// cocktail_seq 받아와서 ArrayList<ArrayList>로 반환
	// 내부 ArrayList들은 각각 String, int를 담고있음
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
			// select문으로 rs 받아와서 name이랑 amount 리스트 작성

			int sum = 0;
			for (int i = 0; i < ingredient_amount_list.size(); i++) {
				sum += ingredient_amount_list.get(i);

			}
			// 페이지에서 필요한건 amount가 아니라 ratio라서 변환하기 위해
			// 전체 amount를 구해서

			for (int i = 0; i < ingredient_amount_list.size(); i++) {
				int ratio = (ingredient_amount_list.get(i) * 100 / sum);
				ingredient_ratio_list.add(ratio);
			}
			// 각각의 amount를 전체값으로 나눠서 비율 구하고 ratio_list 작성

			returns.add(ingredient_name_list);
			returns.add(ingredient_ratio_list);
			// 위에서 작성한 name, ratio 리스트를 반환해줄 ArrayList에 저장

		} catch (Exception e) {
			System.out.println("실패했음");

			e.printStackTrace();
		} finally {
			close();
		}
		return returns;
	}

	// 특징으로 검색해주는 메소드
	public ArrayList<CocktailDTO> searchBySpeciality(String speciality){
		conn();
		ArrayList<CocktailDTO> returns = new ArrayList<>();
		try {
			speciality = "%" + speciality + "%";
			String sql = "select cocktail_seq, cocktail_name, cocktail_color, cocktail_img from tbl_cocktail where cocktail_speciality like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, speciality);
			System.out.println("flavor="+speciality);
			
			//String name, String speciality, String color, String reg_date, String u_id, int cocktail_sequence
			
			rs = ps.executeQuery();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String named = rs.getString(2);
				String color = rs.getString(3);
				String img = rs.getString(4);
				CocktailDTO cdto = new CocktailDTO(named, speciality, color, seq);
				System.out.println("n개째 가져오는중");

			}
			System.out.println("seqs 길이");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return returns;
	}
	
	
	public ArrayList<CocktailDTO> searchByColor(String color){
		conn();
		ArrayList<CocktailDTO> returns = new ArrayList<>();
		try {
			color = "%" + color + "%";
			String sql = "select cocktail_seq, cocktail_name, cocktail_color, cocktail_img from tbl_cocktail where cocktail_speciality like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, color);
			System.out.println("flavor="+color);

			rs = ps.executeQuery();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String named = rs.getString(2);
				color = rs.getString(3);
				String img = rs.getString(4);
				//CocktailDTO cdto = new CocktailDTO(named, speciality, color, seq);
				System.out.println("n개째 가져오는중");

			}
			System.out.println("seqs 길이");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return returns;
	}
	
	
	
	
	
	public ArrayList<ArrayList> searchByName(String name) {
		conn();
		ArrayList<ArrayList> returns = new ArrayList<>();
		ArrayList<String> names = new ArrayList<>();
		ArrayList<String> colors = new ArrayList<>();
		ArrayList<Integer> seqs = new ArrayList<>();
		ArrayList<String> imgs = new ArrayList<>();
		try {
			String sname = "%" + name + "%";
			String sql = "select cocktail_seq, cocktail_name, cocktail_color, cocktail_img from tbl_cocktail where cocktail_name like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sname);
			System.out.println("sname="+sname);

			rs = ps.executeQuery();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String named = rs.getString(2);
				String color = rs.getString(3);
				String img = rs.getString(4);
				seqs.add(seq);
				names.add(named);
				colors.add(color);
				imgs.add(img);
				System.out.println("n개째 가져오는중");

			}
			System.out.println("seqs 길이"+seqs.size());
			returns.add(seqs);
			returns.add(names);
			returns.add(colors);
			returns.add(imgs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return returns;

	}

	// 북마크 추가하는 메소드
	public void addBookmark(int cocktail_seq, String id) {
		conn();
		String sql = "insert into my_cocktail values(my_cocktail_SEQ.nextval, ?, sysdate,?,?)";
		String comm = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cocktail_seq);
			ps.setString(2, id);
			ps.setString(3, comm);
			cnt = ps.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	// 코멘트가 있을 때 북마크에 코멘트까지 같이 추가해주는 메소드
	public void addBookmark(int cocktail_seq, String comm, String id) {
		conn();
		String sql = "insert into my_cocktail values(my_cocktail_SEQ.nextval, ?, sysdate,?,?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cocktail_seq);
			ps.setString(2, id);
			ps.setString(3, comm);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public FeatureDTO viewFeature(int seq) {
		//	public FeatureDTO(int cocktail_seq, int sweet, int sour, String sparkle, String base, String alcohol,
		//String flavor)
		FeatureDTO fdto=null;
		conn();
		String sql = "select cocktail_seq, sparkle_yn, cocktail_base_liquid, sweet_seq, sour_seq, alcohol_seq, flavour_seq from  tbl_cocktail_feature where cocktail_seq=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, seq);
			rs=ps.executeQuery();
			if(rs.next()) {
				seq=rs.getInt(1);
				String sparkle = rs.getString(2);
				String base = rs.getString(3);
				int sweet = rs.getInt(4);
				int sour = rs.getInt(5);
				String alcohol = rs.getString(6);
				String flavor = rs.getString(7);
				fdto=new FeatureDTO(seq, sweet, sour, sparkle, base, alcohol, flavor);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return fdto;
	}
}
