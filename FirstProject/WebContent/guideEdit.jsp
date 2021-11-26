
<%@page import="Model.DAO"%>

<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
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
	height: 600px;
	opacity: .8;
	color: rgba(18, 18, 18, 1);
	text-align: center;
	font-size: 30px;
}

#div_no0 {
	width: 100%;
	height: 20%;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
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

#div_no1 {
	width: 100%;
	height: 20%;
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

#div_no2 {
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

#div_no3 {
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

#div_no4 {
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

#div_no5 {
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

.resizer {
	position: relative;
	width: 100%;
	height: 3px;
	border-radius: 1px;
	background-color: black;
	z-index: 2;
}

.resizer.nw1 {
	top: -1px;
	left: -1px;
	cursor: n-resize;
}

.resizer.nw2 {
	top: -1px;
	left: -1px;
	cursor: n-resize;
}

.resizer.nw3 {
	top: -1px;
	left: -1px;
	cursor: n-resize;
}

.resizer.nw4 {
	top: -1px;
	left: -1px;
	cursor: n-resize;
}

.resizer.nw5 {
	top: -1px;
	left: -1px;
	cursor: n-resize;
}

<!-- head -->
 /* 밑줄 제거 */
    a {
      text-decoration-line: none;
    }
header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: black;
}

.head_text {
	color: white;
	text-align: center;
	font-size: 25px;
	padding-left: 50px;
	font-weight: 800;
	padding-top: 35px;
}

.back_btn {
	width: 20px;
	height: 20px;
	background-color: black;
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

#sibal_btn {
	float: right;
	display: block;
	width: 20px;
	color: white;
	padding:10px;
	padding-top:40px;
	
}

button {
	background-color: black;
	padding: 0px;
	border: 0px;
	float: left;
	display: block;
	width: 30px;
}

</style>

<body>
	<header>
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<input type="image" src="./img_ex/like.png" onclick="plz()" id="sibal_btn">
			
			<p class="head_text">레시피</p>
		</div>

	</header>

	<%
ArrayList<ArrayList> recipe_ratio=new ArrayList<>();
recipe_ratio=(ArrayList<ArrayList>)session.getAttribute("recipe_ratio");/* 세션에 있던 ArrayList 사용할 수 있게 변수에 저장 */
ArrayList<String> names = new ArrayList<>();
ArrayList<Integer> ratios=new ArrayList<>();
%>
	<div id="layout">
		<%		
		names = recipe_ratio.get(0);
		/*RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 첫번째 ArrayList(재료 명) 가져오기  */
		int seq = (int)session.getAttribute("seq");
		ratios=recipe_ratio.get(1);
		System.out.println("ratios 사이즈"+ratios.size());%>
		<!-- RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 두 번째 ArrayList(재료 비율) 가져오기 -->

		<%for(int i=0;i<ratios.size();i++){			
		%><div id="div_no<%=i%>">
			<div class="resizer nw<%=i%>"></div>
			<%=names.get(i)%>
		</div>
		<%System.out.println("div"+i+"만드는중");
			}%><!-- 재료 갯수만큼 div 만드는 for문, 각각 id="div_no0"~"div_no9" -->

	</div>
	<script >
		 function goBack() {
		      window.history.back();
		    }
			/* 각각의 div 높이를 받아온 비율에 맞춰 조절 */
			<%for(int i=0;i<ratios.size();i++){%>
			var h=<%=ratios.get(i)%>;
				console.log(h);
					document.getElementById("div_no"+<%=i%>).style.height=""+h+"%";
					<%System.out.println("div"+i+"사이즈 조절");
					}%>
	//스크립ㅌ느 안에서 리다이렉트 
</script>

<script src="main.js" type="text/javascript">

function mouseup(){
	var t = getElementById('sibal_btn')
	t.addEventListener('mouseup', mouseup);
	//window.removeEventListener('mousemove', mousemove);
	//window.removeEventListener('mouseup', mouseup);
let edited_ratio="";
console.log("생겼음");
let edited_name="";
$("div").on("click",function plz() {
	console.log(<%=ratios.size()%>);
    for(let i=0;i<<%=ratios.size()%>;i++){
    	if(i==<%=ratios.size()%>-1){
	      	edited_ratio=edited_ratio+e.clientHeight;
    	}else{
    		edited_ratio=edited_ratio+e.clientHeight+"_";
    		console.log("e.clientHeight>>"+e.clientHeight);
   
    	}
    	console.log("비율 >> "+edited_ratio);
    }
    <%String edited_name="";
    for(int i=0;i<names.size();i++){
    	if(i==names.size()-1){
   			edited_name=edited_name+names.get(i).replace(" ","_");
    	}else{
    		edited_name=edited_name+names.get(i).replace(" ","_")+"+";
    	}
    }
    System.out.println("스크립트릿 안의 name값>>"+edited_name);
    
    %>
	var URL = "http://localhost:8081/FirstProject/saveMyRecipe?edited_name="+edited_name +"&edited_ratio="+edited_ratio;
	var rtnVal = window.showModalDialog(URL, "", "dialogWidth:0; dialogHeight:0; help:no; status:no;");
    edited_name=<%=edited_name%>;
    console.log(URL);
    console.log("ed_ratio="+edited_ratio);
  })
};


function plz(){

		$.ajax({
	    	type : "get",        
			url : "http://localhost:8081/FirstProject/saveMyRecipe?edited_name=<%=edited_name%>&edited_ratio="+edited_ratio,   
			success:function(data){
	    		alert("Success");
	        let getData=$("div").html(data);
	    	},
	    	error:function(){
	        alert("Fail");
	    }
	});
};

</script>


</body>
</html>