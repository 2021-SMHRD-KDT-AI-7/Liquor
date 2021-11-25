package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberDTO;
import Model.MyRecipeDTO;

@WebServlet("/saveMyRecipe")
public class saveMyRecipe extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		String edited_name = req.getParameter("edited_name");
		String edited_ratio=req.getParameter("edited_ratio");
		HttpSession session = req.getSession();
		String mixing=" ";
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String u_id=info.getId();
		String name = req.getParameter("cocktail_name");
		MyRecipeDTO rdto = new MyRecipeDTO(edited_name, edited_ratio, mixing, name, u_id);
		DAO dao = new DAO();
		PrintWriter out = resp.getWriter();
		int cnt =dao.saveMyRecipe(rdto);
		if(cnt!=0) {
			System.out.println("추가성공");
			
		}
//		int my_recipe_seq, String my_ingredient_name, String my_ingredient_amount,
//		String my_ingredient_mixing,String my_cocktail_name,String u_id
		
		
	}
}
