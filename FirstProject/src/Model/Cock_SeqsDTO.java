package Model;

public class Cock_SeqsDTO {
	private int cocktail_seq;
	private String cocktail_img; 
	
	
	public Cock_SeqsDTO(int cocktail_seq,String cocktail_img ) {
		super();
		this.cocktail_seq = cocktail_seq;
		this.cocktail_img= cocktail_img;
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

	
}

