<%@page import="java.util.ArrayList"%>
<%@page import="Model.JH_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="JS\jquery-3.6.0.min.js"></script>
    <title>검색2</title>
    <!-- 180507 검색창 구현 -->
    <!-- CSS -->
    <style>
        body {
            background-color: rgba(18, 18, 18, 1);
        }

        header {
            height: 100px;
            background-color: rgba(18, 18, 18, 1);
        }

        section {
            position: relative;
            width: 100%;
            height: 10vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(18, 18, 18, 1);
        }

        .green_window {
            display: inline-block;
            width: 366px;
            height: px;
            border: 3px solid #200400;
            background: white;
            border-radius: 10px;
        }

        .input_text {
            width: 348px;
            height: 21px;
            margin: 6px 0 0 9px;
            border: 0;
            line-height: 21px;
            font-weight: bold;
            font-size: 16px;
            outline: none;
        }

        .sch_smit {
            width: 54px;
            height: 40px;
            margin: 0;
            border: 0;
            vertical-align: top;
            background: #200400;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
        }

        .sch_smit:hover {
            background: #56C82C;
        }

        .back_btn {
            width: 20px;
            height: 20px;
            background-color: rgba(18, 18, 18, 1);

        }

        .btn_back {
            background-color: rgba(18, 18, 18, 1);
            padding: 60px;
            border: 0px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;

        }
    </style>
</head>
<body>
<header>
        <button class="btn_back" onclick="goBack()"><img class="back_btn" src="img_ex\back.png" alt=""></button>
    </header>

    <!-- JAVASCRIPT -->
    <form action="SearchByNameCon">
    	<input type="text" name="cocktail_name">
    	<input type="submit">
    
    </form>

</body>
</html>