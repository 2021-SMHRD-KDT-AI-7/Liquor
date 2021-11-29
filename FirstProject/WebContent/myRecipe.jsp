<%@page import="Model.MemberDTO"%>
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
     	font-family: 'CookieRunOTF-Black';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Black00.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
         @font-face {
        font-family: 'CookieRun-Regular';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
         @font-face {
        font-family: 'CookieRunOTF-Bold';
   		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
        font-weight: normal;
        font-style: normal;
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
      text-align: center;
      font-size: 25px;
      font-weight: 800;
      padding-top: 35px;
  	  font-family: 'CookieRunOTF-Bold';
    }

    .back_btn {
      width: 20px;
      height: 20px;
      background-color: rgba(18, 18, 18, 1);
      padding: 0px;
      padding-top: 40px;
      border: 0px;
      position: absolute;
    }

    .mix_btn {
      width: 30px;
      height: 30px;
      position: absolute;
    }

    #head_g {
      float: right;
      display: block;
      width: 100px;
      margin-top: 35px;
    }

    button {
      background-color: black;
      padding: 0px;
      border: 0px;
      float: left;
      display: block;
      width: 120px;
      
    }

    /* 여기 까지 헤드 부분 */

    /* 바디 */
    body {
      background-color: rgba(18, 18, 18, 1);
    }

    .body {
      background-color: #2c2c2c6d;
      margin: 30px;
      height: 50px;
      padding-bottom: 5px;
      border-radius: 2ex;
      color: aliceblue;
      padding-top: 10px;
      padding-left: 30px;
      font-family: 'CookieRun-Regular';
      
    }

    .p_text {
      width: 330px;
      font-size: 20px;
      color: aliceblue;

    }

    .user_imp {
      color: aliceblue;
      text-align: center;
      display: block;
      width: auto;
      font-family: 'CookieRunOTF-Bold';
    }
    hr{
      border:solid 1px aliceblue; width: 85%;
    }
    
    #text{
    	color:white;
    }
  </style>
</head>
<body>
 <header>
    <!-- 메뉴창 -->
    <div class="container">
      <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>

      

      <p class="head_text">세상에서 가장 작은 나만의 바</p>
    </div>
  </header>
  <br><br><br>
  <div>
<% 
	// 3. 세션 조회
	// 세션은 object형태이기 때문에 본래의 타입으로 사용하려면 강제형변화 진행
	System.out.print("asdfasd");
	String Sseq="";
	String cockName="";
	String Sname="";
	String id="";
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	id=info.getId();
	Sname=info.getName();
	if(info!=null){
	System.out.println("인포 제대로 들어옴");}
	else{
		System.out.println("인포 없음");}
%>		
		
	<h class="user_imp"><%= id %>로 로그인 하셨어요!</h>
    <h class="user_imp"><%=Sname%>님.</h>
    <hr>
  </div>
    <br><br><br>	
	<body>
	
	
	
	
	</body>	
		
		
		
		
		
		
		
		
		
		
		<%
		
			ArrayList<String[]> load_recipe = new ArrayList<>();
		load_recipe = (ArrayList<String[]>) session.getAttribute("my_recipe_list");
		System.out.println("jsp에서 불러온 load_recipe 사이즈" + load_recipe.size());
		String name="";
		String seq="";
		if (load_recipe == null) {
		%>
		<br> <br> <br> <br> <br>
		<article id="warning">
			<h1 id="mycoc" class="head_text">
				<a href="RecipePage.jsp">나만의 칵테일을 만들어 보세요!</a>
			</h1>
			<%
				} else {
			for (int k = 0; k < load_recipe.size(); k++) {
				String[] element = load_recipe.get(k);
				seq = element[0];
				name = element[1];
				%>
				<div class="body"><a href="http://210.223.239.217:8081/FirstProject/MyRecipeGuideCon?seq=<%=seq%>&name=<%=name%>"><p id="text" ><%=name%></p></a></div>
				
			<%}%>
			<%}%>
		
			
		<footer></footer>
	</div>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>