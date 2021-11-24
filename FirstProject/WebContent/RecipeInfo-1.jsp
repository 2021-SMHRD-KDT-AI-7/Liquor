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

.td_text2 {
	text-align: right;
	font-size: 15px;
}

.tr_text {
	padding-left: px;
	font-size: 15px;
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
		ArrayList<ArrayList> load_recipe = new ArrayList<>();
		load_recipe = (ArrayList<ArrayList>)session.getAttribute("load_recipe");
		System.out.println("인포"+load_recipe.size());
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> amounts = new ArrayList<>();
		ArrayList<String> mixings = new ArrayList<>();
		ArrayList<String> imgs = new ArrayList<>();
		ArrayList<String> ig_name = new ArrayList<>();
		ArrayList<Integer> seqs = new ArrayList<>();
	
		
		if(load_recipe != null){
		 names = load_recipe.get(0);
		 seqs=load_recipe.get(1);
		 imgs=load_recipe.get(2);
		 ig_name=load_recipe.get(3);
		 amounts=load_recipe.get(4);
		 mixings=load_recipe.get(5);
		 
		 System.out.println("names : "+load_recipe.get(0).size());
		 System.out.println("seqs : "+load_recipe.get(1).size());
		 System.out.println("imgs : "+load_recipe.get(2).size());
		 System.out.println("ig_name : "+load_recipe.get(3).size());
		 System.out.println("amounts : "+load_recipe.get(4).size());
		 System.out.println("mixings : "+load_recipe.get(5).size());
		 
		
	}
		
		/* 		returns.add(names); // 칵테일 이름
			returns.add(seqs); // 시퀀스 번호
			returns.add(imgs); // 이미지 상대경로
			returns.add(ig_name); // 칵테일 성분
			returns.add(amounts); // 성분 용량
			returns.add(mixings); // 믹스 정보
	
	*/ 
	
	System.out.print("시퀀스 : "+seqs.get(0));
	
%>
<<<<<<< HEAD
<input type="button" value="좋아요" id="like_btn" onclick="like()">
<span id="like_result"></span>
    <header>
        <!-- 메뉴창 -->
        <div class="container">
          <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>
          <a id="head_g" href="칵테일가이드.html"><img class="mix_btn" src="./img_ex/칵테일믹서-1.png.png" alt="믹서 이미지"></a>
          <p class="head_text">레시피</p>
        </div>
        <br><br><br>
        <h1 id="cocktail_seq"><img src="<%= imgs.get(0) %>"></h1>
        
    </header>
    <br><br><br><br><br>
    <body>
        <img src="칵테일 img모음\깔루아 밀크.png" alt="쿠바리브레">
        <br>
        
        <!-- DB에서 불러와서 내용을 넣을 수 있어야 한다 -->
         <table id="top_table">
             <th colspan="4">재료</th>
             <th></th>
             
              <tr class="tr_text" >
                  <td class="td_text">&#9608; </td>
                  <td class="td_text2">45ml</td>
=======
	<input type="button" value="좋아요" id="like_btn" onclick="like()">
	<span id="like_result"></span>
	<header>
		<!-- 메뉴창 -->
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="칵테일가이드.html"><img class="mix_btn"
				src="./img_ex/칵테일믹서-1.png.png" alt="믹서 이미지"></a>
			<p class="head_text">레시피</p>
		</div>
		<br>
		<br>
		<br>
		
		<h1><%= names.get(0) %></h1>

	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
<body>
	<img src="<%= imgs.get(0) %>" alt="쿠바리브레">
	<br>

	<!-- DB에서 불러와서 내용을 넣을 수 있어야 한다 -->
	<table id="top_table">
		<th colspan="4">재료</th>
		<th></th> 
			
			
	<!--  		<%for(int k=0;k<ig_name.size();k++){%>
		<TR>
				<%for(int j=0;j<amounts.size();j++){%>
			<td class="td_text">&#9608; <%= ig_name.get(k) %></td>
			<td class="td_text2"><%= amounts.get(j) %></td>
			<%}%>
		</TR>
			<%} %>		
-->
			<tr class="tr_text" >
<<<<<<< HEAD
                  <td class="td_text">&#9608; 1</td>
                  <td class="td_text2">2</td>
=======
                  <td class="td_text">&#9608; <%= ig_name.get(0) %></td>
                  <td class="td_text2"><%= amounts.get(0) %></td>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/Liquor.git
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/Liquor.git
              </tr>
              <tr class="tr_text">
                  <td>&#9608; 1</td>
                  <td class="td_text2">2</td>
              </tr>
              <tr class="tr_text">
                <td>&#9608;1</td>
                <td class="td_text2">2</td>
            </tr>
		<tr>
			<th colspan="2">만드는 법</th>
			<th></th>
		</tr>
		<tr>
			<td align="center" colspan="2">1</td>
			<td></td>
		</tr>
	</table>
	<br>
	<br>
	<table id="low_table">
		<tr align="center">
			<td>각설탕 2개</td>
			<td>새콤달콤1나</td>
			<td>소주한잔</td>
		</tr>
	</table>
	</div>
</body>

<script>
    

    function like(){
    	
    	var seq = <%=seqs.get(0)%>
    	console.log(seq)
    	
        if($('#like_btn').val()=="좋아요"){
        	console.log("1")
            $.ajax({
                type : "post",
                data : {
                    // 여기서 데이터를 가져오겠다
                    "cocktail_seq" : <%=seqs.get(0)%>
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
                    "cocktail_seq" : <%=seqs.get(0)%> 
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
</script>
</body>
</html>