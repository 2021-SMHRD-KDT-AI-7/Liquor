<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% ArrayList<ArrayList> searchResult = new ArrayList<>();
	searchResult = (ArrayList<ArrayList>)session.getAttribute("search_results");
	System.out.println(searchResult.size());
	/* returns.add(seqs);
	returns.add(names);
	returns.add(colors); */
	ArrayList<Integer> seqs = new ArrayList<>();
	ArrayList<String> names = new ArrayList<>();
	ArrayList<String> colors = new ArrayList<>();
	ArrayList<String> imgs = new ArrayList<>();
	seqs=searchResult.get(0);
	names=searchResult.get(1);
	colors = searchResult.get(2);
	imgs=searchResult.get(3);%>
	<table>
	<tr>
	<td>이름</td>
	<td>이미지</td>
	<td></td>
	</tr>
	<%for(int i=0;i<seqs.size();i++){%>
		<tr><td><%=names.get(i) %></td><td><%=imgs.get(i) %></td></tr>
	<%}	%>
</table>
확인
</body>
</html>