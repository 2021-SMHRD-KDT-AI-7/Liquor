<%@page import="Model.Cock_SeqsDTO"%>
<%@page import="Model.Cock_SeqsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="JS\jquery-3.6.0.min.js"></script>
	<style>
		* {margin: 0; padding: 0;}
     	 #wrap {width: 1200px; margin: 0 auto;}
		 body {background-color: rgba(18, 18, 18, 1);}
     	 header {
			  width: 100%; 
			  height: 80px; 
			  background-color: rgba(18, 18, 18, 1);
			}
      	article {
			  width: 100%; 
			  height: 150px; 
			  background-color: blue;
			}
      	section {
			  overflow: hidden; 
			  padding: 5%; width: 1000px; 
			  background-color: green;
			  display
			}
		#sub_sec {
			overflow: hidden; 
			padding: 5%; 
			width: 90%; 
			background-color: red;
			}
		section > div {
			width: 18%; 
			margin: 1%; 
			height: 170px; 
			background-color: rgba(18, 18, 18, 1);
			float: left; 
			border-radius: 5px;
			}
		#sub_sec > .ses_button {
			width: 20%; 
			margin: 2%; 
			height: 50px; 
			background-color: yellow;
			float: left; 
			border-radius: 5px;
			}
      	footer {
			  width: 100%; 
			  height: 100px; 
			  background-color: rgba(18, 18, 18, 1);
			}
      	#intro {
			  font-size: 60px; 
			  color: #22D3D7; 
			  text-align: center;
			  margin-right: 70px;
			  letter-spacing: 20px;
			}
		#subintro{
			font-size: 22px; 
			color: #22D3D7; 
			margin-right: 10%;
			margin-bottom: 5%;
			text-align: center;
		}
		.title{
			font-size: 20px; 
			text-align: center;
			} 
		p{
			font-size: 12px; 
			color:rgb(214, 214, 214);
			text-align: center;
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
		
		
		#btn_b{ background-color: rgba(18, 18, 18, 1);
            padding: 0px;
            border: 0px;
            float: left; 
            display: block;
            width: 100px;
			}
			
		}
		#btn_b{
			background-color: rgba(18, 18, 18, 1); 
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
			#subintro{font-size: 22px; margin-right: 8%;}
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
			  letter-spacing: 12px;}
			#subintro{font-size: 18px; margin-right: 5%;}
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
			  letter-spacing: 11px;}
			#subintro{font-size: 15px; margin-right: 2%;}
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
			#subintro{font-size: 12px;}
			button{font-size: 12px}
			#reco_keyword{font-size: 12px;}
			.mix_btn{width: 20px; height: 20px;}
			.back_btn{width: 20px; height: 20px;}
			#btn_b{width: 50px;}
		}
  /* 밑줄 제거 */
    a {
      text-decoration-line: none;
    }

    /* 헤드 text */
    .head_text {
      color: white;
      
     font-size: 25px;
     padding:30px;
     text-align:center;
      
     }
 
    .back_btn {
    
   
      
	padding-top: 40px;
	padding-left: 30px;
     
    }
      
    button {
      background-color: black;
      float:left;
      width: 0px;
      display:inline-block;
    }

    /* 여기 까지 헤드 부분 */

	
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
<header>
	<button type="button" class="btn_back" onclick="goBack()"><img class="back_btn" src="img_ex\back.png" alt=""></button>
	<p class="head_text" >검색 결과</p>
</header>
<br><br><br><br><br><br><br>	
<br><br><br><br><br><br><br>	
	
<section>
	
	  <%for(int i=0;i<seqs.size();i++){%> 
			<a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=seqs.get(i)%>">
			<div><img src="<%=imgs.get(i) %>" alt="이미지">
			</a>	
			<p class="title"><%= names.get(i) %></p>
			</div>
		<%}	%>

<script>
	function goBack() {
	window.history.back();
	}
</script>
</body>
</html>