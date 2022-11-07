<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../assets/js/jquery-3.6.1.min.js"></script>
</head>
<body>

	<a href="${contextPath}/free/insertPage.do">작성하러 가기</a>

	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<td>게시글번호</td>				
				<td>제목</td>				
				<td>작성자</td>				
				<td>조회수</td>				
				<td>삭제</td>				
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty frees}">
				<tr>
					<td>등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty frees}">
				<c:forEach items="${frees}" var="f">
					<tr>
						<td>${f.freeNo}</td>
						<td>${f.title}</td>
						<td>${f.writer}</td>
						<td>${f.hit}</td>
						<td><a href="#" onclick="fn_remove(${f.freeNo})">X</a></td>
					</tr>
						<script>
							function fn_remove(freeNo){
								location.href = '${contextPath}/free/remove.do?freeNo=' + freeNo;
							}
						</script>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
</body>
</html>