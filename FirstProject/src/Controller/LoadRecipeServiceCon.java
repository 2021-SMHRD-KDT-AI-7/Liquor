package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;

@WebServlet("/LoadRecipeServiceCon")
public class LoadRecipeServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cock_seq = req.getParameter("cocktail_seq");
		
		DAO dao = new DAO();
		dao.loadRecipe(cock_seq);
		
		ArrayList<ArrayList> recipe = new ArrayList<>();
		recipe = dao.loadRecipe(cock_seq);
		
		
		
		resp.sendRedirect("main.jsp");
	}

}
