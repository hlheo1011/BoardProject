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
<script>
	
	$(document).ready(function(){
		
		$('#btn_list').click(function(event){
			location.href = '${contextPath}/free/list.do';
		})
	})
	
</script>
</head>
<body>

	<h1>자유게시판 게시글 상세보기화면</h1>
	
	<form method="POST" action="${contextPath}/free/modify.do">
		<div>
			<input type="hidden" name="freeNo" value="${free.freeNo}">
			게시글번호 ${free.freeNo}
		</div>
		<div>
			<input type="hidden" name="writer" value="${free.writer}">
			작성자 ${free.writer}
		</div>
		<div>
			<input type="hidden" name="ip" value="${free.ip}">
			작성IP ${free.ip}
		</div>
		<div>
			<input type="hidden" name="hit" value="${free.hit}">
			조회수 ${free.hit}
		</div>
		<div>
			<input type="text" value="${free.title}" name="title">
		</div>
		<div>
			<textarea rows="2" cols="20" name="content">${free.content}</textarea>
		</div>
		<input type="submit" value="수정">
		<input type="button" value="목록" id="btn_list">
	</form>
	
</body>
</html>