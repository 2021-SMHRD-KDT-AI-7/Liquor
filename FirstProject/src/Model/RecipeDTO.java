package Model;

import java.util.ArrayList;

public class RecipeDTO {
	private String ingredient_name;
	private int cocktail_seq, ingridient_amount;
	private double ingredient_ratio;
	
	private ArrayList<String> ingredients=new ArrayList<>();
	public ArrayList<String> getIngredients() {
		return ingredients;
	}

	public void setIngredients(ArrayList<String> ingredients) {
		this.ingredients = ingredients;
	}

	public ArrayList<String> getMixings() {
		return mixings;
	}

	public void setMixings(ArrayList<String> mixings) {
		this.mixings = mixings;
	}

	public ArrayList<Integer> getAmounts() {
		return amounts;
	}

	public void setAmounts(ArrayList<Integer> amounts) {
		this.amounts = amounts;
	}
	private ArrayList<String> mixings=new ArrayList<>();
	private ArrayList<Integer> amounts=new ArrayList<>();
	private String cocktail_name;
	private String img;
	private String ingredient_mixing;
	
	
	public RecipeDTO(String cocktail_name, int cocktail_seq, String img, ArrayList<String> ingridients,ArrayList<Integer> amounts,ArrayList<String> mixings) {
		this.cocktail_name=cocktail_name;
		this.cocktail_seq=cocktail_seq;
		this.img=img;
		this.ingredients=ingridients;
		this.amounts=amounts;
		this.mixings=mixings;
	}
	
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
	public String getCocktail_name() {
		return cocktail_name;
	}
	public void setCocktail_name(String ingredient_name) {
		this.cocktail_name = ingredient_name;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	

}
