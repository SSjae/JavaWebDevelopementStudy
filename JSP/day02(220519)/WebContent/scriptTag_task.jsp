<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag_task</title>
<style>
	.dp {
		background: deeppink;
	}
	.ds {
		background: deepskyblue;
	}
	.wt {
		color: white;
	}
	.bt {
		color: blue;
	}
</style>
</head>
<body>
	<%--
		[1행 1열][1행 2열][1행 3열][1행 4열][1행 5열]
		[2행 1열][2행 2열][2행 3열][2행 4열]
		[3행 1열][3행 2열][3행 3열]
		[4행 1열][4행 2열]
		[5행 1열]
	 --%>
	<table border="1">
	<%
		for(int i=1; i<=5; i++) {
	%>
		<tr >
			<%
				for(int j=1; j<=6-i; j++) {
			%>
			 		<td><%=i %>행 <%=j %>열</td>
			<%
			 	}
			%>
	 	</tr>
	<%
	 	}
	%>
	</table>
	<br>
	<%--
		[1행 1열]
		[2행 1열][2행 2열]
		[3행 1열][3행 2열][3행 3열]
		[4행 1열][4행 2열][4행 3열][4행 4열]
		[5행 1열][5행 2열][5행 3열][5행 4열][5행 5열]
		[6행 1열][6행 2열][6행 3열][6행 4열]
		[7행 1열][7행 2열][7행 3열]
		[8행 1열][8행 2열]
		[9행 1열]
	 --%>
	<table border="1">
	<%
		int cnt2 = 1;
		for(int i=1; i<=9; i++) {
	%>
		<tr>
			<%
				for(int j=1; j<=cnt2; j++) {
			%>
			 		<td><%=i %>행 <%=j %>열</td>
			<%
			 	}
			%>
	 	</tr>
	<%
			if(i < 5) {
				cnt2++;			
			} else {
				cnt2--;
			}
	 	}
	%>
	</table>
	<br>
	 <!--
	 	위에있는 모양의 테이블에 짝수행은
	 	배경을 deeppink로 홀수행은 배경을 deepskyblue로
	 	짝수열은 글자색을 white 홀수열은 글자색을 blue
	 -->
	 <table border="1">
	<%
		cnt2 = 1;
		for(int i=1; i<=9; i++) {
	%>
		<tr class="<%=i % 2 == 0 ? "dp":"ds"%>">
			<%
				for(int j=1; j<=cnt2; j++) {
			%>
			 		<td class="<%=j % 2 == 0 ? "wt":"bt"%>"><%=i %>행 <%=j %>열</td>
			<%
			 	}
			%>
	 	</tr>
	<%
			if(i < 5) {
				cnt2++;			
			} else {
				cnt2--;
			}
	 	}
	%>
	</table>
</body>
</html>

