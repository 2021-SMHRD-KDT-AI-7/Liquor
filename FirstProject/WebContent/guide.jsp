<%@page import="Model.JH_DAO"%>
<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="jquery-3.6.0.min.js"></script>
</head>
<style>

#div_no0{
background-color: #ea4335;
}
#div_no1{
background-color : green;
}
#div_no2{
background-color : yellow;
}
#div_no3{
background-color : orange;

}
#div_no4{
background-color : gray;
}


        #layout{
            width: 100%;
            height: 600px;
        }
</style>
<body>


<%
ArrayList<ArrayList> recipe_ratio=new ArrayList<>();
recipe_ratio=(ArrayList<ArrayList>)session.getAttribute("recipe_ratio");	/* 세션에 있던 ArrayList 사용할 수 있게 변수에 저장 */
%>
<div id="layout">
<%		ArrayList<String> names = new ArrayList<>();
		names = recipe_ratio.get(0);
		/*RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 첫번째 ArrayList(재료 명) 가져오기  */
		ArrayList<Integer> ratios=new ArrayList<>();
		ratios=recipe_ratio.get(1);%>
		<!-- RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 두 번째 ArrayList(재료 비율) 가져오기 -->
			
		<%for(int i=0;i<ratios.size();i++){			
		%><div id="div_no<%=i%>"></div>
			<%}%><!-- 재료 갯수만큼 div 만드는 for문, 각각 id="div_no0"~"div_no9" -->
		
			<script>
			
			/* 각각의 div 높이를 받아온 비율에 맞춰 조절 */
			<%for(int i=0;i<ratios.size();i++){%>
			var h=<%=ratios.get(i)%>;
					document.getElementById("div_no"+<%=i%>).style.height=""+h+"%";
					<%}%>
			</script>			
		</div>


</body>
</html>