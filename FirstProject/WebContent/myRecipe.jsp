<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������</title>
<script src="JS\jquery-3.6.0.min.js"></script>
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
#wrap {width: 1200px; height: 1000px; margin: 0 auto;background-color: rgba(18, 18, 18, 1);}
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #fffde7;
}

#wrap {
	width: 1200px;
	margin: 0 auto;
}

article {
	width: 100%;
	height: 145px;
	background-color: rgba(18, 18, 18, 1);
}

section {
	overflow: hidden;
	padding: 5%;
	width: 90%;
	background-color: rgba(18, 18, 18, 1);
}

section>div {
	width: 18%;
	margin: 1%;
	height: 226px;
	background-color: rgba(18, 18, 18, 1);
	float: left;
	border-radius: 5px;
}

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
	background-color: rgba(18, 18, 18, 1);
}

/* ���� ���� */
a {
	text-decoration-line: none;
	color: tomato;
}

/* ��� text*/
.head_text {
	color: white;
	font-size: 25px;
	padding: 30px;
	text-align: center;
	font-family: 'CookieRunOTF-Bold';
}

.back_btn {
	width: 20px;
	background-color: rgba(18, 18, 18, 1);
	padding-top: 40px;
	padding-left: 30px;
}

button {
	background-color: black;
	float: left;
	width: 0px;
	display: inline-block;
}

/* ���� ���� ��� �κ� */
/* ���Ǻκ�*/
section{
	
}
/* ȭ�� �ʺ� 0 ~ 1000px */
@media ( max-width : 1020px) {
	#wrap {
		width: 100%;
	}
	section>div {
		width: 28%;
	}
	#intro {
		font-size: 42px;
	}
	#btn1 {
		font-size: 13px;
		margin-top: 41px;
	}
	#btn2 {
		font-size: 13px;
	}
	img {
		width: 100%
	}
}

/* ȭ�� �ʺ� 0 ~ 768px */
@media ( max-width : 768px) {
	section>div {
		width: 48%;
	}
	#intro {
		font-size: 24px;
	}
	#btn1 {
		font-size: 11px;
	}
	#btn2 {
		font-size: 11px;
		margin-top: 65px;
	}
	img {
		width: 100%
	}
}

/* ȭ�� �ʺ� 0 ~ 480px */
@media ( max-width : 480px) {
	section>div {
		width: 48%;
	}
	#intro {
		font-size: 21px;
	}
	img {
		width: 100%
	}
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

#rec_name {
	color: white;
}

#warning {
	color: white;
	font-size: 140%;
	text-align: center;
}

.mix_btn {
	float: right;
	width: 30px;
	padding-top: 40px;
	padding-right: 30px;
	position: relative;
}
#warning{
	background:
}
</style>
</head>
<body bgcolor="rgba(18, 18, 18, 1);">
	<div id="wrap">
		<header>
			<button type="button" class="btn_back" onclick="goBack()">
				<img class="back_btn" src="img_ex\back.png" alt="">
			</button>
			<a id="btn_mix" href="test_guide.html"><img class="mix_btn"
				src="./img_ex/shaker.png" alt="�ͼ� �̹���"></a>
			<p class="head_text">���󿡼� ���� ���� ������ ��</p>
		</header>
		<%
	ArrayList<String[]> load_recipe = new ArrayList<>();
	load_recipe = (ArrayList<String[]>)session.getAttribute("my_recipe_list");
		System.out.println("jsp���� �ҷ��� load_recipe ������"+load_recipe.size());



    if(load_recipe==null){
        %>
		<br>
		<br>
		<br>
		<br>
		<br>

		<section id="warning">

			<h1 id="mycoc" class="head_text"><a href="RecipePage.jsp">������ Ĭ������ ����� ������!</a></h1>

		</section>
		<footer></footer>
	</div>
	<%}else{
		for(int k=0;k<load_recipe.size();k++){
	String[] element = load_recipe.get(k); 
	String seq=element[0];
	String name=element[1];
				
				%><div id="rec_name<%=k%>"><%=name%> ,<%=seq%></div>
		<%
		
		
	}
	}%>

	<article id="btn_g">
		<button id="btn1">�����ϱ�</button>
		<button id="btn2">�����ϱ�</button>
	</article>

	<section>
	

			<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>

	</section>


	</div>







	<!-- �ڷΰ��� -->
	<script>
    function goBack() {
      window.history.back();
    }
  </script>

</body>
</html>