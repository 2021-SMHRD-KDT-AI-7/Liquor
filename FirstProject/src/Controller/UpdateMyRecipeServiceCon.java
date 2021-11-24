package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberDTO;
import Model.MyRecipeDTO;

@WebServlet("/UpdateMyRecipeServiceCon")
public class UpdateMyRecipeServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[UpdateMyRecipeServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		
		String my_ingredient_name = request.getParameter("my_ingredient_name");
		String my_ingredient_amount = request.getParameter("my_ingredient_amount");
		String my_ingredient_method = request.getParameter("my_ingredient_method");
		
		System.out.println("my_ingredient_name : "+my_ingredient_name);
		System.out.println("my_ingredient_amount : "+my_ingredient_amount);
		System.out.println("my_ingredient_method : "+my_ingredient_method);
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String id = info.getId();
		String myCocktailName = request.getParameter("myCocktailName");
		
		MyRecipeDTO myRecipeDTO = (MyRecipeDTO)session.getAttribute("myRecipeDTO");
		
		int my_recipe_seq = myRecipeDTO.getMy_recipe_seq();
		
		myRecipeDTO = new MyRecipeDTO(my_recipe_seq, my_ingredient_name, my_ingredient_amount, my_ingredient_method,id,myCocktailName); 
		
		DAO dao = new DAO();
		int cnt = dao.updateMyRecipe(myRecipeDTO);
		if(cnt > 0) {
			System.out.println("나만의 레시피 수정 성공");
			session.setAttribute("myRecipeDTO", myRecipeDTO);
		}else {
			System.out.println("나만의 레시피 수정 실패");
		}
		response.sendRedirect("myRecipe.jsp");
	}


}
