package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CocktailDTO;
import Model.DAO;

/**
 * Servlet implementation class SearchBySpecialityCon
 */
@WebServlet("/SearchBySpecialityCon")
public class SearchBySpecialityCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		String cocktail_speciality = req.getParameter("search");
		DAO dao = new DAO();
		ArrayList<CocktailDTO> searchResult = new ArrayList<>();
		System.out.println(cocktail_speciality);
		searchResult = dao.searchBySpeciality(cocktail_speciality);
		HttpSession session = req.getSession();
		System.out.println("검색결과 크기"+searchResult.size());
		session.setAttribute("search_results", searchResult);
		resp.sendRedirect("searchResult.jsp");
		
	}

}
