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
html {
	background-color: rgba(18, 18, 18, 1);
}

#div_no0 {
	width: 100%;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    background: hsla(211, 96%, 62%, 1);
    background: linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%, hsla(295, 94%, 76%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%, hsla(295, 94%, 76%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%, hsla(295, 94%, 76%, 1) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#439CFB", endColorstr="#F187FB", GradientType=1 );
}

#div_no1 {
	width: 100%;
	background: hsla(152, 100%, 50%, 1);
   	background: linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#00FF87", endColorstr="#60EFFF", GradientType=1 );
}

#div_no2 {
	width: 100%;
	background: hsla(217, 100%, 50%, 1);
    background: linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%, hsla(186, 100%, 69%, 1) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#0061FF", endColorstr="#60EFFF", GradientType=1 );
}

#div_no3 {
	width: 100%;
    background: hsla(99, 75%, 75%, 1);
    background: linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#B2EF91", endColorstr="#FA9372", GradientType=1 );
}

#div_no4 {
	width: 100%;
    background: hsla(340, 80%, 69%, 1);
    background: linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%, hsla(15, 93%, 71%, 1) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#EF709B", endColorstr="#FA9372", GradientType=1 );
}

#layout {
	position: absolute;
	top: 0;
	left: 0;
	opacity: .8;
	width: 100%;
	height: 100%;
}
</style>
<body>

	<%
		ArrayList<ArrayList> recipe_ratio = new ArrayList<>();
	recipe_ratio = (ArrayList<ArrayList>) session.getAttribute("recipe_ratio"); /* ���ǿ� �ִ� ArrayList ����� �� �ְ� ������ ���� */
	%>
	
		<div id="layout">
			<%
				ArrayList<String> names = new ArrayList<>();
			names = recipe_ratio.get(0);
			/*RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� ù��° ArrayList(��� ��) ��������  */
			ArrayList<Integer> ratios = new ArrayList<>();
			ratios = recipe_ratio.get(1);
			%>
			<!-- RecipeGuideServiceCon ���� ������ recipe_ratio ArrayList���� �� ��° ArrayList(��� ����) �������� -->

			<%
				for (int i = 0; i < ratios.size(); i++) {
			%><div id="div_no<%=i%>"></div>
			<%
				}
			%><!-- ��� ������ŭ div ����� for��, ���� id="div_no0"~"div_no9" -->

			<script>
				/* ������ div ���̸� �޾ƿ� ������ ���� ���� */
			<%for (int i = 0; i < ratios.size(); i++) {%>
				var h =
			<%=ratios.get(i)%>
				;
				document.getElementById("div_no" +
			<%=i%>
				).style.height = ""
						+ h + "%";
			<%}%>
				
			</script>
		</div>

</body>
</html>