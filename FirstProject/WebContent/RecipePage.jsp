<%@page import="Model.Cock_SeqsDTO"%>
<%@page import="Model.Cock_SeqsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Layout</title>
	<style>
		* {margin: 0; padding: 0;}
        body {background-color: #fffde7;}
		#wrap {width: 1200px; margin: 0 auto;}
		header {width: 100%; height: 100px; background-color: #ffe082;}
		article {width: 100%; height: 300px; background-color: #ffd54f;}
		section {overflow: hidden; padding: 5%; width: 90%; background-color: #0c09a5;}
		section > div {width: 18%; margin: 1%; height: 170px; background-color: #10b3d8; float: left; border-radius: 5px;}
		footer {width: 100%; height: 100px; background-color: #ffb300;}

		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 23%; }
		}

		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 31.333333%; }
		}

		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%; }
		}
	</style>
</head>
<body>
	
	<div id="wrap">
		<header></header>
		<article></article>
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
		</section>
		<footer></footer>
	</div>

</body>
</html>