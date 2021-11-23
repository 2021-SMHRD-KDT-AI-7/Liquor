<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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

    <%
    ArrayList<ArrayList> searchResult = new ArrayList<>();
    searchResult = (ArrayList)session.getAttribute("search_results");
    System.out.println("결과창이 받아온 검색결과 크기"+searchResult.size());
    ArrayList<Integer> result_seq =new ArrayList<>();
    ArrayList<String> result_name =new ArrayList<>();
    ArrayList<String> result_color =new ArrayList<>();
    if(searchResult.size()!=0){
    result_seq =searchResult.get(0);
    result_name =searchResult.get(1);
    result_color =searchResult.get(2);
    System.out.println("검색결과 있음");
    System.out.println(result_seq.size()+"시퀀스 사이즈");
    System.out.println(result_name.size()+"name 사이즈");
    System.out.println(result_color.size()+"color 사이즈");
    %><table>
    <tr><td>칵테일 명</td>
    <td>칵테일 대충그림</td>
    </tr>
    
    <%for(int i=0;i<result_name.size();i++) {
    System.out.println("for문 들어옴");%>
    <tr>
    <td><%=result_name.get(i) %></td>
    <td><%=result_color.get(i)%></td>
    </tr>
    <%} %>
    </table>
	<%}else{%>
		검색결과 없음<%}%>
	
</body>
</html>