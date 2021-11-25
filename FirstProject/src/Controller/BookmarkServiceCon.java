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


@WebServlet("/BookmarkServiceCon")
public class BookmarkServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		HttpSession session = req.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		
		DAO dao = new DAO();
		ArrayList<String[]> bookmarks = new ArrayList<>();
		
		bookmarks=dao.viewBookmark(id);
		session.setAttribute("bookmark", bookmarks); 
		System.out.println(bookmarks.size());
		resp.sendRedirect("BookMarkMenu.jsp");
	
	}

}
