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
      padding-left:30px ;
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
    body{
        background-color: rgba(18, 18, 18, 1);
    }
    h1{
        font-size: 50px;
        display: block;
        margin: auto;
        color: aliceblue;
        text-align: center;
    }
    img{
        display: block;
        margin: auto;
        text-align: center;
        width: 180px;
        padding-right: 15px;
    }
    h{
        display: block;
        margin: auto;
        color: aliceblue;
        text-align: center;
        font-size: 30px;
    }
    #top_table{
        width: 400px;
        color: aliceblue;
        align-content: center;
        margin: auto;
    }
    .td_text2{
        text-align:right;
        font-size: 15px;
    }
    .tr_text{
        padding-left:px;
        font-size: 15px;
    }
    th{
        font-size: 25px;
    }
    #low_table{
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
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> amounts = new ArrayList<>();
		ArrayList<String> mixings = new ArrayList<>();
		ArrayList<String> imgs = new ArrayList<>();
	
	if(load_recipe != null){
		 names = load_recipe.get(0);
		 amounts=load_recipe.get(4);
		 mixings=load_recipe.get(5);
		 imgs=load_recipe.get(2);
	}
	/* 			returns.add(names);
			returns.add(seqs);
			returns.add(imgs);
			returns.add(ig_names);
			returns.add(amounts);
			returns.add(mixings);
	
	*/ 
	
%>
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
                  <td class="td_text">&#9608; <%= %></td>
                  <td class="td_text2">45ml</td>
              </tr>
              <tr class="tr_text">
                  <td>&#9608; �����ֽ�</td>
                  <td class="td_text2">15ml</td>
              </tr>
              <tr class="tr_text">
                <td>&#9608; �ݶ�</td>
                <td class="td_text2">������</td>
            </tr>
            <tr >
                <th colspan="2">����� ��</th>
                <th></th>
            </tr>
            <tr>
                <td align="center" colspan="2">���� ������ ��� ���̺� �۶󽺿� �ξ��ش�.
                    ���� ���� �����̽��� ���Ͻ� ���ָ� �ϼ�
                </td>
                <td></td>
            </tr>
         </table>
         <br><br>
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
        if($('like_btn').val()=="���ƿ�"){
            $.ajax({
                type : "post",
                data : {
                    // ���⼭ �����͸� �������ڴ�
                    "cocktail_seq" : $('#cocktail_seq').html() 
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
                    "cocktail_seq" : $('#cocktail_seq').html() 
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