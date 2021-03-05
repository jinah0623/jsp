<%@page import="java.io.PrintWriter"%>
<%@page import="CONTENT.contentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="content" class = "CONTENT.contentDTO" scope="page"/>
<jsp:setProperty property="title" name="content"/>
<jsp:setProperty property="content" name="content"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션체크
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		//로그인 한 사람만 글 쓰기 가능
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 먼저 해주세요.')");
			script.println("location.href='login.jsp;");
			script.println("</script>");
		}else{
			//정상입력
			contentDAO cd = new contentDAO();
			int result = cd.writeContent(userID, content.getTitle(), content.getContent());
			
			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 등록되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>