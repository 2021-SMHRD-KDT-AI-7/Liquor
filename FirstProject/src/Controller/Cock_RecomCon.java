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
		System.out.println("[Cock_RecomCon]����");
		HttpSession session = request.getSession();

		
		String opinion = request.getParameter("opinion");
		System.out.println(opinion);
		String path = "cock_Reco.jsp";
		
		if(opinion.equals("summer")) {
//			session.setAttribute("��õ", "����");
			path = "cock_Reco.jsp?opinion="+URLEncoder.encode("����", "euc-kr");
//			path = "cock_Reco.jsp?opinion=summer";
			
		}else if(opinion.equals("female")) {
			session.setAttribute("��õ", "����");
		}else if(opinion.equals("halloween")) {
			session.setAttribute("��õ", "�ҷ���");
		}else if(opinion.equals("party")) {
			session.setAttribute("��õ", "��Ƽ");
		}
		
		response.sendRedirect(path);

	}

	

}
