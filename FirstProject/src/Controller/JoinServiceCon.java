package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.MemberDTO;

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("EUC-KR");
		DAO dao=new DAO();
		//(String id, String pw, String name, String birth, String gender,String admin_yn)
		String id = req.getParameter("id");
		String pw= req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		String admin_yn = req.getParameter("admin_yn");

		MemberDTO info=null;
		info=dao.join(id, pw, name, birth,gender,admin_yn);
		RequestDispatcher rd;
		String path=null;

		if(info!=null) {
			System.out.println("회원가입 성공!");
			//req.setAttribute("email", email);
			path="join_success.jsp";
			HttpSession session=req.getSession();
			session.setAttribute("info", info);
		}else {
			System.out.println("회원가입 실패...");
			path="main.jsp";
		}
		rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
