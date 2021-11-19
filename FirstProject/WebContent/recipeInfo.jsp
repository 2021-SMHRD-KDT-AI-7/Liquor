<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���� �����ֱ�</title>
    <style>
        * {margin: 0; padding: 0;}
            body {background-color: #C8C8C8;}
            #wrap {width: 1200px; margin: 0 auto; height: 100%;}
            header {width: 100%; height: 100px; background-color: #2c2c2c;}
            article {width: 100%; height: 50px; background-color: #2c2c2c;}
            section {overflow: hidden; padding: 5%; width: 90%; background-color: #2c2c2c;}
            section > div {width: 100%; margin: 0%; height: auto; background-color: #2c2c2c; float: left; margin-top: 20px;}
            footer {width: 100%; height: 40px; background-color: #2c2c2c;}
            #a {font-size: 50px;}
            #b {font-size: 28px;}
            div{
                position: relative;
            }

            /* ȭ�� �ʺ� 0 ~ 1000px */
            @media (max-width: 1020px){
                #wrap {width: 100%;}
                section > div {width: 95%; height: 660px;}  
                #a {font-size: 45px;}    
                #b {font-size: 25px;}
                footer {height: 40px;}        
            }
            /* ȭ�� �ʺ� 0 ~ 768px */
            @media (max-width: 768px){
                section > div {width: 93%; height: 680px;}
                #a {font-size: 40px;}    
                #b {font-size: 25px;}
                footer {height: 35px;}          
            }
            /* ȭ�� �ʺ� 0 ~ 480px */
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
			    width: 350px; height: 400px; display: block; margin: auto;
		    }
            #p1{
                text-align: center;
                color: yellow; 
                font-size: 24px;
                text-shadow: 0 0 3px white;
            }
            #p2{
                margin-top: 5px;
                color: white;
                font-size: 18px;
                text-shadow: 0 0 5px black;
                text-align: center;
            }
            #p3{
                text-align: center;
                color: white;
                font-size: 23px;
                text-shadow: 0 0 5px black;
            }

    </style>
</head>
<body>
    <div id="wrap">
		<header></header>
		
		<article id="name">
            <p id="a">�ع�</p>
            <p id="b">(June Bug)</p>
        </article>
		
		<section>
			<div>
                <img src="img_ex/JuneBug.jpg">
                <br>
                <br>
                <p id="p1">�ʰ��� ������</p>
                <p id="p2">
                   Step 1. ~~ <br>
                   Step 2. ~~ <br>
                   Step 3. ~~ 
                </p>
                <br>
                
                <p id="p3">
                    (TEST)����� ������ �ߵ�� ����, <br>
					�ݶ��� �������� ���� �� �ִ��Ͽ�, ��������! <br>
					�����ٶ� (�� 4�� �������� �ۼ�����)
                </p>
            </div>
		</section>
		
		<footer></footer>
	</div>
	
</body>
</html>