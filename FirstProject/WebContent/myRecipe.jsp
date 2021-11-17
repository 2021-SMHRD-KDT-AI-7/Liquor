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
		header {width: 100%; height: 100px; background-color: #ffe082;}
		article {width: 100%; height: 130px; background-color: rgba(14, 10, 11, 1);}
		section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 0.8);}
		section > div {width: 18%; margin: 1%; height: 170px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}
		footer {width: 100%; height: 100px; background-color: rgba(14, 10, 11, 1);}
		#intro {font-size: 60px;}

		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 23%; }
			#intro{font-size: 44px;}
		}

		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 31.333333%; }
			#intro{font-size: 25px;}
			
		}

		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%; }
			#intro{font-size: 18px;}
			
		}
		h1.a:after{
			content: "";
			display: block;
			width: 54%;
			border-bottom: 3px solid #bcbcbc; 
			margin: 10px auto;
		}
		#intro{
			color: white;
			text-align: center;
			}
	</style>
</head>
<body>
	
	<div id="wrap">
		<header></header>
		<article>
			<h1 id="intro" class="a">My Cocktail & Recipe</h1>
		</article>
		<section>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
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