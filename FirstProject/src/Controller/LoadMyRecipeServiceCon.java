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

@WebServlet("/LoadMyRecipeServiceCon")
public class LoadMyRecipeServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		int seq = Integer.parseInt(request.getParameter("seq"));
		DAO dao = new DAO();
		
		ArrayList<String[]> my_recipe = new ArrayList<>();
		my_recipe = dao.loadMyRecipe(seq);
		
		session.setAttribute("my_recipe", my_recipe);
		
		response.sendRedirect("myRecipe.jsp");	
	}

}
