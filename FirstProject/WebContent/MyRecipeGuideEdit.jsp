	
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
	a{
		z-index:10;
	}
	
	<!--
	head --> /* 밑줄 제거 */ a {
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
		padding: 10px;
		padding-top: 40px;
	}
	
	button {
		background-color: black;
		padding: 0px;
		border: 0px;
		float: left;
		display: block;
		width: 30px;
	}
	#p0,#p1,#p2{
		visibility: hidden;
	}
	p{
		font-family: 'CookieRunOTF-Bold';
	}
	strong{
		font-family: 'CookieRunOTF-Bold';
	}
	</style>
	
	<body>
	<script>var edited_ratio="";</script>
		<header>
	

		
	
	
			<div class="container">
			
				<button onclick="goBack()">
					<img class="back_btn" src="./img_ex/back.png" alt="">
				</button>
				<a name="as" id="ida" class="like_btn" href="" name="edited_ratio">
					<input type="image" src="./img_ex/like.png"id="sibal_btn" >
				</a>
				<p class="head_text">레시피</p>
			</div>
		<br><br><br>
		</header>
		<br><br><br>
		<%
		RecipeDTO load_recipe = (RecipeDTO)session.getAttribute("load_recipe");
		String name = load_recipe.getCocktail_name();
		ArrayList<ArrayList> recipe_ratio = new ArrayList<>();
		recipe_ratio = (ArrayList<ArrayList>) session.getAttribute("recipe_ratio");/* 세션에 있던 ArrayList 사용할 수 있게 변수에 저장 */
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> ratios = new ArrayList<>();
		System.out.println(request.getParameter("edited_ratio"));
		%>
		
		<div id="layout">
		<br>
			<%
			names = recipe_ratio.get(0);
			/*RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 첫번째 ArrayList(재료 명) 가져오기  */
			int seq = (int) session.getAttribute("seq");
			ratios = recipe_ratio.get(1);
			System.out.println("ratios 사이즈" + ratios.size());
			%>
			<!-- RecipeGuideServiceCon 에서 보내준 recipe_ratio ArrayList에서 두 번째 ArrayList(재료 비율) 가져오기 -->
	
			<%
			for (int i = 0; i < ratios.size(); i++) {
			%><div id="div_no<%=i%>">
				<div class="resizer nw<%=i%>"></div>
				<strong><%=names.get(i)%></strong>
				<p id="p<%=i%>"></p>
			</div>
			<%
			System.out.println("div" + i + "만드는중");
			}
			%><!-- 재료 갯수만큼 div 만드는 for문, 각각 id="div_no0"~"div_no9" -->
	
		</div>
		<script>		
			 function goBack() {
			      window.history.back();
			    }
				/* 각각의 div 높이를 받아온 비율에 맞춰 조절 */
				<%for (int i = 0; i < ratios.size(); i++) {%>
				var h=<%=ratios.get(i)%>;
					console.log(h);
						document.getElementById("div_no"+<%=i%>).style.height=""+h+"%";
						<%System.out.println("div" + i + "사이즈 조절");
	}%>
	
	</script>
	
		<script>
		
		edited_ratio;
		const el0 = document.querySelector("#div_no0");
		<%for(int i=1;i<ratios.size();i++){%>
		var e<%=i%> = document.getElementById("div_no<%=i%>");
		const el<%=i%> = document.querySelector("#div_no<%=i%>");
		var isResizing<%=i%> = false
	
		el<%=i%>.addEventListener('mousedown', mousedown);
	
		const resizers<%=i%> = document.querySelectorAll(".resizer.nw<%=i%>");
		var currentResizer<%=i%>;
	
		for (var resizer of resizers<%=i%>) {
			resizer.addEventListener('mousedown', mousedown);
			console.log("<%=i%>");
			
			function mousedown(e) {
				currentResizer<%=i%> = e.target;
				isResizing = true;
				edited_ratio=e0.clientHeight+"+";
				if(e1!=null){
					edited_ratio=edited_ratio+e1.clientHeight+"+";
					console.log(edited_ratio);
					if(e2!=null){
						edited_ratio=edited_ratio+e2.clientHeight+"+";
						console.log(edited_ratio);
						if(e3!=null){
							edited_ratio=edited_ratio+e3.clientHeight+"+";
							console.log(edited_ratio);
							if(e4!=null){
								edited_ratio=edited_ratio+e4.clientHeight+"+";
								console.log(edited_ratio);
								if(e5!=null){
									edited_ratio=edited_ratio+e5.clientHeight+"+";
									console.log(edited_ratio);
								}
							}
						}
					}
				}			
				
				var prevY = e.clientY;	
				window.addEventListener('mousemove', mousemove);
				window.addEventListener('mouseup', mouseup);
	
				function mousemove(e) {
					const rect<%=i-1%> = el<%=i-1%>.getBoundingClientRect();
					const rect<%=i%> = el<%=i%>.getBoundingClientRect();
	
					if (currentResizer<%=i%>.classList.contains('nw<%=i%>')) {
						el<%=i-1%>.style.height = rect<%=i-1%>.height - (prevY - e.clientY) + "px";
						el<%=i%>.style.height = rect<%=i%>.height + (prevY - e.clientY) + "px";
						el<%=i%>.style.top = rect<%=i%>.top + (prevY - e.clientY) + "px";
					}	
					prevY = e.clientY;
				}
				function mouseup() {
					window.removeEventListener('mousemove', mousemove);
					window.removeEventListener('mouseup', mouseup);
					<%for(int k=0;k<ratios.size();k++){%>
					p<%=k%>.innerHTML = e<%=k%>.clientHeight;<%}%>
				    <%String edited_name = "";
				    for (int j = 0; j < names.size(); j++) {
				    	if (j == names.size() - 1) {
				    		edited_name = edited_name + names.get(j).replace(" ", "_");
				    	} else {
				    		edited_name = edited_name + names.get(j).replace(" ", "_") + "+";
				    	}
				    }
				    System.out.println("스크립트릿 안의 name값>>" + edited_name);%> 
					isResizing = false;					
					<%session.setAttribute("edited_name", edited_name);%>
					sessionStorage.setItem('edited_ratio', edited_ratio);
					console.log("세션에 던진 이름"+"<%=session.getAttribute("edited_name")%>");	
					console.log("세션에 던질 레이쇼값"+sessionStorage.getItem("edited_ratio"));					
					$("#ida").prop("href","saveMyRecipe?edited_ratio="+edited_ratio);				
				}
			}
		}
		<%}%>
	var edited_name="";
	var e0 = document.getElementById("div_no0");
	var e1 = document.getElementById("div_no1");
	var e2 = document.getElementById("div_no2");
	var e3 = document.getElementById("div_no3");
	var e4 = document.getElementById("div_no4");
	var e5 = document.getElementById("div_no5");
	</script>
	
	</body>
	</html>