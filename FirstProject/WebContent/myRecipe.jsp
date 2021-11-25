<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나만의 레시피</title>
<script src="JS\jquery-3.6.0.min.js"></script>
<style>
* {margin: 0; padding: 0;}
body {background-color: #fffde7;}
#wrap {width: 1200px; margin: 0 auto;}

article {width: 100%; height: 145px; background-color: rgba(14, 10, 11, 1);}
section {overflow: hidden; padding: 5%; width: 90%; background-color: rgba(14, 10, 11, 0.8);}
section>div {width: 18%; margin: 1%; height: 226px; background-color: rgba(14, 10, 11, 1); float: left; border-radius: 5px;}


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

    /* 밑줄 제거 */
    a {
      text-decoration-line: none;
    }

    /* 헤드 text*/
    .head_text {
      color: white;
      
     font-size: 25px;
     padding:30px;
     text-align:center;
     
     
      
     }
 
    .back_btn {
     width: 20px;
     background-color: rgba(18, 18, 18, 1);
      
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

/* 화면 너비 0 ~ 1000px */
@media ( max-width : 1020px) {
	#wrap {width: 100%;}
	section>div {width: 28%;}
	#intro {font-size: 42px;}
	#btn1 {font-size: 13px; margin-top: 41px;}
	#btn2 {font-size: 13px;}
	img{width: 100%}
	
}

/* 화면 너비 0 ~ 768px */
@media ( max-width : 768px) {
	section>div {width: 48%;}
	#intro {font-size: 24px;}
	#btn1 {font-size: 11px;}
	#btn2 {font-size: 11px; margin-top: 65px;}
	img{width: 100%}
}

/* 화면 너비 0 ~ 480px */
@media ( max-width : 480px) {
	section>div {width: 48%;}
	#intro {font-size: 21px;}
	img{width: 100%}
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

#rec_name{
	color: white;
}

#warning{
	color: white;
	font-size: 140%;
	text-align: center;
}

.mix_btn{
	float: right;
	width:30px;
	padding-top: 40px;
	padding-right: 30px;
	position: relative;
}
</style>
</head>
<body>
	<div id="wrap">
        <header>
            
               
               	<button type="button" class="btn_back" onclick="goBack()"><img class="back_btn" src="img_ex\back.png" alt=""></button>
                <a id="btn_mix" href="test_guide.html"><img class="mix_btn" src="./img_ex/shaker.png" alt="믹서 이미지"></a>
                <p class="head_text" >나만의 레시피</p>
              
               
            
        </header>
    <%
	ArrayList<ArrayList> load_recipe = new ArrayList<>();
	load_recipe = (ArrayList<ArrayList>)session.getAttribute("load_recipe");
    System.out.print("load_recipe");
    if(load_recipe==null){
        %>
        <br><br><br><br><br>
    
	<section id="warning">
	
	  <h1>나만의 칵테일을 만들어 보세요!</h1>
	   
	</section>
	<footer></footer>
	</div>
	<%}else{
	
	ArrayList<String> names = new ArrayList<>();
	ArrayList<Integer> amounts = new ArrayList<>();
	ArrayList<String> cautions = new ArrayList<>();
	if(load_recipe != null){
		names = load_recipe.get(0);
		amounts = load_recipe.get(1);
		cautions = load_recipe.get(2);
	}
	%>
	
		<article id="btn_g">
			<button id="btn1">수정하기</button>
			<button id="btn2">저장하기</button>
		</article>

		<section>
		<%if(load_recipe != null){ %>
			<%for(int i=0;i<names.size();i++){			
				%><div id="rec_name<%=i%>"></div>
			<%}%>
		<%}else{ %>
			
		<%} }%>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		
		</section>

		
	</div>
	
	
	
	
	
	
	
	<!-- 뒤로가기 -->
   <script>
    function goBack() {
      window.history.back();
    }
  </script>
    
</body>
</html>