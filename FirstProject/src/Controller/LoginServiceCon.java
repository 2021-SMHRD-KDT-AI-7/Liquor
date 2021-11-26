package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberDTO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("EUC-KR");
		// 2. 값 받아오기 (email, pw)
		MemberDTO info = null;
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		DAO dao = new DAO();
		info = dao.login(id, pw);
		if (info == null) {
			System.out.println("로그인실패");
			resp.sendRedirect("LoginPage.html");
		} else {
			System.out.println("로그인성공");
			HttpSession session = req.getSession();
			session.setAttribute("info", info);
			resp.sendRedirect("Main-1.jsp");
			System.out.println(info.getId());
		}

	}
}
