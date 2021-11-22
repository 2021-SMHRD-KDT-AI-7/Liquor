<%@page import="java.time.LocalDate"%>
<%@page import="Model.Cock_RecoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cock_RecoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Recommend</title>
	<script src="JS\jquery-3.6.0.min.js"></script>
	<style>
		* {margin: 0; padding: 0;}
		body {background-color: #fffde7;}
     	 #wrap {width: 1200px; margin: 0 auto;}
     	 header {
			  width: 100%; 
			  height: 80px; 
			  background-color: rgba(14, 10, 11, 1);
			}
      	article {
			  width: 100%; 
			  height: 130px; 
			  background-color: rgba(14, 10, 11, 1);
			}
      	section {
			  overflow: hidden; 
			  padding: 5%; width: 90%; 
			  background-color: rgba(14, 10, 11, 0.8);
			}
		#sub_sec {
			overflow: hidden; 
			padding: 5%; 
			width: 90%; 
			background-color: rgba(14, 10, 11, 1);
			}
		section > div {
			width: 18%; 
			margin: 1%; 
			height: 170px; 
			background-color: rgba(14, 10, 11, 1); 
			float: left; 
			border-radius: 5px;
			}
		#sub_sec > .ses_button {
			width: 20%; 
			margin: 2%; 
			height: 50px; 
			background-color: rgba(14, 10, 11, 1); 
			float: left; 
			border-radius: 5px;
			}
      	footer {
			  width: 100%; 
			  height: 100px; 
			  background-color: rgba(14, 10, 11, 1);
			}
      	#intro {
			  font-size: 60px; 
			  color: #22D3D7; 
			  text-align: center;
			  margin-right: 70px;
			  letter-spacing: 30px;
			} 
		.title{
			font-size: 20px; 
			text-align: center;
			} 
		p{
			font-size: 12px; 
			color:rgb(214, 214, 214);
			} 
		img{
			width: 60%; 
			height: 60%; 
			text-align: center;
			display: block; 
			margin: 5% auto;  
			}
		.ses{
			text-align: center; 
			vertical-align: top; 
			margin-right : 6px; 
			padding : -5px;
			}
		#reco_keyword{
			font-size: 30px; 
			text-align: center; 
			color:#22D3D7; 
			margin: 5%; 
			vertical-align: text-top;
			}
		button{
			font-size: 22px; 
			text-align: center; 
			border-radius: 5px; 
			margin-bottom: 10%; 
			background-color: rgba(14, 10, 11, 1);
		 	color : #22D3D7; 
			padding : 5px; 
			width: 100%; height: 100%;
			}
		.back_btn{
			width: 30px; 
			height: 30px; 
			background-color: rgba(14, 10, 11, 1);
			padding: 0px;
         	padding-top: 40px; 
			 border: 0px; 
			}
		#btn_b{ background-color: rgba(14, 10, 11, 1);
            padding: 0px;
            border: 0px;
            float: left; 
            display: block;
            width: 100px;
			}
		.mix_btn{
			width: 35px; 
			height: 35px; 
			
			}
		#mix_a{
			float:right; 
			display: block; 
			width: 100px; 
			margin-top: 35px;
		}
		#btn_b{
			background-color: rgba(14, 10, 11, 1); 
			padding: 0px; 
			border: 0px; 
			float: left; 
			display: block; 
			width: 120px;
			}
		
		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 23%; }
			#sub_sec > .ses_button {width: 20%; height: 45px;}
			#intro{font-size: 44px;}
			button{font-size: 20px;}
			#reco_keyword{font-size: 25px;}
			.mix_btn{width: 28px; height: 28px;}
			.back_btn{width: 28px; height: 28px;}
			#btn_b{width: 90px;}
		}

		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 31.333333%; }
			#sub_sec > .ses_button {width: 20%; height: 40px; margin: 1%;}
			.title{font-size: 15px;}
			p{font-size: 11px;}
			#intro{font-size: 25px;  margin-right: 60px;
			  letter-spacing: 15px;}
			button{font-size: 15px}
			#reco_keyword{font-size: 18px;}
			#btn_b{width: 80px;}
		}
		/* 화면 너비 0 ~ 520px */
		@media (max-width: 520px){
			section > div {width: 42%; margin: 4%; }
			#sub_sec > .ses_button {width: 18%; height: 30px; margin: 1%;}
			.title{font-size: 15px;}
			p{font-size: 11px;}
			#intro{font-size: 25px;  margin-right: 60px;
			  letter-spacing: 12px;}
			button{font-size: 13px}
			#reco_keyword{font-size: 18px;}
			.mix_btn{width: 25px; height: 25px;}
			.back_btn{width: 25px; height: 25px;}
			#btn_b{width: 70px;}
		}

		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%;}
			#sub_sec > .ses_button {width: 15%; height: 20px; margin: 1%;}
			.title{font-size: 10px;}
			p{font-size: 8px; margin: 1%;}
			#intro{font-size: 18px;  margin-right: 40px;
			  letter-spacing: 10px;}
			button{font-size: 12px}
			#reco_keyword{font-size: 12px;}
			.mix_btn{width: 20px; height: 20px;}
			.back_btn{width: 20px; height: 20px;}
			#btn_b{width: 50px;}
		}

	</style>
