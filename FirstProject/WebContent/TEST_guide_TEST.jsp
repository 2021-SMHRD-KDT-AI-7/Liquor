<%@page import="Model.DAO"%>
<%@page import="Model.RecipeDTO"%>
<%@page import="Model.MemberDTO"%>
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
@font-face {
font-family: 'CookieRunOTF-Black';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Black00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'CookieRun-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'CookieRunOTF-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

html {
	background-color: rgba(18, 18, 18, 1);
}
*{
	padding: 0px;
	margin:0;
}
 /* 밑줄 제거 */
    a {
      text-decoration-line: none;
    }
header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: rgba(18, 18, 18, 1);
}

.head_text {
	color: white;
	text-align: center;
	font-size: 25px;
	padding-left:70px;
	font-weight: 800;
	padding-top: 35px;
}

.back_btn {
	width: 20px;
	height: 20px;
	background-color: rgba(18, 18, 18, 1);
	padding: 0px;
	padding-top: 42px;
	border: 0px;
	position: absolute;
}

.mix_btn {
	width: 30px;
	height: 30px;
	position: absolute;
}

a {
	float: right;
	display: block;
	width: 50px;
	color: white;
	padding:5px;
	padding-top:28px
}

button {
	background-color: black;
	padding: 0px;
	border: 0px;
	float: left;
	display: block;
	width: 30px;
}

#layout {
	position: absolute;
	top: 0;
	left: 0;
	margin-top: 135px;
	width: 100%;
	height: 100%;
	opacity: .8;
	color: rgba(18, 18, 18, 1);
	text-align: center;
	font-size: 30px;
}

#div_no0 {
	width: 100%;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background: hsla(211, 96%, 62%, 1);
	background: linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#439CFB",
		endColorstr="#F187FB", GradientType=1);
	display: flex;
	justify-content: center;
	align-items: center;
}

#div_no1 {
	width: 100%;
	background: hsla(152, 100%, 50%, 1);
	background: linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#00FF87",
		endColorstr="#60EFFF", GradientType=1);
	display: flex;
	justify-content: center;
	align-items: center;
}

#div_no2 {
	width: 100%;
	background: hsla(217, 100%, 50%, 1);
	background: linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#0061FF",
		endColorstr="#60EFFF", GradientType=1);
	display: flex;
	justify-content: center;
	align-items: center;
}

#div_no3 {
	width: 100%;
	background: hsla(99, 75%, 75%, 1);
	background: linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#B2EF91",
		endColorstr="#FA9372", GradientType=1);
	display: flex;
	justify-content: center;
	align-items: center;
}

#div_no4 {
	width: 100%;
	background: hsla(340, 80%, 69%, 1);
	background: linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#EF709B",
		endColorstr="#FA9372", GradientType=1);
	display: flex;
	justify-content: center;
	align-items: center;
}
p,#div_no0,#div_no1,#div_no2,#div_no3,#div_no4{
	font-family: 'CookieRunOTF-Bold';
}

</style>
<body>

	<header>
	<br>
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a href="guideEdit.jsp"><h1 id="next">&#10153;</h1></a>
			<p class="head_text">레시피</p>
		</div>
	</header>

	<%
		ArrayList<ArrayList> recipe_ratio = new ArrayList<>();
			MemberDTO info = (MemberDTO)session.getAttribute("info");
	recipe_ratio = (ArrayList<ArrayList>) session.getAttribute("recipe_ratio"); /* 세션에 있던 ArrayList 사용할 수 있게 변수에 저장 */
	%>

	<div id="layout">
		<%
				ArrayList<String> names = new ArrayList<>();
			names = recipe_ratio.get(0);
			/*RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 첫번째 ArrayList(재료 명) 가져오기  */
			ArrayList<Integer> ratios = new ArrayList<>();
			ratios = recipe_ratio.get(1);
			if(info!=null){
			System.out.println("인포 제대로 들어옴");}
			else{
				System.out.println("인포 없음");}
			
			%>
		<!-- RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 두 번째 ArrayList(재료 비율) 가져오기 -->

		<%
				for (int i = 0; i < ratios.size(); i++) {
			%><div id="div_no<%=i%>"><%=names.get(i)%></div>
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
				
			function goBack() {
			      window.history.back();
			    }
			</script>
	</div>

</body>
</html>