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
	<style>
		* {margin: 0; padding: 0;}
		body {background-color: #fffde7;}
     	 #wrap {width: 1200px; margin: 0 auto;}
     	 header {width: 100%; height: 40px; background-color: rgba(14, 10, 11, 1);}
      	article {width: 100%; height: 130px; background-color: rgba(14, 10, 11, 1);}
      	section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 0.8);}
		#sub_sec {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 1);}
		section > div {width: 18%; margin: 1%; height: 170px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}
		#sub_sec > .ses_button {width: 20%; margin: 2%; height: 50px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}
      	footer {width: 100%; height: 100px; background-color: rgba(14, 10, 11, 1);}
      	#intro {font-size: 60px; color: #22D3D7; text-align: center;} 
		 .title{font-size: 20px; text-align: center;} 
		p{font-size: 12px; color:rgb(214, 214, 214);} 
		img{width: 60%; height: 60%; text-align: center; display: block; margin: 5% auto;  }
		.ses{text-align: center; vertical-align: top; margin-right : 6px; padding : -5px;}
		#reco_keyword{font-size: 30px; text-align: center; color:#22D3D7; margin: 5%; vertical-align: text-top;}
		button{font-size: 22px; text-align: center; border-radius: 5px; margin-bottom: 10%; background-color: rgba(14, 10, 11, 1);
		 color : #22D3D7; padding : 5px; width: 100%; height: 100%;}
		 h1.a:after{ content: ""; display: block; width: 38%; border-bottom: 3px solid #22D3D7; margin: 10px auto;}



		/* 화면 너비 0 ~ 1000px */
		@media (max-width: 1020px){
			#wrap {width: 100%;}
			section > div {width: 23%; }
			#sub_sec > .ses_button {width: 20%; height: 45px;}
			#intro{font-size: 44px;}
			button{font-size: 20px;}
			#reco_keyword{font-size: 25px;}
		}

		/* 화면 너비 0 ~ 768px */
		@media (max-width: 768px){
			section > div {width: 31.333333%; }
			#sub_sec > .ses_button {width: 20%; height: 40px; margin: 1%;}
			.title{font-size: 15px;}
			p{font-size: 11px;}
			#intro{font-size: 25px;}
			button{font-size: 15px}
			#reco_keyword{font-size: 18px;}
		}
		/* 화면 너비 0 ~ 520px */
		@media (max-width: 520px){
			section > div {width: 42%; margin: 4%; }
			#sub_sec > .ses_button {width: 18%; height: 30px; margin: 1%;}
			.title{font-size: 15px;}
			p{font-size: 11px;}
			#intro{font-size: 25px;}
			button{font-size: 13px}
			#reco_keyword{font-size: 18px;}
		}

		/* 화면 너비 0 ~ 480px */
		@media (max-width: 480px){
			section > div {width: 48%;}
			#sub_sec > .ses_button {width: 15%; height: 20px; margin: 1%;}
			.title{font-size: 10px;}
			p{font-size: 8px; margin: 1%;}
			#intro{font-size: 18px;}
			button{font-size: 12px}
			#reco_keyword{font-size: 12px;}
		}

	</style>
</head>
<body>
	
	<div id="wrap">
		<header></header>
		<article>
			 <h1 id="intro" class="a">Best Cocktail</h1> <!--추천화면 타이틀 -->
		</article>
		<section id="sub_sec"> <!--추천버튼 섹션 -->
			<h3 id="reco_keyword"> Best Keywords </h3>
			<div class="ses_button">	
				<button type="button" class="ses"> # 저도수 </button>
			</div>
			<div class="ses_button">
				<button type="button"  class="ses"> # 연말 </button>
			</div>	
			<div class="ses_button">	
				<button type="button"  class="ses"> # 보드카 </button>
			</div>
			<div class="ses_button">
				<button type="button"  class="ses"> # 라임 </button>
			</div>
			<div class="ses_button">
				<button type="button" class="ses"> # 레몬 </button>
			</div>
			<div class="ses_button">
				<button type="button"  class="ses"> # RED </button>
			</div>
		</section>

		<section> <!--칵테일 정보 출력 섹션 -->
			<div><img src="./cock_sample.jpg"><p class="title">제목<p><p>설명</p></div>
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