</head>
<body>
<%
	Cock_RecoDAO dao = new Cock_RecoDAO();
	ArrayList<Cock_RecoDTO> cr_list = dao.viewcock_RecoDTO();
	String Reco_opinion = request.getParameter("Reco_opinion");
	
	//현재 날짜의 달을 기준으로 season을 구분
	LocalDate now = LocalDate.now();
	int month_now = now.getMonthValue();
	String season = null;
	
	if(month_now > 9&&month_now <= 12) {
		season= "test";
	}else if(month_now > 6&&month_now <= 9){
		season="test2";
	}else if(month_now > 3&&month_now <= 6){
		season="test";
	}else if(month_now > 0&&month_now <= 3){
		season="test2";
	}
	
	// 버튼세션 조건문 모음
	String ses ="0";
	Integer sessou = 0;
	Integer sesswt = 0;
	Integer sesalc = 0;
	Integer sesflav = 0;
	
	if((String)session.getAttribute("분류")!=null) {
		ses=(String)session.getAttribute("분류");
	}
	else if((Integer)session.getAttribute("당도")!=null) {
		sesswt = (Integer)session.getAttribute("당도");
	}
	else if((Integer)session.getAttribute("산도")!=null) {
		sessou = (Integer)session.getAttribute("산도");
	}
	else if((Integer)session.getAttribute("도수")!=null) {
		sesalc = (Integer)session.getAttribute("도수");
	}
	else if((Integer)session.getAttribute("향번호")!=null) {
		sesflav = (Integer)session.getAttribute("향번호");
	}
%>
	<script>
        function goBack() {
        window.history.back();
        }
    </script>
	<div id="wrap">
		<header>
		 <!-- 메뉴창 -->
		    <div class="container">
		    	
            	<button id="btn_b" onclick="goBack()"><img class="back_btn" src="img\pngwing.com (1).png" alt=""></button>
            	<a id="mix_a" href="칵테일가이드.html"><img class="mix_btn" src="img\cocktailmixer.png" alt="믹서 이미지"></a>
        	</div>
		</header>
		
		<article>
			 <h1 id="intro" class="a">Best Cocktail</h1> <!--추천화면 타이틀 -->
		</article>
  	<form action="Cock_RecomCon" method="get">
		
		<section id="sub_sec"> 추천버튼 섹션
			<h3 id="reco_keyword"> Best Keywords </h3>
			<div class="ses_button">	
				<button type="submit" name="sesalc" value=4> # 여자 </button>
			</div>
			<div class="ses_button">
				<button type="submit"  name="ses" value="test"> # 할로윈 </button>
			</div>	
			<div class="ses_button">	
				<button type="submit"  name="ses" value="red"> # 빨강 </button>
			</div>
			<div class="ses_button">
				<button type="submit"  name="sessou" value=3> # 라임 </button>
			</div>
			<div class="ses_button">
				<button type="submit" name="sesflav" value=15> #토마토 </button>
			</div>
		</section>
	</form>
		<section> <!--main페이지에서 이미지를 클릭하면 (reco_opinion) 조건부 출력 -->
		<%if(Reco_opinion!=null){ %>
			<%for(int i =0; i<cr_list.size(); i++) { %>
				<%if(cr_list.get(i).getReco_opinion().equals(Reco_opinion)) {%>
					<a href="recipeInfo.jsp?num=<%=cr_list.get(i).getCocktail_seq()%>">
					<div><img src="./파나콜라다.png">
					</a>
					<p class="title"><%=cr_list.get(i).getCocktail_name() %></p>
					<p><%=cr_list.get(i).getCocktail_speciality() %></p>
					</div>
				<%}%>
			<%}%>
			<!--그냥 들어왔을 시 reco_opinion을 현재 달(month)과 비교해서 조건부 출력 -->
		<%}else if(ses=="0"&&sesalc==0&&sesswt==0&&sessou==0&&sesflav==0) { %>
			<%for(int i =0; i<cr_list.size(); i++) { %>
				<%if(cr_list.get(i).getReco_opinion().equals(season)){%>
				<a href="recipeInfo.jsp?num=<%=cr_list.get(i).getCocktail_seq()%>">
				<div><img src="./cock_sample.jpg">
				</a>
				<p class="title"><%=cr_list.get(i).getCocktail_name() %></p>
				<p><%=cr_list.get(i).getCocktail_speciality() %></p>
				</div>
				<%}%>
			<%}%>
		<%}%>
			
			
			
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