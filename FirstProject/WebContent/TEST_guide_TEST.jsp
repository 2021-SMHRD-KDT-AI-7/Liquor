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
html, body {
	height: 100%;
}

html {
	background-color: rgba(18, 18, 18, 1);
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
}
div {
	color: white;
	text-align: center;
	font-size: 30px;
}

#div_no0 {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	width: 100%;
    height: 20%;
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
    height: 20%;
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
	margin-bottom: -1000px;
	opacity: .8;
	width: 100%;
	height: 500px;
}
</style>
<body>

	<%
		ArrayList<ArrayList> recipe_ratio = new ArrayList<>();
	recipe_ratio = (ArrayList<ArrayList>) session.getAttribute("recipe_ratio"); /* 세션에 있던 ArrayList 사용할 수 있게 변수에 저장 */
	%>
	<div class='box'>
		<div class="total">
			<div class='wave -one'></div>
			<div class='wave -two'></div>
			<div class='wave -three'></div>
			<div class='wave -four'></div>
			<div class='title'></div>
		</div>

		<div id="layout">
			<%
				ArrayList<String> names = new ArrayList<>();
			names = recipe_ratio.get(0);
			/*RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 첫번째 ArrayList(재료 명) 가져오기  */
			ArrayList<Integer> ratios = new ArrayList<>();
			ratios = recipe_ratio.get(1);
			%>
			<!-- RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 두 번째 ArrayList(재료 비율) 가져오기 -->

			<%
				for (int i = 0; i < ratios.size(); i++) {
			%><div id="div_no<%=i%>"></div>
			<%
				}
			%><!-- 재료 갯수만큼 div 만드는 for문, 각각 id="div_no0"~"div_no9" -->

			<script>
				/* 각각의 div 높이를 받아온 비율에 맞춰 조절 */
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
	</div>

</body>
</html>