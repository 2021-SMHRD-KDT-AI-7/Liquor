package Controller;

import java.util.ArrayList;

import Model.JH_DAO;

public class cocktailadd {

	public static void main(String[] args) {
		
//		(String cocktail_name, String cocktail_speciality, 
		//int cocktail_degree, String cocktail_color, String ingredient_name, 
		//int ingredient_amount, String ingredient_caution) {
		JH_DAO dao=new JH_DAO();
		//dao.addCocktail(이름, 특징, 도수, 색, 재료목록 "  , , , , ",재료 용량 "  , , , , ,", 주의사항);
		//dao.addCocktail("깔루아밀크","부드러움, 커피향", 12, "커피색", "진, 깔루아", "10, 20", null);
//		dao.addCocktail("블랙러시안","독주, 커피향", 12, "black", "진; 커피; 시럽", "10; 20; 5", null);
		String name, speciality,color,caution,  ing_name,amount;
		int degree;
		 
		ArrayList<String[]> rl=dao.readCSV("C:\\Users\\smhrd\\Desktop\\recipe.csv");
		for(int i=1;i<rl.size();i++) {
			name=rl.get(i)[0];
			speciality=rl.get(i)[1];
			degree=Integer.parseInt(rl.get(i)[2]);
			color = rl.get(i)[3];
			ing_name=rl.get(i)[4];
			amount=rl.get(i)[5];
			
			System.out.println(name);
			System.out.println(speciality);
			System.out.println(degree);
			System.out.println(color);
			System.out.println(ing_name);
			System.out.println(amount);
			dao.addCocktail(name, speciality, degree, color, ing_name, amount, null);
		}
			
		
	}

}
