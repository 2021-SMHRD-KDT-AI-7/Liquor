package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;

@WebServlet("/LoadMyRecipeServiceCon")
public class LoadMyRecipeServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String my_recipe_seq = request.getParameter("my_recipe_seq");
		
		DAO dao = new DAO();
		dao.loadMyRecipe(my_recipe_seq);
		
		ArrayList<ArrayList> my_recipe = new ArrayList<>();
		// my_recipe = dao.loadMyRecipe(my_recipe_seq);
		
		// 현주형 정하는 변수명 넘겨받으면 그때 ArrayList랑 response 마무리 짓기
		
	}

}
