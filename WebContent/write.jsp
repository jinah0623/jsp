<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="writeAction.jsp" method="post">
	<table border = 1>
		<tr>
			<td><input type="text" name = "title" placeholder="글 제목"></td>
		</tr>	
		<tr>
			<td><textarea name="content" placeholder="글 내용"></textarea></td>
		</tr>
	</table>
		<input type="submit" value="등록">
	</form>
</body>
</html>