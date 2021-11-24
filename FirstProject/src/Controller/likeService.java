package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.JH_DAO;

@WebServlet("/likeService")
public class likeService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int cn = Integer.parseInt(request.getParameter("coCk_name"));
		System.out.println(cn);
		JH_DAO dao = new JH_DAO();
	}

}
