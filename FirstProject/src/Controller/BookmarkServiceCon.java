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


@WebServlet("/BookmarkServiceCon")
public class BookmarkServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		HttpSession session = req.getSession();
		
		String id = session.getId();
		
		DAO dao = new DAO();
		ArrayList<String[]> bookmarks = null;
		
		bookmarks=dao.viewBookmark(id);
		session.setAttribute("bookmark", bookmarks); 
		resp.sendRedirect("Bookmark.jsp");
	
	}

}
