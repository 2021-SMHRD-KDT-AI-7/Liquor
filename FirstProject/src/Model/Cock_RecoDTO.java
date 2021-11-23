package Model;

public class Cock_RecoDTO {

	// 칵테일 번호,이름,특징,도수,색깔,특징순번,베이스,달콤순번, 신맛순번, 알콜도수순번,향순번
		private int cocktail_seq;
		private String cocktail_name;
		private String cocktail_speciality;
		private int cocktail_degree;
		private String cocktail_color;
		private int flavour_seq;
		private String cocktail_base_liquid;
		private int feature_seq;
		private int sweet_seq;
		private int sour_seq;
		private int alcohol_seq;
		
		
		
		//추천 순번 추천일자 추천사유
		private int reco_seq;
		private String reco_date;
		private String reco_opinion;
		
		
		public Cock_RecoDTO(int cocktail_seq, String cocktail_name, int reco_seq, String reco_date,
				String reco_opinion) {
			super();
			this.cocktail_seq = cocktail_seq;
			this.cocktail_name = cocktail_name;
			this.reco_seq = reco_seq;
			this.reco_date = reco_date;
			this.reco_opinion = reco_opinion;
		}
		
		//칵테일 번호 칵테일 이름,특징,도수,색깔,베이스,달콤,신맛,알콜도수,향, 추천사유 
		public Cock_RecoDTO(int cocktail_seq, String cocktail_name, String cocktail_speciality, int cocktail_degree,
				String cocktail_color, int flavour_seq, String cocktail_base_liquid, int sweet_seq, int sour_seq,
				int alcohol_seq, String reco_opinion) {
			super();
			this.cocktail_seq = cocktail_seq;
			this.cocktail_name = cocktail_name;
			this.cocktail_speciality = cocktail_speciality;
			this.cocktail_degree = cocktail_degree;
			this.cocktail_color = cocktail_color;
			this.flavour_seq = flavour_seq;
			this.cocktail_base_liquid = cocktail_base_liquid;
			this.sweet_seq = sweet_seq;
			this.sour_seq = sour_seq;
			this.alcohol_seq = alcohol_seq;
			this.reco_opinion = reco_opinion;
		}
		
		public Cock_RecoDTO(int cocktail_seq, String cocktail_name, String cocktail_speciality, int cocktail_degree,
				String cocktail_color, String reco_opinion) {
			super();
			this.cocktail_seq = cocktail_seq;
			this.cocktail_name = cocktail_name;
			this.cocktail_speciality = cocktail_speciality;
			this.cocktail_degree = cocktail_degree;
			this.cocktail_color = cocktail_color;
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
		public int getFlavour_seq() {
			return flavour_seq;
		}
		public void setFlavour_seq(int flavour_seq) {
			this.flavour_seq = flavour_seq;
		}
		public String getCocktail_base_liquid() {
			return cocktail_base_liquid;
		}
		public void setCocktail_base_liquid(String cocktail_base_liquid) {
			this.cocktail_base_liquid = cocktail_base_liquid;
		}

		public int getReco_seq() {
			return reco_seq;
		}

		public void setReco_seq(int reco_seq) {
			this.reco_seq = reco_seq;
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

		public int getFeature_seq() {
			return feature_seq;
		}

		public void setFeature_seq(int feature_seq) {
			this.feature_seq = feature_seq;
		}

		public int getSweet_seq() {
			return sweet_seq;
		}

		public void setSweet_seq(int sweet_seq) {
			this.sweet_seq = sweet_seq;
		}

		public int getSour_seq() {
			return sour_seq;
		}

		public void setSour_seq(int sour_seq) {
			this.sour_seq = sour_seq;
		}

		public int getAlcohol_seq() {
			return alcohol_seq;
		}

		public void setAlcohol_seq(int alcohol_seq) {
			this.alcohol_seq = alcohol_seq;
		}


}
