<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>레시피 정보 보여주기</title>
<style>
        * {margin: 0; padding: 0;}
            body {background-color: #C8C8C8;}
            #wrap {width: 1200px; margin: 0 auto;}
            header {width: 100%; height: 100px; background-color: rgba(14, 10, 11, 1);}
            article {width: 100%; height: 50px; background-color: #2c2c2c;}
            section {overflow: hidden; padding: 5%; width: 90%; background-color: #2c2c2c;}
            section > div {width: 100%; margin: 0%; height: 649px; background-color: #2c2c2c; float: left; margin-top: 20px;}
            footer {width: 100%; height: 18px; background-color: #2c2c2c;}
            #name {font-size: 40px;}
            div{
                position: relative;
            }

            /* 화면 너비 0 ~ 1000px */
            @media (max-width: 1020px){
                #wrap {width: 100%;}
                section > div {width: 95%; height: 660px;}  
                #name {font-size: 35px;}    
                footer {height: 30px;}        
            }
            /* 화면 너비 0 ~ 768px */
            @media (max-width: 768px){
                section > div {width: 93%; height: 673px;}
                #name {font-size: 30px;}  
                footer {height: 40px;}          
            }
            /* 화면 너비 0 ~ 480px */
            @media (max-width: 480px){
                section > div {width: 88%; }
            } 
            #name{
                color:white;
            }
            #a{
                margin-left: 10%;
                
            }
            #b{
                margin-left: 10%;
                
            }
            img{
			    width: 450px; height: 500px; display: block; margin: auto;
		    }
            #p{
                text-align: center;
                color: white;
                
            }

    </style>
</head>
<body>
    <div id="wrap">
		<header></header>
		
		<article id="name">
            <p id="a">준벅</p>
            <p id="b">(June Bug)</p>
        </article>
		
		<section>
			<div>
                <img src="img_ex/JuneBug.jpg">
                <p id="p">테스트</p>
            </div>
		</section>
		
		<footer></footer>
	</div>
</body>
</html>