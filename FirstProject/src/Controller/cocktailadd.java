package Controller;

import Model.JH_DAO;

public class cocktailadd {

	public static void main(String[] args) {
		
//		(String cocktail_name, String cocktail_speciality, 
		//int cocktail_degree, String cocktail_color, String ingredient_name, 
		//int ingredient_amount, String ingredient_caution) {
		JH_DAO dao=new JH_DAO();
		//dao.addCocktail(�̸�, Ư¡, ����, ��, ����� "  , , , , ",��� �뷮 "  , , , , ,", ���ǻ���);
		dao.addCocktail("���ƹ�ũ","�ε巯��, Ŀ����", 12, "Ŀ�ǻ�", "��, ����", "10, 20", null);
		//dao.addCocktail("�����þ�","����, Ŀ����", 12, "black", "��, Ŀ��, �÷�", "10, 20, 5", null);
	}

}
