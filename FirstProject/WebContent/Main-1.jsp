<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>����ȭ��</title>
    <!-- �޴�  -->
    <link rel="stylesheet" href="_CSS\Menubar.css" type="text/css">
    <!-- /* �����̽� js/css*/ -->
    <script src="JS\jquery.min_1.12.4.js"></script>
    <script src="JS\modernizr-custom.js"></script>
    <script src="JS\slick.min.js"></script>
    <link rel="stylesheet" href="_CSS\slick.css">
    <style>
        
    /* ���� ���ֱ� */
        a {
  text-decoration-line: none;
/*   text-decoration-line: underline; */
/*   text-decoration-line: overline; */
/*   text-decoration-line: line-through; */
/*   text-decoration-line: underline line-through overline; */
}
        header {
            width: 100%;
            height: 100px;
            margin: 0 auto;
            background-color: rgba(18, 18, 18, 1);
        }

        /* �۾� */
        .head_text {
            /* ��� text*/
            color: white;
            text-align: center;
            font-size: 25px;
            font-style: italic;
            font-weight: 800;
            padding-top: 35px;
            padding-left: 70px;
        }

        /* body text */
        #body_text {
            color: white;
            text-align: center;
        }

        /* �˻� */

       

        body {
            background-color: rgba(18, 18, 18, 1);
                          
        }

        .body_1 {
            background-color: #2c2c2c6d;
            margin: 30px;
            padding: 50px;
            padding-top: 50px;
            padding-bottom: 5px;
            border-radius: 2ex;
        }

        .body_2 {
            background-color: #2c2c2c6d;
            margin: 30px;
            padding: 50px;
            padding-top: 50px;
            padding-bottom: 5px;
            border-radius: 2ex;
        }

        .body_3 {
            background-color: #2c2c2c;
            margin: 30px;
            padding: 70px;
            padding-top: 100px;
            padding-bottom: 5px;
            border-radius: 2ex;
        }

        .body_4 {
            background-color: rgba(54, 54, 54, 1);
            margin: 30px;
            padding: 90px;
            border-radius: 2ex;
        }

        .body_bd {
            background-color: rgb(54, 54, 54);
            border-radius: 2ex;
            position: static;
        }

        /* @media(max-width: 10px){
            .slider{width:100%}
            .img{width:100%}
        } */
        /* �˻�, ����Ŀ */
        .mix_btn{
            width: 30px;
            height: 30px;
            position: absolute;
        }
        #btn_mix {
            float:right; 
            display: block;
            width: 60px;
            margin-top: 40px;
        }
        .seach{
            width: 30px;
            float:right; 
            display: block;
           margin-top: 40px;
           padding-right: -5px;
        }
       
    </style>
</head>

<body class="wrap">

    <header>
        <!-- �޴�â -->
        <div class="container">
            <a href="Menu.jsp" class="slide-open" id="slide-open">
                <span class="burgur" id="burgur">
                    <span class="top-line"></span>
                    <span class="bot-line"></span>
            </a>
            <!-- �˻�, ����Ŀ  -->
            <a id="btn_mix" href="test_guide.html"><img class="mix_btn" src="./img_ex/Ĭ���Ϲͼ�-1.png.png" alt="�ͼ� �̹���"></a>
            <a href="Search.html"><img class="seach" src="./img_ex/������.png" alt="������ �̹���"></a>
            </span>
            <p class="head_text">�汸�� Ĭ����</p>
    </header>
    <!-- �˻�â -->
    

    <body>
        <div class="body_1">




            <!-- �̹��� �����̵� -->
            <div class="slider">
                <div><img src="Ĭ���� img����\�ڽ�������ź.png" alt="�̹���1"></div>
                <div><img src="Ĭ���� img����\�������̺�.png" alt="�̹���2"></div>
                <div><img src="Ĭ���� img����\���̺�.png" alt="�̹���3"></div>
                <div><img src="Ĭ���� img����\�����õ��мǱ۶�.png" alt="�̹���4"></div>
                <div><img src="Ĭ���� img����\���� �Ͽ���.png" alt="�̹���5"></div>
                <div><img src="Ĭ���� img����\����ũ����.png" alt="�̹���6"></div>
            </div>
            <!-- //�̹��� �����̵� -->
            <div class="body_bd">
                <a href="MyRecipe.html"><p id="body_text">������ ������</p></a>
            </div>
        </div>
        <div class="body_2">
            <!-- �̹��� �����̵� -->
            <div class="slider">
                <div><h1>������ ��︮��</h1><img src="./imgs/�����.png" alt="�̹���1"></div>
                <div><h1>���ڵ��� �����ϴ�</h1><img src="./imgs/������.png" alt="�̹���2"></div>
                <div><h1>�ҷ����� ��︮��</h1><img src="./imgs/�ع�.png" alt="�̹���3"></div>
                <div><h1>��Ƽ�� ��︮��</h1><img src="./imgs/�ĳ��ݶ��.png" alt="�̹���4"></div>
            </div>
            <!-- //�̹��� �����̵� -->
<% MemberDTO dto = (MemberDTO)session.getAttribute("info");
		String id=dto.getId();
		System.out.println("main_id>>>"+id);
%>
            <div class="body_bd">
                <a href="RecommendCocktails.html"><p id="body_text">Ĭ���� ��õ</p></a>
            </div>
        </div>
        <div class="body_3">
            <div class="body_bd">
            <div><h1>������ ��︮��</h1><a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?id=<%=id%>"><img src="./imgs/������.png" alt="������"></a></div>
                <p id="body_text">Ĭ���� ������</p>
            </div>
        </div>
        <div class="body_4"></div>
    </body>


    <script>
        //�̹��� �����̴�
        $(".slider").slick({
            dots: true,
            autoplay: true,
            autoplaySpeed: 3000,
            arrows: false,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: true,
                        dots: false
                    }
                }]
        });
    </script>


</body>

</html>