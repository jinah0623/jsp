<%@page import="java.io.PrintWriter"%>
<%@page import="USER.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="us" class="USER.userDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="us" />
<jsp:setProperty property="userPASS" name="us" />
<jsp:setProperty property="signID" name="us" />
<jsp:setProperty property="signName" name="us" />
<jsp:setProperty property="signPASS" name="us" />
<jsp:setProperty property="signAdd" name="us" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		//현재 세션상태 확인
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID !=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
	
		
		String cmd = request.getParameter("cmd");
		System.out.println("cmd :" + cmd);
		
		switch(cmd){
		case "Login" :
			userDAO ud = new userDAO();
			String uid = us.getUserID();
			String upass = us.getUserPASS();
			
			int result = ud.login(uid, upass);
			if(result ==1){ //로그인 성공
				PrintWriter script = response.getWriter();
				session.setAttribute("userID", us.getUserID());
				script.println("<script>");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}else if(result ==0){ //패스워드 틀림
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('패스워드를 확인하세요.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result ==-1){ //미가입 회원
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입되지 않은 회원입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result ==-2){ //db 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB 오류 입니다 조금만 기다려주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			break;
			
		case "Register" :
			//회원가입
			userDAO dao = new userDAO();
			int count = dao.join(us);
			if(count == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 가입된 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				session.setAttribute("userID", us.getUserID());
				script.println("<script>");
				script.println("alert('회원 가입 성공.')");
				script.println("location.href='welcome.html'");
				script.println("</script>");
			}
			
			break;
		}
		
		

	%>


</body>
</html>