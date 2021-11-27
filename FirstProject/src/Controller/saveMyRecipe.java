package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Model.DAO;
import Model.MemberDTO;
import Model.MyRecipeDTO;
import Model.RecipeDTO;

@WebServlet("/saveMyRecipe")
public class saveMyRecipe extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String jsonInfo=req.getParameter("edited_info");
		try {
			

			
			
			HttpSession session = req.getSession();
			
			
			MemberDTO info = (MemberDTO)session.getAttribute("info");
			String edited_name = (String)session.getAttribute("edited_name");
			String edited_ratio=req.getParameter("edited_ratio");
			String u_id=info.getId();
			RecipeDTO load_recipe = (RecipeDTO)session.getAttribute("load_recipe");
			String name = load_recipe.getCocktail_name();
			name=name+"*";
			String mixing=" ";
			MyRecipeDTO rdto = new MyRecipeDTO(edited_name, edited_ratio, mixing, name, u_id);
			DAO dao = new DAO();
			System.out.println("edited_name:"+edited_name);
			System.out.println("edited_ratio:"+edited_ratio);
			System.out.println("name >> "+name);
			
			int cnt =dao.saveMyRecipe(rdto);
			if(cnt!=0) {
				System.out.println("추가성공");
				resp.sendRedirect("Main-1.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
//		int my_recipe_seq, String my_ingredient_name, String my_ingredient_amount,
//		String my_ingredient_mixing,String my_cocktail_name,String u_id
		
		
	}
}
