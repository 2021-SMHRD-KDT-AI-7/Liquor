package Model;

public class MyRecipeDTO {

	private int my_recipe_seq; // 나의 레시피 순번
	private String my_ingredient_name; // 나의 성분
	private String my_ingredient_amount; // 나의 투입량
	private String my_ingredient_method; // 나의 비법
	private String my_cocktail_name;
	private String u_id;
	
	public MyRecipeDTO(int my_recipe_seq, String my_ingredient_name, String my_ingredient_amount,
			String my_ingredient_method,String my_cocktail_name,String u_id) {
	
		this.my_recipe_seq = my_recipe_seq;
		this.my_ingredient_name = my_ingredient_name;
		this.my_ingredient_amount = my_ingredient_amount;
		this.my_ingredient_method = my_ingredient_method;
		this.my_cocktail_name = my_cocktail_name;
		this.u_id=u_id;
	}


	public String getMy_cocktail_name() {
		return my_cocktail_name;
	}


	public void setMy_cocktail_name(String my_cocktail_name) {
		this.my_cocktail_name = my_cocktail_name;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public int getMy_recipe_seq() {
		return my_recipe_seq;
	}

	public void setMy_recipe_seq(int my_recipe_seq) {
		this.my_recipe_seq = my_recipe_seq;
	}

	public String getMy_ingredient_name() {
		return my_ingredient_name;
	}

	public void setMy_ingredient_name(String my_ingredient_name) {
		this.my_ingredient_name = my_ingredient_name;
	}

	public String getMy_ingredient_amount() {
		return my_ingredient_amount;
	}

	public void setMy_ingredient_amount(String my_ingredient_amount) {
		this.my_ingredient_amount = my_ingredient_amount;
	}

	public String getMy_ingredient_method() {
		return my_ingredient_method;
	}

	public void setMy_ingredient_method(String my_ingredient_method) {
		this.my_ingredient_method = my_ingredient_method;
	}

	
}
