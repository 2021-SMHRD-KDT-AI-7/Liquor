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


@WebServlet("/RecipeGuideServiceCon")
public class RecipeGuideServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		//int cocktail_seq = Integer.parseInt(req.getParameter("cocktail_seq")); // test_guide 에서 폼태그로 가져올 경우.	 
		DAO dao = new DAO();
		HttpSession session = req.getSession();
		int cocktail_seq = (int)session.getAttribute("cocktail_seq");
		System.out.println("레시피 가이드콘 칵테일 시퀀스"+cocktail_seq);
		ArrayList<ArrayList> recipe_ratio = dao.ratioFromRecipe(cocktail_seq);
		session.setAttribute("recipe_ratio", recipe_ratio); 
		session.setAttribute("seq", cocktail_seq);
		String cocktail_name=req.getParameter("cocktail_name");
		System.out.println("레피시 가이드 컨트롤러에서 칵테일 이름 >> "+cocktail_name);
		
		//세션에 recipe_ratio 라는 이름으로 레시피 넘겨줌/재료이름, 재료비율 두개의 ArrayList가 들어있는 ArrayList임
		//가이드 페이지 나오면 그쪽으로 sendRedirect 해줘야됨
		resp.sendRedirect("TEST_guide_TEST.jsp?cocktail_name="+cocktail_name);
	}

}
