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
recipe_ratio=(ArrayList<ArrayList>)session.getAttribute("recipe_ratio");	/* ���ǿ� �ִ� ArrayList ����� �� �ְ� ������ ���� */
%>
<div id="layout">
<%		ArrayList<String> names = new ArrayList<>();
		names = recipe_ratio.get(0);
		/*RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� ù��° ArrayList(��� ��) ��������  */
		ArrayList<Integer> ratios=new ArrayList<>();
		ratios=recipe_ratio.get(1);%>
		<!-- RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� �� ��° ArrayList(��� ����) �������� -->
			
		<%for(int i=0;i<ratios.size();i++){			
		%><div id="div_no<%=i%>"></div>
			<%}%><!-- ��� ������ŭ div ����� for��, ���� id="div_no0"~"div_no9" -->
		
			<script>
			
			/* ������ div ���̸� �޾ƿ� ������ ���� ���� */
			<%for(int i=0;i<ratios.size();i++){%>
			var h=<%=ratios.get(i)%>;
					document.getElementById("div_no"+<%=i%>).style.height=""+h+"%";
					<%}%>
			</script>			
		</div>


</body>
</html>