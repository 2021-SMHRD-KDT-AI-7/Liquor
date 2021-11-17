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
	div{
	height="0%";
	}
</style>
<body>


<%
ArrayList<ArrayList> recipe_ratio=(ArrayList<ArrayList>)session.getAttribute("recipe_ratio");
%>

<%		ArrayList<Double> names = recipe_ratio.get(0);
		ArrayList<String> ratios=recipe_ratio.get(1);
		for(int i=0;i<ratios.size();i++){
			%><div id="div_no<%=i%>"></div>
			<script>
			 document.querySelector("#div_no<%=i%>").style.height="<%=ratios.get(i)%>%";		 
			
			</script>
			<%}%>
<script>
</script>

</body>
</html>