<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <header>
        <!-- �޴�â -->
        <div class="container">
          <button onclick="goBack()"><img class="back_btn" src="./img_ex/back.png" alt=""></button>
          <a id="head_g" href="Ĭ���ϰ��̵�.html"><img class="mix_btn" src="./img_ex/Ĭ���Ϲͼ�-1.png.png" alt="�ͼ� �̹���"></a>
          <p class="head_text">������</p>
        </div>
        <br><br><br>
        <h1 id="coCk_name">��� ���극</h1>
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
                  <td class="td_text">&#9608; ����Ʈ��</td>
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
</body>
</html>