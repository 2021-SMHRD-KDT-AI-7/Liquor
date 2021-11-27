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

@WebServlet("/LoadMyRecipeListCon")
public class LoadMyRecipeListCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		
		DAO dao = new DAO();
		
		ArrayList<String[]> my_recipe = new ArrayList<>();
		my_recipe = dao.loadMyRecipeList(id);
		
		session.setAttribute("my_recipe_list", my_recipe);
		System.out.println("¼­ºí¸´>myRecipe.size>> "+my_recipe.size());
		response.sendRedirect("myRecipe.jsp");	
	}

}
