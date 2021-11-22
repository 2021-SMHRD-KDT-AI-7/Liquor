package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Cock_RecomCon")
public class Cock_RecomCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		System.out.println("[Cock_RecomCon]진입");
		String ses = null;
		Integer sesalc =null;
		Integer sesswt =null;
		Integer sessou =null;
		Integer sesflav = null;
		HttpSession session = request.getSession();
		
		if(request.getParameter("ses")!=null) {
			ses = request.getParameter("ses");
			System.out.println(ses);
			session.setAttribute("분류", ses);
		}else if(request.getParameter("sessou")!=null) {
			sessou = Integer.parseInt(request.getParameter("sessou")) ;
			System.out.println(sessou);
			session.setAttribute("산도", sessou);
		}else if(request.getParameter("sesalc")!=null) {
			sesalc = Integer.parseInt(request.getParameter("sesalc")) ;
			System.out.println(sesalc);
			session.setAttribute("도수", sesalc);
		}else if(request.getParameter("sesswt")!=null) {
			sesswt = Integer.parseInt(request.getParameter("sesswt")) ;
			System.out.println(sesswt);
			session.setAttribute("당도", sesswt);
		}else if(request.getParameter("sesflav")!=null) {
			sesflav = Integer.parseInt(request.getParameter("sesflav")) ;
			System.out.println(sesflav);
			session.setAttribute("향번호", sesflav);
		}
		response.sendRedirect("cock_Reco.jsp");

	}

	

}
