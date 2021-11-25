<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="JS\jquery-3.6.0.min.js"></script>
<title>즐겨찾기 메뉴</title>
  <style>
     /* 밑줄 없애기 */
        a {
  text-decoration-line: none;
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
      font-style: italic;
      font-weight: 800;
      padding-top: 35px;
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
<<<<<<< HEAD
      <a id="head_g" href="test_guide.html"><img class="mix_btn" src="./img_ex/shaker.png" alt="믹서 이미지"></a>

      <p class="head_text">나만의 좋아요!</p>
    </div>
  </header>
  <br><br><br>
  <div>
<% 
	// 3. 세션 조회
	// 세션은 object형태이기 때문에 본래의 타입으로 사용하려면 강제형변화 진행
	System.out.print("asdfasd");
	String seq="";
	String cockName="";
	String name="";
	String id="";
	MemberDTO dto = (MemberDTO)session.getAttribute("info");
	id=dto.getId();
	name=dto.getName();
	ArrayList<String[]> bookmarks = new ArrayList<>();
	bookmarks = (ArrayList<String[]>)session.getAttribute("bookmark");
	if(bookmarks != null){
	for(int i=0;i<bookmarks.size();i++){		
		 seq=bookmarks.get(i)[0];
		 cockName = bookmarks.get(i)[1];}
	}
	
	System.out.print(cockName);
%>
    
    <h class="user_imp"><%= id %>로 로그인 하셨어요!</h>
    <h class="user_imp"><%=name%>님.</h>
    <hr>
  </div>
    <br><br><br>
      
  <body>
  <%if(seq==null){ %>
  		<div class="body">좋아 하는 칵테일이 없네요!! 추가 해주세용</div>
  <%} %>
  <%for(int i=0; i<bookmarks.size();i++){ %>
    <div class="body"><a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=bookmarks.get(i)[0]%>"><p id="text"><%= bookmarks.get(i)[1] %></p></a></div>
   <%} %>










<!-- 뒤로가기 -->
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>