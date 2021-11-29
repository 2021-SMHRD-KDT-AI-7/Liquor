<%@page import="java.net.URLDecoder"%>
<%@page import="Model.Cock_SeqsDAO"%>
<%@page import="Model.Cock_SeqsDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.Cock_RecoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cock_RecoDAO"%>
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
	background-color: #10b3d8;
	float: left;
	border-radius: 5px;
}

footer {
	width: 100%;
	height: 100px;
	background-color:rgba(18, 18, 18, 1);
}

/* ȭ�� �ʺ� 0 ~ 1000px */
@media ( max-width : 1020px) {
	#wrap {
		width: 100%;
	}
	section>div {
		width: 23%;
	}
}

/* ȭ�� �ʺ� 0 ~ 768px */
@media ( max-width : 768px) {
	section>div {
		width: 31.333333%;
	}
}

/* ȭ�� �ʺ� 0 ~ 480px */
@media ( max-width : 480px) {
	section>div {
		width: 48%;
	}
}
/* ��� text */
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

/* ���� ���� ��� �κ� */
/* ���� ���� article */

#subintro{
	text-align: center;
	color: white;
}

/* ���� ���� article �κ� */
/* ���� ����  section �κ� */
.sec_div{
	background-color:#2c2c2c6d;
	height:200px;
}
#sec_img{
	height: 120px;
	padding-top: 10px;
	display: block;
	margin: auto;
}
.title{
	color: white;
	text-align: center;
}

/* ���� ����  section �κ� */

</style>
</head>
<body>
<%
	
	Cock_RecoDAO dao = new Cock_RecoDAO();
	ArrayList<Cock_RecoDTO> cr_list = dao.viewcock_RecoDTO();
	Cock_SeqsDAO dao2 = new Cock_SeqsDAO();
	ArrayList<Cock_SeqsDTO> dto_list = dao2.CockSeqs();
	String opinion = null;
	opinion = request.getParameter("opinion");
	/* opinion = (String)request.getAttribute("��õ"); */
	//opinion = URLDecoder.decode(request.getParameter("opinion"), "euc-kr") ;
	// opinion = request.getParameter("opinion") ;
	
	//���� ��¥�� ���� �������� season�� ����
	LocalDate now = LocalDate.now();
	int month_now = now.getMonthValue();
	String season = null;
	
	if(month_now > 9&&month_now <= 12) {
		season="����";
	}else if(month_now > 6&&month_now <= 9){
		season="����";
	}else if(month_now > 3&&month_now <= 6){
		season="��";
	}else if(month_now > 0&&month_now <= 3){
		season="����";
	}
	
	System.out.println();
	System.out.println("opinion : "+opinion);
	System.out.println(season);
%>
	<div id="wrap">
		<header>
			<button type="button" class="btn_back" onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<p class="head_text">���ٴ��� ��õ!</p>
		</header>

		<article>
			  <!--��õȭ�� Ÿ��Ʋ -->
			 <p id="subintro">
			 	<%if(opinion!=null){%>
			 		<%if(opinion.equals("����")){ %>
			 	 		#<%="�θ�ƽ" %>
			 	 	<%}else { %>
			 	 		#<%=opinion %>
			 	 	<%} %>
			 	<%}else{ %>
			 		#<%=season %>
			 	<%} %>
			 </p>
		</article>
		
		<!--main���������� �̹����� Ŭ���ϸ� (reco_opinion) ���Ǻ� ��� -->
		<section>
		<%if(opinion!=null){ %>
			<%for(int i =0; i<cr_list.size(); i++) { %>
				<%if(cr_list.get(i).getReco_opinion().equals(opinion)) {%>
					<a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>">
					<div class="sec_div"><img id="sec_img" src="<%=cr_list.get(i).getCocktail_img() %>">
					</a>
					<p class="title"><%=cr_list.get(i).getCocktail_name() %></p>
					<p class="title"><%=cr_list.get(i).getCocktail_speciality().replace(";"," ") %></p>
					</div>
				<%}%>
			<%}%>
				<!--�׳� ������ �� reco_opinion�� ���� ��(month)�� ���ؼ� ���Ǻ� ��� -->
		<%}else { %>
			<%for(int i =0; i<cr_list.size(); i++) { %>
				<%if(cr_list.get(i).getReco_opinion().equals("��Ƽ")){%>
				<a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>">
				<div class="sec_div"><img id="sec_img" src="<%=cr_list.get(i).getCocktail_img() %>">
				</a>
				<p class="title"><%=cr_list.get(i).getCocktail_name() %></p>
				<p class="title"><%=cr_list.get(i).getCocktail_speciality().replace(";"," ") %></p>
				</div> 
				<%}%>
			<%}%>
		<%}%>
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