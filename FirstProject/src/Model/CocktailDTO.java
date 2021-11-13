package Model;

public class CocktailDTO {
	private String name, speciality, color, reg_date, u_id;
	private int degree;
	
	
	public CocktailDTO(String name, String speciality, String color, String reg_date, String u_id, int degree) {
		
		this.name = name;
		this.speciality = speciality;
		this.color = color;
		this.reg_date = reg_date;
		this.u_id = u_id;
		this.degree = degree;
	}
	
	public CocktailDTO(String name, String speciality, String color, int degree) {
		
		this.name = name;
		this.speciality = speciality;
		this.color = color;
		this.degree = degree;
	}
}