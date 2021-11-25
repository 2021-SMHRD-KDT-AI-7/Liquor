<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나만의 레시피</title>
<style>
* {margin: 0; padding: 0;}
body {background-color: #fffde7;}
#wrap {width: 1200px; margin: 0 auto;}
#wrap2 {width: 100%; }
article {width: 100%; height: 145px; background-color: rgba(14, 10, 11, 1);}
section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 0.8);}
section>div {width: 18%; margin: 1%; height: 226px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}
footer {width: 100%; height: 103px; background-color: rgba(14, 10, 11, 1);}

#intro {
	font-size: 58px;
}

#btn1 {
	font-size: 15px;
}

#btn2 {
	font-size: 15px;
}

header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: rgba(14, 10, 11, 1);
}

/* 밑줄 제거 */
a {
	text-decoration-line: none;
}

/* 헤드 text*/
.head_text {
	color: #22D3D7;
	text-align: center;
	font-size: 25px;
	font-style: italic;
	font-weight: 800;
	padding-top: 35px;
}

.back_btn {
	width: 20px;
	height: 20px;
	background-color: rgba(14, 10, 11, 1);
	padding: 0px;
	padding-top: 40px;
	padding-left: 50px;
	border: 0px;
	position: absolute;
}

.mix_btn {
	width: 30px;
	height: 30px;
	position: absolute;
	padding-left: 30px;
}

#head_g {
	float: right;
	display: block;
	width: 100px;
	margin-top: 35px;
}

button {
	background-color: rgba(14, 10, 11, 1);
	padding: 0px;
	border: 0px;
	float: left;
	display: block;
	width: 80px;
}

/* 화면 너비 0 ~ 1000px */
@media ( max-width : 1020px) {
	#wrap {width: 100%;}
	section>div {width: 28%;}
	#intro {font-size: 42px;}
	#btn1 {font-size: 13px; margin-top: 41px;}
	#btn2 {font-size: 13px;}
}

/* 화면 너비 0 ~ 768px */
@media ( max-width : 768px) {
	section>div {width: 48%;}
	#intro {font-size: 24px;}
	#btn1 {font-size: 11px;}
	#btn2 {font-size: 11px; margin-top: 65px;}
}

/* 화면 너비 0 ~ 480px */
@media ( max-width : 480px) {
	section>div {width: 48%;}
	#intro {font-size: 21px;}
}
img {
	width: 80%;
	height: 60%;
	text-align: center;
	display: block;
	margin: 5% auto;
}

#btn1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -3px;
	border: 1px solid #22D3D7;
	background-color: rgba(14, 10, 11, 1);
	color: #22D3D7;
	padding: 5px;
}

#btn2 {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -4px;
	border: 1px solid #22D3D7;
	background-color: rgba(14, 10, 11, 1);
	color: #22D3D7;
	padding: 5px;
}

#btn_g button:hover {
	color: white;
	background-color: #22D3D7;
}

#rec_name{
	color: white;
}

#warning{
	color: white;
	font-size: 140%;
	text-align: center;
}

</style>
</head>
<body>
	<%
		ArrayList<ArrayList> load_recipe = new ArrayList<>();
	load_recipe = (ArrayList<ArrayList>)session.getAttribute("load_recipe");
	if(load_recipe==null){
		%>
	<div id="wrap2">	
	<header>
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="칵테일가이드.html"><img class="mix_btn"
				src="./img_ex/칵테일믹서-1.png.png" alt="믹서 이미지"></a>
			<p class="head_text"></p>
		</div>		
	</header>
	<article></article>
	<section id="warning">
	[WARNING] <br>
	해당 페이지에는 "나만의 레시피"가 없습니다
	</section>
	<footer></footer>
	</div>
	<%}else{
	
	ArrayList<String> names = new ArrayList<>();
	if(load_recipe != null){
		names = load_recipe.get(0);
	}
	
	ArrayList<Integer> amounts = new ArrayList<>();
	if(load_recipe != null){
		amounts = load_recipe.get(1);
	}
	
	ArrayList<String> cautions = new ArrayList<>();
	if(load_recipe != null){
		cautions = load_recipe.get(2);
	}
	%>
	<div id="wrap">
	<header>
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="칵테일가이드.html"><img class="mix_btn"
				src="./img_ex/칵테일믹서-1.png.png" alt="믹서 이미지"></a>
			<p class="head_text">나만의 레시피</p>
		</div>	
	</header>
		<article id="btn_g">
			<button id="btn1">수정하기</button>
			<button id="btn2">저장하기</button>
		</article>

		<section>
		<%if(load_recipe != null){ %>
			<%for(int i=0;i<names.size();i++){			
				%><div id="rec_name<%=i%>"></div>
			<%}%>
		<%}else{ %>
			
		<%} }%>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		
		</section>

		<footer></footer>
	</div>
</body>
</html>