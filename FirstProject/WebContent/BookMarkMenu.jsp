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
  </style>
</head>
<body>
 <header>
    <!-- �޴�â -->
    <div class="container">
      <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>
      <a id="head_g" href="test_guide.html"><img class="mix_btn" src="./img_ex/Ĭ���Ϲͼ�-1.png.png" alt="�ͼ� �̹���"></a>
      <p class="head_text">������ ���ƿ�!</p>
    </div>
  </header>
  <br><br><br>
  <div>
<% 
	// 3. ���� ��ȸ
	// ������ object�����̱� ������ ������ Ÿ������ ����Ϸ��� ��������ȭ ����
	MemberDTO dto = (MemberDTO)session.getAttribute("info");
		String id=dto.getId();
		String name=dto.getName();
%>
    <h class="user_imp"><%= id %>�� �α��� �ϼ̾��!</h>
    <h class="user_imp"><%= name%>��.</h>
    <hr>
  </div>
  <br><br><br>
  <body>
    <div class="body"><a href="���� ���� �Ǵ��� " class="p_text">Ĭ�����̸�</a></div>
    <div class="body"><a href="" class="p_text"></a></div>
    <div class="body"><a href="" class="p_text"></a></div>
    <div class="body"><a href="" class="p_text"></a></div>
    <div class="body"><a href="" class="p_text"></a></div>
    <div class="body"><a href="" class="p_text"></a></div>
    <div class="body"><a href="" class="p_text"></a></div>

<!-- �ڷΰ��� -->
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>