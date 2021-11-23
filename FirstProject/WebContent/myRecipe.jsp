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
		header {width: 100%; height: 60px; background-color: rgba(14, 10, 11, 1);}
		article {width: 100%; height: 145px; background-color: rgba(14, 10, 11, 1);}
		section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 0.8);}
		section > div {width: 18%; margin: 1%; height: 226px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}
		footer {width: 100%; height: 103px; background-color: rgba(14, 10, 11, 1);}
		#intro {font-size: 58px; }
		#btn1 {font-size: 15px; margin-top: 19px; margin-left: 10px;}
		#btn2 {font-size: 15px;}

		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 28%;}
			#intro{font-size: 42px;}
			#btn1 {font-size: 13px; margin-top: 41px;}
			#btn2 {font-size: 13px;}
		}
		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 48%; }
			#intro{font-size: 24px;}
			#btn1 {font-size: 11px;}
			#btn2 {font-size: 11px; margin-top: 65px;}
		}
		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%; }
			#intro{font-size: 21px;}
		}
		h1.a:after{
			content: "";
			display: block;
			width: 51%;
			border-bottom: 3px solid #22D3D7; 
			margin: 5px auto;
		}
		#intro{
			color: #22D3D7;
			text-align: center;
		}
		img{
			width: 80%; height: 60%; text-align: center; display: block; margin: 5% auto; 
		}
		#btn1{
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			margin-right : -4px;
			border: 1px solid #22D3D7;
			background-color: rgba(14, 10, 11, 1);
			color : #22D3D7;
			padding : 5px;
		}
		#btn2{
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			margin-left : -3px;
			border: 1px solid #22D3D7;
			background-color: rgba(14, 10, 11, 1);
			color : #22D3D7;
			padding : 5px;
		}
		#btn_g button:hover{
			color: white;
			background-color: #22D3D7;	
		}
		
	</style>
</head>
<body>
	<%
		ArrayList<ArrayList> load_recipe = new ArrayList<>();
	load_recipe = (ArrayList<ArrayList>)session.getAttribute("load_recipe");
	
	%>
	<div id="wrap">
	<%
	if(load_recipe != null){
		ArrayList<String> names = new ArrayList<>();
		names = load_recipe.get(0);
		
		ArrayList<Integer> amounts = new ArrayList<>();
		amounts = load_recipe.get(1);
		
		ArrayList<String> cautions = new ArrayList<>();
		cautions = load_recipe.get(2);
	%>
	
		<header></header>
		
		<article id="btn_g">
			<h1 id="intro" class="a">My Cocktail & Recipe</h1>
			<button id="btn1">수정하기</button>
			<button id="btn2">저장하기</button>			
		</article>
		
		<section>
			<%for(int i=0;i<names.size();i++){			
				%><div id="rec_name<%=i%>"></div>
			<%}%>
			
	<% }else{%>
		 입력해 주세여
	<% }%>

		</section>
		
		<footer></footer>
	</div>
</body>
</html>