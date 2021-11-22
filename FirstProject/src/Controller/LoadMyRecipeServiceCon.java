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

@WebServlet("/LoadMyRecipeServiceCon")
public class LoadMyRecipeServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		
		DAO dao = new DAO();
		dao.loadMyRecipe(id);
		
		ArrayList<String[]> my_recipe = new ArrayList<>();
		my_recipe = dao.loadMyRecipe(id);
		
		session.setAttribute("my_recipe", my_recipe);
		
		response.sendRedirect("myRecipe.jsp");	
	}

}
