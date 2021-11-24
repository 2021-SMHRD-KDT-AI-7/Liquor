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
		ArrayList<ArrayList> load_recipe = new ArrayList<>();
		load_recipe = (ArrayList<ArrayList>)session.getAttribute("load_recipe");
		System.out.println("����"+load_recipe.size());
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
		
		/* 		returns.add(names); // Ĭ���� �̸�
			returns.add(seqs); // ������ ��ȣ
			returns.add(imgs); // �̹��� �����
			returns.add(ig_name); // Ĭ���� ����
			returns.add(amounts); // ���� �뷮
			returns.add(mixings); // �ͽ� ����
	
	*/ 
	
	System.out.print("������ : "+seqs.get(0));
	
%>
<<<<<<< HEAD
<input type="button" value="���ƿ�" id="like_btn" onclick="like()">
<span id="like_result"></span>
    <header>
        <!-- �޴�â -->
        <div class="container">
          <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>
          <a id="head_g" href="Ĭ���ϰ��̵�.html"><img class="mix_btn" src="./img_ex/Ĭ���Ϲͼ�-1.png.png" alt="�ͼ� �̹���"></a>
          <p class="head_text">������</p>
        </div>
        <br><br><br>
        <h1 id="cocktail_seq"><img src="<%= imgs.get(0) %>"></h1>
        
    </header>
    <br><br><br><br><br>
    <body>
        <img src="Ĭ���� img����\���� ��ũ.png" alt="��ٸ��극">
        <br>
        
        <!-- DB���� �ҷ��ͼ� ������ ���� �� �־�� �Ѵ� -->
         <table id="top_table">
             <th colspan="4">���</th>
             <th></th>
             
              <tr class="tr_text" >
                  <td class="td_text">&#9608; </td>
                  <td class="td_text2">45ml</td>
=======
	<input type="button" value="���ƿ�" id="like_btn" onclick="like()">
	<span id="like_result"></span>
	<header>
		<!-- �޴�â -->
		<div class="container">
			<button onclick="goBack()">
				<img class="back_btn" src="./img_ex/back.png" alt="">
			</button>
			<a id="head_g" href="Ĭ���ϰ��̵�.html"><img class="mix_btn"
				src="./img_ex/Ĭ���Ϲͼ�-1.png.png" alt="�ͼ� �̹���"></a>
			<p class="head_text">������</p>
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
	<img src="<%= imgs.get(0) %>" alt="��ٸ��극">
	<br>

	<!-- DB���� �ҷ��ͼ� ������ ���� �� �־�� �Ѵ� -->
	<table id="top_table">
		<th colspan="4">���</th>
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
			<th colspan="2">����� ��</th>
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
			<td>������ 2��</td>
			<td>���޴���1��</td>
			<td>��������</td>
		</tr>
	</table>
	</div>
</body>

<script>
    

    function like(){
    	
    	var seq = <%=seqs.get(0)%>
    	console.log(seq)
    	
        if($('#like_btn').val()=="���ƿ�"){
        	console.log("1")
            $.ajax({
                type : "post",
                data : {
                    // ���⼭ �����͸� �������ڴ�
                    "cocktail_seq" : <%=seqs.get(0)%>
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
                    "cocktail_seq" : <%=seqs.get(0)%> 
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
</script>
</body>
</html>