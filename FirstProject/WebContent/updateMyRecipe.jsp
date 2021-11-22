<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
html {
	background-color: rgba(18, 18, 18, 1);
}

header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: rgba(18, 18, 18, 1);
}

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

button {
	background-color: black;
	padding: 0px;
	border: 0px;
	float: left;
	display: block;
	width: 30px;
}

#layout {
	position: absolute;
	top: 0;
	left: 0;
	margin-top: 100px;
	width: 100%;
	height: 100%;
	opacity: .8;
}

#drink1 {
	width: 100%;
	height: 20%;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background: hsla(211, 96%, 62%, 1);
	background: linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(211, 96%, 62%, 1) 0%,
		hsla(295, 94%, 76%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#439CFB",
		endColorstr="#F187FB", GradientType=1);
}

#drink2 {
	width: 100%;
	height: 20%;
	background: hsla(152, 100%, 50%, 1);
	background: linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(152, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#00FF87",
		endColorstr="#60EFFF", GradientType=1);
}

#drink3 {
	width: 100%;
	height: 20%;
	background: hsla(217, 100%, 50%, 1);
	background: linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(217, 100%, 50%, 1) 0%,
		hsla(186, 100%, 69%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#0061FF",
		endColorstr="#60EFFF", GradientType=1);
}

#drink4 {
	width: 100%;
	height: 20%;
	background: hsla(99, 75%, 75%, 1);
	background: linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(99, 75%, 75%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#B2EF91",
		endColorstr="#FA9372", GradientType=1);
}

#drink5 {
	width: 100%;
	height: 20%;
	background: hsla(340, 80%, 69%, 1);
	background: linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -moz-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	background: -webkit-linear-gradient(90deg, hsla(340, 80%, 69%, 1) 0%,
		hsla(15, 93%, 71%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#EF709B",
		endColorstr="#FA9372", GradientType=1);
}
</style>
</head>

<body>
	<header>
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="FP_img/KakaoTalk_20211122_122427805.png"
					alt="">
			</button>
			<p class="head_text">레시피</p>
		</div>
	</header>

	<div id="layout">
		<div id="drink1">drink1</div>
		<div id="drink2">drink2</div>
		<div id="drink3">drink3</div>
		<div id="drink4">drink4</div>
		<div id="drink5">drink5</div>
	</div>

	<script>
        const list = document.querySelector("#layout");

        let picked = null;
        let pickedIndex = null;
        list.addEventListener("dragstart", (e)=>{
            const obj = e.target;
            picked = obj
            pickedIndex = [...obj.parentNode.children].indexOf(obj) 
        })
        
        list.addEventListener("dragover", (e)=>{
            e.preventDefault()
        })
        
        list.addEventListener("drop", (e)=>{
            const obj = e.target;
            const index = [...obj.parentNode.children].indexOf(obj)

            index > pickedIndex ? obj.after(picked) : obj.before(picked)
        })
    </script>
</body>
</html>