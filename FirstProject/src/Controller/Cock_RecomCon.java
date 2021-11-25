package Controller;

import java.io.IOException;
import java.net.URLEncoder;

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
		response.setContentType("text/html; charset=euc-kr");
		System.out.println("[Cock_RecomCon]진입");
		HttpSession session = request.getSession();

		
		String opinion = request.getParameter("opinion");
		System.out.println(opinion);
		String path = "cock_Reco.jsp";
		
		if(opinion.equals("summer")) {
//			session.setAttribute("추천", "여름");
			path = "cock_Reco.jsp?opinion="+URLEncoder.encode("여름", "euc-kr");
//			path = "cock_Reco.jsp?opinion=summer";
			
		}else if(opinion.equals("female")) {
			session.setAttribute("추천", "여자");
		}else if(opinion.equals("halloween")) {
			session.setAttribute("추천", "할로윈");
		}else if(opinion.equals("party")) {
			session.setAttribute("추천", "파티");
		}
		
		response.sendRedirect(path);

	}

	

}
