<%@page import="Model.Cock_SeqsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cock_SeqsDAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    <!-- 메뉴  -->
    <link rel="stylesheet" href="_CSS\Menubar.css" type="text/css">
    <!-- /* 슬라이스 js/css*/ -->
    <script src="JS\jquery.min_1.12.4.js"></script>
    <script src="JS\modernizr-custom.js"></script>
    <script src="JS\slick.min.js"></script>
    <link rel="stylesheet" href="_CSS\slick.css">
    <style>
        
    /* 밑줄 없애기 */
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

        /* 글씨 */
        .head_text {
            /* 헤드 text*/
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

        /* 검색 */

       

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
        /* 검색, 쉐이커 */
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
        <!-- 메뉴창 -->
        <div class="container">
            <a href="Menu.jsp" class="slide-open" id="slide-open">
                <span class="burgur" id="burgur">
                    <span class="top-line"></span>
                    <span class="bot-line"></span>
            </a>
            <!-- 검색, 쉐이커  -->
            <a id="btn_mix" href="test_guide.html"><img class="mix_btn" src="./img_ex/칵테일믹서-1.png.png" alt="믹서 이미지"></a>
            <a href="Search-1.jsp"><img class="seach" src="./img_ex/돋보기.png" alt="돋보기 이미지"></a>
            </span>
            <p class="head_text">방구석 칵테일</p>
    </header>
    <!-- 검색창 -->
    

    <body>
        
        <div class="body_2">
            <!-- 이미지 슬라이드 -->
            <div class="slider">
                <div><h1>여름에 어울리는</h1><a href="http://localhost:8081/FirstProject/cock_Reco.jsp?Reco_opinion=여름"><img src="./imgs/진토닉.png" alt="이미지1"></a></div>
                <div><h1>여자들이 좋아하는</h1><a href="http://localhost:8081/FirstProject/cock_Reco.jsp?Reco_opinion=여자"><img src="./imgs/모히또.png" alt="이미지2"></a></div>
                <div><h1>할로윈에 어울리는</h1><a href="http://localhost:8081/FirstProject/cock_Reco.jsp?Reco_opinion=할로윈"><img src="./imgs/준벅.png" alt="이미지3"></a></div>
                <div><h1>파티에 어울리는</h1><a href="http://localhost:8081/FirstProject/cock_Reco.jsp?Reco_opinion=파티"><img src="./imgs/파나콜라다.png" alt="이미지4"></a></div>
            </div>
            <!-- //이미지 슬라이드 -->
<% MemberDTO dto = (MemberDTO)session.getAttribute("info");
		String id=dto.getId();
		System.out.println("main_id>>>"+id);
		// 시퀀스와 이미지만  가져온다
		Cock_SeqsDAO dao = new Cock_SeqsDAO();
		ArrayList<Cock_SeqsDTO> dto_list = dao.CockSeqs();
		System.out.println("main_seq>>>"+dto_list.get(0).getCocktail_seq());
		
%>
            <div class="body_bd">
                <a href="cock_Reco.jsp"><p id="body_text">칵테일 추천</p></a>
            </div>
        </div>
        
        <div class="body_3">
            <div class="slider">
            <% for(int i=0; i<dto_list.size();i++){ %>
            <div><a href="http://localhost:8081/FirstProject/LoadRecipeServiceCon?seq=<%=dto_list.get(i).getCocktail_seq()%>"><img src="<%=dto_list.get(i).getCocktail_img() %>" alt="이미지"></a></div>
            
            <% }%>
            	
            </div>
            <div class="body_bd">   
                <a href="RecipePage.jsp"><p id="body_text">칵테일 레시피</p></a>
            </div>
        </div>
        
        <div class="body_1">
            <!-- 이미지 슬라이드 -->
            <div class="slider">
                <div><img src="칵테일 img모음\코스모폴리탄.png" alt="이미지1"></div>
                <div><img src="칵테일 img모음\투명하이볼.png" alt="이미지2"></div>
                <div><img src="칵테일 img모음\하이볼.png" alt="이미지3"></div>
                <div><img src="칵테일 img모음\투명올드패션글라스.png" alt="이미지4"></div>
                <div><img src="칵테일 img모음\블루 하와이.png" alt="이미지5"></div>
                <div><img src="칵테일 img모음\피취크러쉬.png" alt="이미지6"></div>
            </div>
            <!-- //이미지 슬라이드 -->
            <div class="body_bd">
                <a href="myRecipe.jsp"><p id="body_text">나만의 레시피</p></a>
            </div>
        </div>
        
        <div class="body_4"></div>
    </body>


    <script>
        //이미지 슬라이더
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