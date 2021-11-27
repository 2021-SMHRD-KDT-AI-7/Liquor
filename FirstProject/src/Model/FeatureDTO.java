package Model;

public class FeatureDTO {
	private int cocktail_seq, sweet, sour;
	private String sparkle, base, alcohol, flavor;
	
	
	
	public FeatureDTO(int cocktail_seq, int sweet, int sour, String sparkle, String base, String alcohol, String flavor) {

		this.cocktail_seq = cocktail_seq;
		this.sweet = sweet;
		this.sour = sour;
		this.sparkle = sparkle;
		this.base = base;
		this.alcohol = alcohol;
		this.flavor = flavor;
	}
	public int getCocktail_seq() {
		return cocktail_seq;
	}
	public void setCocktail_seq(int cocktail_seq) {
		this.cocktail_seq = cocktail_seq;
	}
	public int getSweet() {
		return sweet;
	}
	public void setSweet(int sweet) {
		this.sweet = sweet;
	}
	public int getSour() {
		return sour;
	}
	public void setSour(int sour) {
		this.sour = sour;
	}
	public String getSparkle() {
		return sparkle;
	}
	public void setSparkle(String sparkle) {
		this.sparkle = sparkle;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public String getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}
	public String getFlavor() {
		return flavor;
	}
	public void setFlavor(String flavor) {
		this.flavor = flavor;
	}
	
	
	
}
