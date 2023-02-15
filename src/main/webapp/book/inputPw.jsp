<%@page import="java.io.PrintWriter"%>
<%@page import="guestBook.dto.GuestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제를 위하여 비밀번호를 입력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>

<h1>비밀번호 입력</h1>

<form action="${cPath}/guest/delGuest.do" method="post">
<input type="hidden" name="guest_no" value="${guest.guest_no}">
 <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1">
  </div>
   <input type=button value="삭제"  class="btn btn-danger"
						onClick="fn_remove_article('${cPath}/guest/delGuest.do', ${guest.guest_no})">
  <input type="button" class="btn btn-info" value="목록으로"
  			onclick="history.back(-1)"></td>
</form>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
    	 
	 function fn_remove_article(url,guest_no){
		 var form = document.createElement("form");
		 
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
		 
	     var guest_noInput = document.createElement("input");
	     guest_noInput.setAttribute("type","hidden");
	     guest_noInput.setAttribute("name","guest_no");
	     guest_noInput.setAttribute("value", guest_no);
		 
	     form.appendChild(guest_noInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
 
 </script>
</body>
</html>