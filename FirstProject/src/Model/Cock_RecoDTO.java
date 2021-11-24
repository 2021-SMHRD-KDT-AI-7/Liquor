package Model;

public class Cock_RecoDTO {

	// 칵테일번호, 칵테일 이름,칵테일 특징,칵테일 도수,칵테일 색상,칵테일 이미지, 추천사유
		private int cocktail_seq;
		private String cocktail_name;
		private String cocktail_speciality;
		private int cocktail_degree;
		private String cocktail_color;
		private String cocktail_img;
		private String reco_opinion;
		
		
	// 칵테일번호, 칵테일 이름,칵테일 특징,칵테일 도수,칵테일 색상,칵테일 이미지, 추천사유
		public Cock_RecoDTO(int cocktail_seq, String cocktail_name, String cocktail_speciality, int cocktail_degree,
				String cocktail_color, String cocktail_img, String reco_opinion) {
			super();
			this.cocktail_seq = cocktail_seq;
			this.cocktail_name = cocktail_name;
			this.cocktail_speciality = cocktail_speciality;
			this.cocktail_degree = cocktail_degree;
			this.cocktail_color = cocktail_color;
			this.cocktail_img = cocktail_img;
			this.reco_opinion = reco_opinion;
		}


		public int getCocktail_seq() {
			return cocktail_seq;
		}


		public void setCocktail_seq(int cocktail_seq) {
			this.cocktail_seq = cocktail_seq;
		}


		public String getCocktail_name() {
			return cocktail_name;
		}


		public void setCocktail_name(String cocktail_name) {
			this.cocktail_name = cocktail_name;
		}


		public String getCocktail_speciality() {
			return cocktail_speciality;
		}


		public void setCocktail_speciality(String cocktail_speciality) {
			this.cocktail_speciality = cocktail_speciality;
		}


		public int getCocktail_degree() {
			return cocktail_degree;
		}


		public void setCocktail_degree(int cocktail_degree) {
			this.cocktail_degree = cocktail_degree;
		}


		public String getCocktail_color() {
			return cocktail_color;
		}


		public void setCocktail_color(String cocktail_color) {
			this.cocktail_color = cocktail_color;
		}


		public String getCocktail_img() {
			return cocktail_img;
		}


		public void setCocktail_img(String cocktail_img) {
			this.cocktail_img = cocktail_img;
		}


		public String getReco_opinion() {
			return reco_opinion;
		}


		public void setReco_opinion(String reco_opinion) {
			this.reco_opinion = reco_opinion;
		}

		
		


}
