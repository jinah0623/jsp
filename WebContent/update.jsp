<%@page import="CONTENT.contentDTO"%>
<%@page import="CONTENT.contentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//세션 체크
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}	
	
	
	if(userID ==null){ //로그인 한 사람만 글 수정 가능
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 먼저 해주세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	int contentID = 0;
	//컨텐트 값 호출 후 변환
	if(request.getParameter("contentID") != null){
		contentID = Integer.parseInt(request.getParameter("contentID"));
	}
	
	//컨텐트 값이 없으면 없는 글 
	if (contentID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	
	contentDTO ct = new contentDAO().getContent(contentID);
	if(!userID.equals(ct.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정할 권한이 없습니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}		
	%>
	
	<form action="updateAction.jsp?contentID=<%=contentID%>" method="post">
	<table border =1>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="title" value="<%=ct.getTitle() %>" /></td>
		</tr>
		<tr>
			<td><textarea placeholder="글 내용" name="content" ><%=ct.getContent() %></textarea></td>
		</tr>
	</table>
	<input type="submit" value="수정" />	
	</form>
	
	
	
	
	
	
</body>
</html>