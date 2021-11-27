package Model;

public class CocktailDTO {
	private String name, speciality, color, reg_date, u_id;
	private int degree, cocktail_sequence;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public CocktailDTO(String name, String speciality, String color, String reg_date, String u_id, int cocktail_sequence) {
		
		this.name = name;
		this.speciality = speciality;
		this.color = color;
		this.reg_date = reg_date;
		this.u_id = u_id;
		this.cocktail_sequence = cocktail_sequence;
	}
	
	public CocktailDTO(String name, String speciality, String color, int cocktail_sequence) {
		
		this.name = name;
		this.speciality = speciality;
		this.color = color;
		this.cocktail_sequence = cocktail_sequence;
	}
}