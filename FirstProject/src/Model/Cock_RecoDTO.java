package Model;

public class Cock_RecoDTO {

	private int reco_seq;
	private int cocktail_seq;
	private String reco_date;
	private String reco_opinion;
	
	public Cock_RecoDTO(int reco_seq, int cocktail_seq, String reco_date, String reco_opinion) {
		super();
		this.reco_seq = reco_seq;
		this.cocktail_seq = cocktail_seq;
		this.reco_date = reco_date;
		this.reco_opinion = reco_opinion;
	}

	public int getReco_seq() {
		return reco_seq;
	}

	public void setReco_seq(int reco_seq) {
		this.reco_seq = reco_seq;
	}

	public int getCocktail_seq() {
		return cocktail_seq;
	}

	public void setCocktail_seq(int cocktail_seq) {
		this.cocktail_seq = cocktail_seq;
	}

	public String getReco_date() {
		return reco_date;
	}

	public void setReco_date(String reco_date) {
		this.reco_date = reco_date;
	}

	public String getReco_opinion() {
		return reco_opinion;
	}

	public void setReco_opinion(String reco_opinion) {
		this.reco_opinion = reco_opinion;
	}

	
	
	
}
