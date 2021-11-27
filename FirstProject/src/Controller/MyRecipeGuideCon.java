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

/**
 * Servlet implementation class MyRecipeGuideCon
 */
@WebServlet("/MyRecipeGuideCon")
public class MyRecipeGuideCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		HttpSession session = req.getSession();
		System.out.println("myrecipe Guide 들어옴");

		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("세션에서 시퀀스 받아옴");

		DAO dao = new DAO();
		ArrayList<ArrayList> my_recipe = new ArrayList<>();
		my_recipe = dao.loadMyRecipeGuide(seq);
		System.out.println("loadMyRecipeGuide 사용함");
		//session.setAttribute("cocktail_name", my_recipe);
		session.setAttribute("recipe_ratio", my_recipe);
		resp.sendRedirect("TEST_guide_TEST.jsp");
	}

}
