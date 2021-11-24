package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.JH_DAO;
import Model.MemberDTO;


@WebServlet("/addBookmarkCon")
public class addBookmarkCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		JH_DAO dao = new JH_DAO();
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("info");
		String id=mdto.getId();
		int cocktail_seq = Integer.parseInt(req.getParameter("cocktail_seq"));
//		String cocktail_seq = Integer.parseInt(req.getParameter("cocktail_seq"));
		String comm = req.getParameter("comment");
		if(comm.equals(""))	dao.addBookmark(cocktail_seq, id);
		else dao.addBookmark(cocktail_seq, comm, id);
		PrintWriter out = resp.getWriter();
		//out.print("<%bookmark.add("+cocktail_seq+") %>");
		out.print("<script>alert(\"즐겨찾기에 추가되었습니다.\")</script>");
		
	}

}
