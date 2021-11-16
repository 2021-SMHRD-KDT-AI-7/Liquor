package Model;

public class RecipeDTO {
	private String ingredient_name;
	private int cocktail_seq, ingridient_amount;
	private double ingredient_ratio;
	
	public RecipeDTO(String ingredient_name, int cocktail_seq, int ingridient_amount) {
		super();
		this.ingredient_name = ingredient_name;
		this.cocktail_seq = cocktail_seq;
		this.ingridient_amount = ingridient_amount;
	} 
	
	public RecipeDTO(String ingredient_name, int cocktail_seq, double ingredient_ratio) {
		super();
		this.ingredient_name = ingredient_name;
		this.cocktail_seq = cocktail_seq;
		this.ingredient_ratio = ingredient_ratio;
	}
	public String getIngredient_name() {
		return ingredient_name;
	}
	public void setIngredient_name(String ingredient_name) {
		this.ingredient_name = ingredient_name;
	}
	public int getCocktail_seq() {
		return cocktail_seq;
	}
	public void setCocktail_seq(int cocktail_seq) {
		this.cocktail_seq = cocktail_seq;
	}
	public int getIngridient_amount() {
		return ingridient_amount;
	}
	public void setIngridient_amount(int ingridient_amount) {
		this.ingridient_amount = ingridient_amount;
	}
	public double getIngredient_ratio() {
		return ingredient_ratio;
	}
	public void setIngredient_ratio(double ingredient_ratio) {
		this.ingredient_ratio = ingredient_ratio;
	}
	

}
