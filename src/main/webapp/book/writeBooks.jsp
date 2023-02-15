<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
<h1> 방명록 작성</h1>
<p>${cPath}</p>
	<div>
	<form name="frmGuest" method="post"
			action="${cPath}/guest/insertGuest.do" >
	
		<h1>Guestbook</h1>
			
			<div class="mb-3">
				<input type="text" class="form-control" 
				name="guest_name" id="guest_name" placeholder="name">
				<input type="password" class="form-control"
				name="guest_pw" id="guest_pw" placeholder="password">
			</div>
			
			<div class="mb-3">
				 <textarea class="form-control" aria-label="With textarea" placeholder="여러분의 소중한 방명록을 작성해주세요"
				 name="guest_content" id="guest_content"></textarea>
	  		</div>
	  		
			<div class="mb-3 form-check">
	  			<input type=submit class="btn btn-primary" value="Send" />
			</div>
	</form>

</body>
</html>