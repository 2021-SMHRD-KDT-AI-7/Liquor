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
import Model.RecipeDTO;

@WebServlet("/LoadRecipeServiceCon")
public class LoadRecipeServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LoadRecipeServiceCon들어 왔니");
		req.setCharacterEncoding("EUC-KR");
		HttpSession session = req.getSession();
		int seq=Integer.parseInt(req.getParameter("seq"));
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		DAO dao = new DAO();
		System.out.println(seq);
		
		
		System.out.println("arrayList 만듦");
		ArrayList<RecipeDTO> load_recipe = dao.loadRecipe(info.getId());
		
		System.out.println(load_recipe.size());
		
		session.setAttribute("load_recipe", load_recipe);
		
		resp.sendRedirect("RecipeInfo-1.jsp");
		System.out.println("보낸거 맞아?");
	}

}
