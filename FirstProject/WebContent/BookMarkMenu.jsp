<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="JS\jquery-3.6.0.min.js"></script>
<title>���ã�� �޴�</title>
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

    /* ���� ���� */
    a {
      text-decoration-line: none;
    }

    /* ��� text*/
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

    /* ���� ���� ��� �κ� */

    /* �ٵ� */
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
    <!-- �޴�â -->
    <div class="container">
      <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>

      

      <p class="head_text">���󿡼� ���� ���� ������ ��</p>
    </div>
  </header>
  <br><br><br>
  <div>
<% 
	// 3. ���� ��ȸ
	// ������ object�����̱� ������ ������ Ÿ������ ����Ϸ��� ��������ȭ ����
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
    
    <h class="user_imp"><%= id %>�� �α��� �ϼ̾��!</h>
    <h class="user_imp"><%=name%>��.</h>
    <hr>
  </div>
    <br><br><br>
      
  <body>
  <%if(seq==null){ %>
  		<div class="body">���� �ϴ� Ĭ������ ���׿�!! �߰� ���ּ���</div>
  <%} %>
  <%for(int i=0; i<bookmarks.size();i++){ %>
    <div class="body"><a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=bookmarks.get(i)[0]%>"><p id="text"><%= bookmarks.get(i)[1] %></p></a></div>
   <%} %>










<!-- �ڷΰ��� -->
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>