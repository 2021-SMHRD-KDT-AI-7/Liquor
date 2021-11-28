package Model;

public class Cock_SeqsDTO {
	private int cocktail_seq;
	private String cocktail_img; 
	private String cocktail_name; 
	
	
	public Cock_SeqsDTO(int cocktail_seq,String cocktail_img, String cocktail_name ) {
		super();
		this.cocktail_seq = cocktail_seq;
		this.cocktail_img= cocktail_img;
		this.cocktail_name= cocktail_name;
	}


	public int getCocktail_seq() {
		return cocktail_seq;
	}


	public void setCocktail_seq(int cocktail_seq) {
		this.cocktail_seq = cocktail_seq;
	}


	public String getCocktail_img() {
		return cocktail_img;
	}


	public void setCocktail_img(String cocktail_img) {
		this.cocktail_img = cocktail_img;
	}


	public String getCocktail_name() {
		return cocktail_name;
	}


	public void setCocktail_name(String cocktail_name) {
		this.cocktail_name = cocktail_name;
	}


	
}

