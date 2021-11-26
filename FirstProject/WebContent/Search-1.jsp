<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="JS\jquery-3.6.0.min.js"></script>
    <title>�˻�2</title>
    <!-- 180507 �˻�â ���� -->
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
            height: 35px;
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
            padding-top:30px;
            padding-left:40;
            border: 0px;
        }
    </style>
</head>

<body>
    <header>
        <button class="btn_back" onclick="goBack()"><img class="back_btn" src="img_ex\back.png" alt=""></button>
    </header>
    <section>
    <form method="post" action="SearchByNameCon">
        <span class='green_window'>
            <input id=text type="text" class='input_text' name="search" onkeydown="enterSearch()" /></span>
        	<input type="submit" class='sch_smit' value="�˻�" onclick="myFunction()" />
	</form>
    </section>
    <!-- JAVASCRIPT -->
 <!-- �ڷΰ��� -->
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>

</html>