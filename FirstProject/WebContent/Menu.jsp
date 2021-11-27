<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�޴�â</title>
<script src="JS\jquery-3.6.0.min.js"></script>
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
	padding-bottom: 5px;
	border-radius: 2ex;
	color: aliceblue;
	padding-top: 10px;
	padding-left: 30px;
}

.p_text {
	width: 330px;
	font-size: 20px;
	color: white;
	font-family: 'CookieRun-Regular';
}

.user_imp {
	color: white;
	text-align: center;
	display: block;
	width: auto;
	font-family: 'CookieRunOTF-Bold';
}

hr {
	border: solid 1px aliceblue;
	width: 85%;
}
</style>
</head>

<body>
	<header>
		<!-- �޴�â -->
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>


			<p class="head_text">���󿡼� ���� ���� �޴�</p>
		</div>
	</header>
	<br>
	<br>
	<br>
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
	<br>
	<br>
	<br>
<body>
	<div class="body">
		<a href="" class="p_text">�������� ����</a>
	</div>
	<div class="body">
		<a href="BookmarkServiceCon" class="p_text">���ã��</a>
	</div>
	<div class="body">
		<a href="LoadMyRecipeListCon" class="p_text">MY ������</a>
	</div>
	<div class="body">
		<a href="" class="p_text">����</a>
	</div>
	<div class="body">
		<a href="LogoutCon" class="p_text">�α׾ƿ�</a>
	</div>
	<div class="body">
		<a href="" class="p_text">ȸ��Ż��</a>
	</div>
	<div class="body">
		<a href="" class="p_text">������ Ĭ���Ͽ� ���ؼ�</a>
	</div>

</body>








<!-- �ڷΰ��� -->
<script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>

</html>