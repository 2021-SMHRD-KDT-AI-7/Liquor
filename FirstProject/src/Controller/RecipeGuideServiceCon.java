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
		//int cocktail_seq = Integer.parseInt(req.getParameter("cocktail_seq")); // test_guide ���� ���±׷� ������ ���.	 
		DAO dao = new DAO();
		HttpSession session = req.getSession();
		int cocktail_seq = (int)session.getAttribute("cocktail_seq");
		System.out.println("������ ���̵��� Ĭ���� ������"+cocktail_seq);
		ArrayList<ArrayList> recipe_ratio = dao.ratioFromRecipe(cocktail_seq);
		session.setAttribute("recipe_ratio", recipe_ratio); 
		session.setAttribute("seq", cocktail_seq);
		String cocktail_name=req.getParameter("cocktail_name");
		System.out.println("���ǽ� ���̵� ��Ʈ�ѷ����� Ĭ���� �̸� >> "+cocktail_name);
		
		//���ǿ� recipe_ratio ��� �̸����� ������ �Ѱ���/����̸�, ������ �ΰ��� ArrayList�� ����ִ� ArrayList��
		//���̵� ������ ������ �������� sendRedirect ����ߵ�
		resp.sendRedirect("TEST_guide_TEST.jsp?cocktail_name="+cocktail_name);
	}

}
