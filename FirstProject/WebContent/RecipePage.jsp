<%@page import="Model.MemberDTO"%>
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
	<script src="JS\jquery.min_1.12.4.js"></script>
<script src="JS\modernizr-custom.js"></script>
<script src="JS\slick.min.js"></script>
<link rel="stylesheet" href="_CSS\slick.css">
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
		* {margin: 0; padding: 0;}
        body {background-color: #fffde7;}
		#wrap {width: 1200px; margin: 0 auto;}
		header {width: 100%; height: 100px; background-color: rgba(18, 18, 18, 1);}
		article {width: 100%; height: 350px; background-color: rgba(18, 18, 18, 1);}
		section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(18, 18, 18, 1);}
		section > div {width: 18%; margin: 1%; height: 170px; background-color: rgba(18, 18, 18, 1); float: left; border-radius: 5px;}
		footer {width: 100%; height: 100px; background-color: rgba(18, 18, 18, 1);}
		
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
.body_3 {
	background-color: #2c2c2c;
	margin: 30px;
	margin-top:0px;
	margin-bottom: 0;
	padding: 70px;
	padding-top: 100px;
	padding-bottom: 5px;
	border-radius: 2ex;
}
/* 여기까지 아티클 */
/* 여기 부터  section */
#section_search {
	height: 120px;
	padding-top: 10px;
	display: block;
	margin: auto;
	
}
#section_img{
	background-color:#2c2c2c6d;
	height: 180px

}
#section_name{
	font-family: 'CookieRun-Regular';
	color: white;
	text-align: center
}
/* 여기 부터  section 끝 */
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

<%		
		// 시퀀스와 이미지만  가져온다
		Cock_SeqsDAO dao = new Cock_SeqsDAO();
		ArrayList<Cock_SeqsDTO> dto_list = dao.CockSeqs();
		System.out.println("main_seq>>>"+dto_list.get(0).getCocktail_seq());
%>
	<div id="wrap">
		<header>
			<button type="button" class="btn_back" onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<p class="head_text">레시피</p>		
		</header>
		<article>
			
	<div class="body_3">
		<div class="slider">
			<% for(int i=0; i<dto_list.size();i++){ %>
			<div>
				<a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>">
					<img src="<%=dto_list.get(i).getCocktail_img() %>" alt="이미지"></a>
					<p id="section_name"><%= dto_list.get(i).getCocktail_name() %></p>
			</div>

			<% }%>
		</article>
		
		<section>
		<% for(int i=0; i<dto_list.size();i++){ %>
			<div id="section_img">
				<a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>">
				<img id="section_search" src="<%=dto_list.get(i).getCocktail_img() %>" alt="이미지"></a><br>
				<p id="section_name"><%= dto_list.get(i).getCocktail_name() %></p>
			</div>
			<%} %>
			
		
		</section>
		<footer></footer>
	</div>
<script>
        //이미지 슬라이더
        $(".slider").slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 1000,
            arrows: false,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: true,
                        dots: false
                    }
                }]
        });
    </script>

</body>
</html>