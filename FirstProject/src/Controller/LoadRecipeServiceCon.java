package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberDTO;

@WebServlet("/LoadRecipeServiceCon")
public class LoadRecipeServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("EUC-KR");
		HttpSession session = req.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		
		DAO dao = new DAO();
		System.out.println(id);
		
		ArrayList<ArrayList> load_recipe = new ArrayList<>();
		load_recipe = dao.loadRecipe(id);
		
		session.setAttribute("load_recipe", load_recipe);
		
		resp.sendRedirect("recipeInfo.jsp");
	}

}
