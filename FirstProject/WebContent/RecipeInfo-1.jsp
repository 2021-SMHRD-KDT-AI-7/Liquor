<%@page import="Model.FeatureDTO"%>
<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="JS\jquery-3.6.0.min.js"></script>
<title>레시피</title>
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
.mid_text{
	font-family: 'CookieRunOTF-Bold';
}
#td_text {
	font-family: 'CookieRunOTF-Bold';
}

header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: rgba(18, 18, 18, 1);
}

#like {
	float: right;
	display: block;
	margin-top: 35px;
}

#like_btn {
	width: 20px;
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
	font-family: 'CookieRunOTF-Bold';
	font-weight: 100px;
	padding-top: 35px;
	padding-left: 120px
}

.back_btn {
	width: 20px;
	height: 20px;
	background-color: rgba(18, 18, 18, 1);
	padding: 0px;
	padding-top: 40px;
	padding-left: 50px;
	border: 0px;
	position: absolute;
}

.mix_btn {
	width: 30px;
	height: 30px;
	position: absolute;
	padding-left: 30px;
}

#head_g {
	float: right;
	display: block;
	width: 100px;
	margin-top: 35px;
}

button {
	background-color: rgba(18, 18, 18, 1);
	padding: 0px;
	border: 0px;
	float: left;
	display: block;
	width: 80px;
}

/* 여기 까지 헤드 부분 */
body {
	background-color: rgba(18, 18, 18, 1);
}

h1 {
	font-size: 50px;
	display: block;
	margin: auto;
	color: aliceblue;
	text-align: center;
}

img {
	display: block;
	margin: auto;
	text-align: center;
	width: 180px;
	padding-right: 15px;
}

h {
	display: block;
	margin: auto;
	color: aliceblue;
	text-align: center;
	font-size: 30px;
}

#top_table {
	width: 400px;
	color: aliceblue;
	align-content: center;
	margin: auto;
}
.td_text{
	font-family: 'CookieRun-Regular';
}
.td_text2 {
	text-align: right;
	font-size: 15px;
	font-family: 'CookieRun-Regular';
}

.tr_text {
	padding-left: px;
	font-size: 15px;
	font-family: 'CookieRun-Regular';
}

th {
	font-size: 25px;
}

#low_table {
	width: 400px;
	color: aliceblue;
	align-content: center;
	margin: auto;
}
</style>
</head>
<body>
	<%
		RecipeDTO load_recipe = (RecipeDTO) session.getAttribute("load_recipe");
	ArrayList<String> mixings = new ArrayList<>();
	ArrayList<Integer> amounts = new ArrayList<>();
	ArrayList<String> ignames = new ArrayList<>();
	int seq = 0;
	String name = "";
	String img = "";
	
	// 맛을 간단하게 비교 해서 알려주기
	FeatureDTO feature = (FeatureDTO)session.getAttribute("feature");
	int sweet=0;
	int sour=0;
	String sparkle="";
	String base="";
	String alcohol="";
	String flavor="";
	
	// 칵테일 레시피 정보 가져오는곳
	if (load_recipe != null) {
		seq = load_recipe.getCocktail_seq();
		name = load_recipe.getCocktail_name();
		img = load_recipe.getImg();
		ignames = load_recipe.getIngredients();
		amounts = load_recipe.getAmounts();
		mixings = load_recipe.getMixings();
		session.setAttribute("cocktail_seq", seq); /* 가이드서비스콘으로 보내줄 세션 */

		System.out.println("names : " + name);
		
		
	}
	if(feature!=null){
		sparkle=feature.getSparkle();
		sweet=feature.getSweet();
		sour=feature.getSour();
		base=feature.getBase();
		alcohol=feature.getAlcohol();
		flavor=feature.getFlavor();
	}

	/*  returns.add(names); // 칵테일 이름
		returns.add(seqs); // 시퀀스 번호
		returns.add(imgs); // 이미지 상대경로
		returns.add(ig_name); // 칵테일 성분
		returns.add(amounts); // 성분 용량
		returns.add(mixings); // 믹스 정보

	*/

	System.out.print("시퀀스 : " + seq);
	%>

	<header>
		<!-- 메뉴창 -->
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="RecipeGuideServiceCon?cocktail_seq=<%=seq%>"><img
				class="mix_btn" src="./img_ex/shaker.png" alt="믹서 이미지"></a>
			<div id="like">
				<!--  <input type="button" value="좋아요" id="like_btn" onclick="like()">  -->
				<input type="image" src="./img_ex/like.png" id="like_btn"
					onclick="like()"> <span id="like_result"></span>
			</div>
			<p class="head_text">레시피</p>
		</div>
		<br> <br> <br>

		<h1 id="td_text"><%=name%></h1>

	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<body>
	<img src="<%=img%>" alt="쿠바리브레">
	<br>

	<!-- DB에서 불러와서 내용을 넣을 수 있어야 한다 -->
	<table id="top_table">
		<th class="mid_text" colspan="4">재료</th>
		<th></th>


		<TR>
			<%
				for (int k = 0; k < ignames.size(); k++) {
			%>

			<td class="td_text">&#9608; <%=ignames.get(k)%></td>
			<td class="td_text2"><%=amounts.get(k)%> ml</td>

		</TR>
		<%
			}
		%>

		<tr>
			<th class="mid_text" colspan="2">만드는 법</th>
			<th></th>
		</tr>
		<tr>
			<td class="td_text" align="center" colspan="2"><%=mixings.get(0)%></td>
			<td></td>
		</tr>
	</table>
	<br>
	<br>
	<table id="low_table">
		<tr align="center">
			<td>각설탕 <%= feature.getSweet() %></td>
			<td>레몬  <%= feature.getSour() %></td>
			<td>도수 <%= feature.getAlcohol() %></td>
			<td>향 <%= feature.getFlavor() %></td>
			<td>탄산 <%if(feature.getSparkle().equals("y")){%>
						O				 
			<%}else{%> X</td><%} %>
		</tr>
		
	</table>
	
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>

<script>
    

    function like(){
    	
    	var seq = <%=seq%>
    	console.log(seq)
    	
        if($('#like_btn').val()=="좋아요"){
        	console.log("1")
            $.ajax({
                type : "post",
                data : {
                    // 여기서 데이터를 가져오겠다
                    "cocktail_seq" : <%=seq%>
                    // key값
                },
                url : "addBookmarkCon",
                // 좋아요 갯수반환
                dataType : "text",
                success : function(data){
                    $('#like_result').html(data);
                    $('#like_btn').val('좋아요 취소')
                },
                error : function(){
                    alert("실패");
                }
            })
        }else{
            // url : dislikeService
            // 좋아요 개수 응답 받은 후
            // 좋아요 개수 출력(원래 개수에서 1감소된 값이 보여야 함)
            // 버튼은 다시 좋아요 버튼으로
            $.ajax({
                type : "post",
                data : {
                    // 여기서 데이터를 가져오겠다 개시물 번호
                    "cocktail_seq" : <%=seq%> 
                    <!--"cocktail_seq" : $('#cocktail_seq').html() --> 
                },
                url : "addBookmarkCon",
                // 좋아요 갯수반환
                dataType : "text",
                success : function(data){
                    $('#like_result').html(data);
                    $('#like_btn').val('좋아요')
                },
                error : function(){
                    alert("실패");
                }
            })
        }
    }
    
    <!-- 뒤로가기 -->
    
      function goBack() {
        window.history.back();
      }
    
</script>
</body>
</html>