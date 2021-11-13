package Model;

public class MyRecipeDTO {

	private int my_recipe_seq; // ���� ������ ����
	private String my_ingredient_name; // ���� ����
	private int my_ingredient_amount; // ���� ���Է�
	private String my_ingredient_method; // ���� ���
	private String u_id; // �ۼ��� ���̵�
	private String chosen_yn; // ��õ ����
	private String chosen_date; // ��õ ��¥
	
	public MyRecipeDTO(int my_recipe_seq, String my_ingredient_name, int my_ingredient_amount,
			String my_ingredient_method, String u_id, String chosen_yn, String chosen_date) {
		
		this.my_recipe_seq = my_recipe_seq;
		this.my_ingredient_name = my_ingredient_name;
		this.my_ingredient_amount = my_ingredient_amount;
		this.my_ingredient_method = my_ingredient_method;
		this.u_id = u_id;
		this.chosen_yn = chosen_yn;
		this.chosen_date = chosen_date;		
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

	public int getMy_ingredient_amount() {
		return my_ingredient_amount;
	}

	public void setMy_ingredient_amount(int my_ingredient_amount) {
		this.my_ingredient_amount = my_ingredient_amount;
	}

	public String getMy_ingredient_method() {
		return my_ingredient_method;
	}

	public void setMy_ingredient_method(String my_ingredient_method) {
		this.my_ingredient_method = my_ingredient_method;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getChosen_yn() {
		return chosen_yn;
	}

	public void setChosen_yn(String chosen_yn) {
		this.chosen_yn = chosen_yn;
	}

	public String getChosen_date() {
		return chosen_date;
	}

	public void setChosen_date(String chosen_date) {
		this.chosen_date = chosen_date;
	}
	
}
