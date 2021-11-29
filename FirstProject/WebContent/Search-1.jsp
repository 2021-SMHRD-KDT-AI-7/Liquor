<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="JS\jquery-3.6.0.min.js"></script>
<title>검색2</title>
<!-- 180507 검색창 구현 -->
<!-- CSS -->
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

body {
	background-color: rgba(18, 18, 18, 1);
}

header {
	height: 100px;
	background-color: rgba(18, 18, 18, 1);
}

section {
	position: relative;
	width: 100%;
	height: 10vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgba(18, 18, 18, 1);
}

.green_window {
	display: inline-block;
	width: 366px;
	height: px;
	border: 3px solid #200400;
	background: white;
	border-radius: 10px;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 35px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: #200400;
	color: white;
	font-weight: bold;
	border-radius: 10px;
	cursor: pointer;
}

.sch_smit:hover {
	background: #56C82C;
}

.back_btn {
	width: 20px;
	height: 20px;
	background-color: rgba(18, 18, 18, 1);
}

.btn_back {
	background-color: rgba(18, 18, 18, 1);
	padding-top: 30px;
	padding-left: 40;
	border: 0px;
}

/* 헤드 text */
.head_text {
	color: white;
	font-size: 25px;
	padding: 30px;
	text-align: center;
	font-family: 'CookieRunOTF-Bold';
	padding-right:60px;
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

/* 여기 까지 헤드 부분 */
</style>
</head>

<body>
	<header>
			<button type="button" class="btn_back" onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
		</header>
			<p class="head_text">앱텐더에게 무엇이든 물어보세요!</p>
	</header>
	<section>
		<form method="post" action="SearchByNameCon">
			<span class='green_window'> <input id=text type="text"
				class='input_text' name="search" onkeydown="enterSearch()" /></span> <input
				type="submit" class='sch_smit' value="검색" onclick="myFunction()" />
		</form>
	</section>
	<!-- JAVASCRIPT -->
	<!-- 뒤로가기 -->
	<script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>

</html>