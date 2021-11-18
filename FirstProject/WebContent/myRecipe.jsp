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
		#intro {font-size: 55px;}
		#btn1 {font-size: 15px; margin-top: 20px; margin-left: 10px;}
		#btn2 {font-size: 15px;}	

		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 23%; }
			#intro{font-size: 45px;}
			#btn1 {font-size: 13px; margin-top: 37px;}
			#btn2 {font-size: 13px;}
		}
		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 31.333333%; }
			#intro{font-size: 30px;}
			#btn1 {font-size: 11px;}
			#btn2 {font-size: 11px; margin-top: 59px;}
		}
		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%; }
			#intro{font-size: 24px;}
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
	
	<div id="wrap">
		<header></header>
		
		<article id="btn_g">
			<h1 id="intro" class="a">My Cocktail & Recipe</h1>
			<button id="btn1">수정하기</button>
			<button id="btn2">저장하기</button>			
		</article>
		
		<section>
			<div><a href="#"><img src="img_ex/cock_ex.jpg"></a></div>
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
			<div></div>
			<div></div>
		</section>
		
		<footer></footer>
	</div>
</body>
</html>