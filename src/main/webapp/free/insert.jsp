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
<script>
	
	$(document).ready(function(){
		
		$('#btn_list').click(function(event){
			location.href = '${contextPath}/free/list.do';
		})
	})
	
</script>
<body>
	
	<h1>자유게시판 게시글 작성화면</h1>
	
	<form method="POST" action="${contextPath}/free/add.do">
		<div>
			<input type="text" placeholder="작성자" name="writer">
		</div>
		<div>
			<input type="text" placeholder="제목" name="title">
		</div>
		<div>
			<textarea rows="2" cols="20" name="content"></textarea>
		</div>
		<input type="submit" value="작성완료">
		<input type="reset" value="다시작성">
		<input type="button" value="목록" id="btn_list">
	</form>
</body>
</html>