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
<title>������</title>
<style>
header {
	width: 100%;
	height: 100px;
	margin: 0 auto;
	background-color: rgba(18, 18, 18, 1);
}
#like{
    float: right;
	display: block;
    margin-top: 35px;
    
}
#like_btn{
    width: 20px;
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

/* ���� ���� ��� �κ� */
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
		RecipeDTO load_recipe = (RecipeDTO)session.getAttribute("load_recipe");
		ArrayList<String> mixings = new ArrayList<>();
		ArrayList<Integer> amounts = new ArrayList<>();
		ArrayList<String> ignames = new ArrayList<>();
		int seq=0;
		String name="";
		String img="";
		
		if(load_recipe != null){
		 seq=load_recipe.getCocktail_seq();
		 name = load_recipe.getCocktail_name();
		 img=load_recipe.getImg();
		 ignames=load_recipe.getIngredients();
		 amounts=load_recipe.getAmounts();
		 mixings=load_recipe.getMixings();
		 session.setAttribute("cocktail_seq", seq); /* ���̵弭�������� ������ ���� */
		 
		 System.out.println("names : "+name);
		 System.out.println("seqs : "+seq);
		 System.out.println("imgs : "+img);
		 System.out.println("ig_name : "+ignames.size());
		 System.out.println("amounts : "+amounts.size());
		 System.out.println("mixings : "+mixings.size());
		 
		
	}
		
		/*  returns.add(names); // Ĭ���� �̸�
			returns.add(seqs); // ������ ��ȣ
			returns.add(imgs); // �̹��� �����
			returns.add(ig_name); // Ĭ���� ����
			returns.add(amounts); // ���� �뷮
			returns.add(mixings); // �ͽ� ����
	
	*/ 
	
	System.out.print("������ : "+seq);
	
%>

	<header>
		<!-- �޴�â -->
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="RecipeGuideServiceCon?cocktail_seq=<%=seq%>"><img class="mix_btn"
				src="./img_ex/shaker.png" alt="�ͼ� �̹���"></a>
	<div id="like">
	<!--  <input type="button" value="���ƿ�" id="like_btn" onclick="like()">  -->
	<input type="image" src="./img_ex/like.png" id="like_btn" onclick="like()">
	<span id="like_result"></span>
	</div>
			<p class="head_text">������</p>
		</div>
		<br>
		<br>
		<br>
		
		<h1><%=name%></h1>

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
	<img src="<%= img %>" alt="��ٸ��극">
	<br>

	<!-- DB���� �ҷ��ͼ� ������ ���� �� �־�� �Ѵ� -->
	<table id="top_table">
		<th colspan="4">���</th>
		<th></th> 
			
			
		<TR>
	 		<%for(int k=0;k<ignames.size();k++){%>
				
			<td class="td_text">&#9608; <%= ignames.get(k) %></td>
			<td class="td_text2"><%= amounts.get(k) %>  ml</td>
			
		</TR>
			<%} %>		

		<!-- 	<tr class="tr_text" >
				
                  <td class="td_text">&#9608; 1</td>
                  <td class="td_text2">2</td>
				</td>
				<tr>
                  <td class="td_text">&#9608; 3</td>
                  <td class="td_text2">4</td>
				</td>
              </tr>
              <tr class="tr_text">
                  <td>&#9608; 5</td>
                  <td class="td_text2">6</td>
              </tr>
             -->
		<tr>
			<th colspan="2">����� ��</th>
			<th></th>
		</tr>
		<tr>
			<td align="center" colspan="2"><%= mixings.get(0) %></td>
			<td></td>
		</tr>
	</table>
	<br>
	<br>
	<table id="low_table">
		<tr align="center">
			<td>������ 2��</td>
			<td>���޴���1��</td>
			<td>��������</td>
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
    	
        if($('#like_btn').val()=="���ƿ�"){
        	console.log("1")
            $.ajax({
                type : "post",
                data : {
                    // ���⼭ �����͸� �������ڴ�
                    "cocktail_seq" : <%=seq%>
                    // key��
                },
                url : "addBookmarkCon",
                // ���ƿ� ������ȯ
                dataType : "text",
                success : function(data){
                    $('#like_result').html(data);
                    $('#like_btn').val('���ƿ� ���')
                },
                error : function(){
                    alert("����");
                }
            })
        }else{
            // url : dislikeService
            // ���ƿ� ���� ���� ���� ��
            // ���ƿ� ���� ���(���� �������� 1���ҵ� ���� ������ ��)
            // ��ư�� �ٽ� ���ƿ� ��ư����
            $.ajax({
                type : "post",
                data : {
                    // ���⼭ �����͸� �������ڴ� ���ù� ��ȣ
                    "cocktail_seq" : <%=seq%> 
                    <!--"cocktail_seq" : $('#cocktail_seq').html() --> 
                },
                url : "addBookmarkCon",
                // ���ƿ� ������ȯ
                dataType : "text",
                success : function(data){
                    $('#like_result').html(data);
                    $('#like_btn').val('���ƿ�')
                },
                error : function(){
                    alert("����");
                }
            })
        }
    }
    
    <!-- �ڷΰ��� -->
    
      function goBack() {
        window.history.back();
      }
    
</script>
</body>
</html>