package Controller;

import Model.JH_DAO;

public class cocktailadd {

	public static void main(String[] args) {
		
//		(String cocktail_name, String cocktail_speciality, 
		//int cocktail_degree, String cocktail_color, String ingredient_name, 
		//int ingredient_amount, String ingredient_caution) {
		JH_DAO dao=new JH_DAO();
		//dao.addCocktail(이름, 특징, 도수, 색, 재료목록 "  , , , , ",재료 용량 "  , , , , ,", 주의사항);
		dao.addCocktail("깔루아밀크","부드러움, 커피향", 12, "커피색", "진, 깔루아", "10, 20", null);
		//dao.addCocktail("블랙러시안","독주, 커피향", 12, "black", "진, 커피, 시럽", "10, 20, 5", null);
	}

}
