package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;

@WebServlet("/DeleteMyRecipeServiceCon")
public class DeleteMyRecipeServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[DeleteMyRecipeServiceCon]");
		
		String my_recipe_seq = request.getParameter("my_recipe_seq");
		System.out.println("레시피의 고유값 : "+ my_recipe_seq);
		
		DAO dao = new DAO();
		int cnt = dao.deleteMyRecipe(my_recipe_seq);
		
		if(cnt>0) {
			System.out.println("나만의 레시피 삭제 성공");
		}else {
			System.out.println("나만의 레시피 삭제 실패 ");
		}
		response.sendRedirect("myRecipe.jsp");
	}

}
