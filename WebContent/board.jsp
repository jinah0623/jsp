<%@page import="CONTENT.contentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTENT.contentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="logoutAction.jsp" >Log out </a>
<a href="write.jsp">글쓰기</a>
<!-- 검색 기능 -->
<form action="board.jsp">
	<select name="f">
		<option ${(param.f=="title")?"selected":""} value="title">제목</option>
		<option ${(param.f=="userID")?"selected":""}value="userID">작성자</option>
	</select>
	<label>검색어</label>
	<input type="text" name="q" value="${param.q}"/>
	<input type="submit" value="검색"/>
</form>

<%
//세션 체크
	String userID = null;
	if (session.getAttribute("userID") != null)
		userID = (String)session.getAttribute("userID");
%>


<table border=1>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>HIT</th>
	</tr>

	<%
		String param = request.getParameter("p");
		int paging = 0;
		if(param!= null && page.equals("")){
			paging = Integer.parseInt(param);
		}else{
			paging =1;
		}
		
		String query = request.getParameter("q"); //검색어 
		if(query==null){
			query ="";
		}
		String field = request.getParameter("f"); //title or 글쓴이 선택
		if(field==null){
			field = "TITLE";
		}

		System.out.println ("queruy :" + query );
		System.out.println ("field :" + field );
		contentDAO cd = new contentDAO(); //객체생성
		ArrayList<contentDTO>list = cd.getList(paging, field, query); //게시글 목록 조회
		int count = cd.getCount(field, query); // 게시글 수
		pageContext.setAttribute("list", list);  //contentDTO 가 들어가있는 배열 list
		pageContext.setAttribute("count", count); // count 는 조회 된 총 글의 수
		pageContext.setAttribute("field", field); //검색 조건 선택 (title, userid) 한 값
		pageContext.setAttribute("query", query); //검색어 값
		System.out.println("count :" + count);
	%>	
	
	<c:set var="page" value="${empty param.p?1:param.p}" > </c:set>
	<c:set var="startNum" value="${page-(page-1)%5}" ></c:set> 
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}" ></c:set>
	
	<c:forEach var="l" items="${list}" varStatus="st">
	<tr>
		<td>${l.contentID}</td>
		<td><a href="view.jsp?contentID=${l.contentID}&p=${(empty param.p)?1:param.p}&f=${field}&q=${query}">${l.title}</a></td>
		<td>${l.userID}</td>
		<td>${l.regdate}</td>
		<td>${l.hit}</td>
	</tr>
	</c:forEach>	
</table>


<!-- 현재페이지 -->
<div>
	<h3>현재 페이지</h3>
	<div><span>${(empty param.p)?1:param.p}</span>/${lastNum} pages</div>
</div>
<!-- 전으로 -->
 	<c:if test="${startNum > 1}">
 		<a href="?p=${startNum-1}&f=${field}&q=${query}">이전</a>
 	</c:if>
 	<c:if test="${startNum <=1 }">
 		<a href="#" onclick="alert('이전 페이지가 없습니다.');">이전</a>
 	</c:if>
<!-- 페이징 -->
<ul>
	<c:forEach var="i" begin ="0" end ="4">
		<c:if test="${param.p==(startNum+i)}"> <!-- 현재 활성화 된 페이지 색상 변경 -->
			<c:set var="style" value="font-weight:bold; color:red;" />
		</c:if>
		<c:if test="${param.p!=(startNum+i)}"> <!-- 활성화 되지 않은 페이지는 변경x -->
			<c:set var="style" value="" />
		</c:if>
		<c:if test="${(startNum+i) <= lastNum}"> <!-- 존재하는 글 갯수만큼만 페이지 표현 -->
			<li>
				<a id="num" style="${style}" href="?p=${startNum+i}&f=${field}&q=${query}">${startNum+i }</a>
			</li>
		</c:if>
	</c:forEach>
</ul>
<!-- 뒤로 -->
<c:if test="${startNum+5 <= lastNum }">
	<a href="?p=${startNum+5}&f=${field}&q=${query}">다음</a>
</c:if>
<c:if test="${startNum+5 > lastNum }">
	<a href="#" onclick="alert('다음 페이지가 없습니다.');">다음</a>
</c:if>


</body>
</html>