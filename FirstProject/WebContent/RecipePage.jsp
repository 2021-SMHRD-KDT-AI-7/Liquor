<%@page import="Model.Cock_SeqsDTO"%>
<%@page import="Model.Cock_SeqsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>������ ȭ��</title>
  <script src="JS\jquery-3.6.0.min.js"></script>
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
      border: 0px;
      position: absolute;
    }

    .mix_btn {
      width: 30px;
      height: 30px;
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
      color: aliceblue;

    }

    .user_imp {
      color: aliceblue;
      text-align: center;
      display: block;
      width: auto;
    }
    hr{
      border:solid 1px aliceblue; width: 85%;
      
    }
  </style>
</head>

<body>
  <header>
    <!-- �޴�â -->
    <div class="container">
      <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>
      <a id="head_g" href="Ĭ���ϰ��̵�.html"><img class="mix_btn" src="./img_ex/Ĭ���Ϲͼ�.png.png" alt="�ͼ� �̹���"></a>
      <p class="head_text">������</p>
    </div>
  </header>
  <body>
  
  <%
		//�������� �̹�����  �����´�
		Cock_SeqsDAO dao = new Cock_SeqsDAO();
		ArrayList<Cock_SeqsDTO> dto_list = dao.CockSeqs();
		System.out.println("main_seq>>>"+dto_list.get(0).getCocktail_seq());
  %>
  
	<%for(int i=0; i<dto_list.size();i++){ %>    
   
     <div class="body"><a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>"><img src="<%=dto_list.get(i).getCocktail_img() %>" alt="�̹���"></a></div>
	<%} %>
  </body>








  <!-- �ڷΰ��� -->
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>

</html>