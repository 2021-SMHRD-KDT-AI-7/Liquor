package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.JH_DAO;

@WebServlet("/RecipeGuideServiceCon")
public class RecipeGuideServiceCon extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		int cocktail_seq=Integer.parseInt(req.getParameter("cocktail_seq"));
		JH_DAO dao = new JH_DAO();
		HttpSession session = req.getSession();
		ArrayList<ArrayList> recipe_ratio = dao.ratioFromRecipe(cocktail_seq);
		session.setAttribute("recipe_ratio", recipe_ratio); 
		
		//���ǿ� recipe_ratio ��� �̸����� ������ �Ѱ���/����̸�, ������ �ΰ��� ArrayList�� ����ִ� ArrayList��
		//���̵� ������ ������ �������� sendRedirect ����ߵ�
		resp.sendRedirect("guide.jsp");
	}

}
