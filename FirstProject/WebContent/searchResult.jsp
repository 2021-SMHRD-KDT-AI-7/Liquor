<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="JS\jquery-3.6.0.min.js"></script>
<title>Layout</title>
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

header {
	width: 100%;
	height: 100px;
	background-color: rgba(18, 18, 18, 1);
}

article {
	width: 100%;
	height: 300px;
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
	height: 170px;
	background-color: #2c2c2c6d;
	float: left;
	border-radius: 5px;
}

footer {
	width: 100%;
	height: 100px;
	background-color: rgba(18, 18, 18, 1);
}
/* 밑줄 제거 */
a {
	text-decoration-line: none;
}

/* 헤드 text */
.head_text {
	color: white;
	font-size: 25px;
	padding: 30px;
	text-align: center;
	font-family: 'CookieRunOTF-Bold';
}

.back_btn {
	padding-top: 40px;
	padding-left: 30px;
	width: 20px;
}

button {
	background-color: black;
	float: left;
	width: 0px;
	display: inline-block;
}

/* 여기 까지 헤드 부분 */

/*  여기부터 article(아티클)*/
#div_search {
	width: 400px;
	height: 250px;
	background-color: #2c2c2c6d;
	display: block;
	margin: auto;
	position: relative;
}

#search {
	height: 180px;
	display: block;
	margin: auto;
	padding-top: 10px;
}

.text {
	color: white;
	text-align: center;
}
/* 여기까지 아티클 */
/* 여기 부터  section */
#section_search {
	height: 120px;
	padding-top: 10px;
	display: block;
	margin: auto;
}
/* 여기 부터  section 끝 */
/* 화면 너비 0 ~ 1000px */
@media ( max-width : 1020px) {
	#wrap {
		width: 100%;
	}
	section>div {
		width: 23%;
	}
}

/* 화면 너비 0 ~ 768px */
@media ( max-width : 768px) {
	section>div {
		width: 31.333333%;
	}
}

/* 화면 너비 0 ~ 480px */
@media ( max-width : 480px) {
	section>div {
		width: 48%;
	}
}
</style>
</head>
<body>
	<% ArrayList<ArrayList> searchResult = new ArrayList<>();
	searchResult = (ArrayList<ArrayList>)session.getAttribute("search_results");
	System.out.println(searchResult.size());
	/* returns.add(seqs);
	returns.add(names);
	returns.add(colors); */
	ArrayList<Integer> seqs = new ArrayList<>();
	ArrayList<String> names = new ArrayList<>();
	ArrayList<String> colors = new ArrayList<>();
	ArrayList<String> imgs = new ArrayList<>();
	seqs=searchResult.get(0);
	names=searchResult.get(1);
	colors = searchResult.get(2);
	imgs=searchResult.get(3);
%>
	<div id="wrap">
		<header>
			<button type="button" class="btn_back" onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<p class="head_text">앱텐더 검색결과</p>
		</header>
		
		<article>
			<br><br>
			<div id="div_search">
				<a
					href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=seqs.get(0)%>">
					<div>
						<img src="<%=imgs.get(0) %>" alt="이미지" id="search">
					</div>
				</a> <br>
				<p class="text"><%= names.get(0) %></p>
			</div>

		</article>
		<section>
			<br>
			<%for(int i=0;i<seqs.size();i++){%>
			<a
				href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=seqs.get(i)%>">
				<div>
					<img id="section_search" src="<%=imgs.get(i) %>" alt="이미지">
			</a>
			<p class="text"><%= names.get(i) %></p>
	</div>
	<%}	%>
	<div></div>
	<div></div>
	<div></div>
	</section>
	<footer></footer>
	</div>
	<script>
	function goBack() {
	window.history.back();
	}
</script>
</body>
</html>