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


/**
 * Servlet implementation class SearchByNameCon
 */
@WebServlet("/SearchByNameCon")
public class SearchByNameCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		String cocktail_name = req.getParameter("search");
		DAO dao = new DAO();
		ArrayList<ArrayList> searchResult = new ArrayList<>();
		System.out.println(cocktail_name);
		searchResult = dao.searchByName(cocktail_name);
		HttpSession session = req.getSession();
		System.out.println("검색결과 크기"+searchResult.size());
		session.setAttribute("search_results", searchResult);
		resp.sendRedirect("searchResult.jsp");
	}
}
