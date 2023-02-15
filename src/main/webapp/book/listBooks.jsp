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
<style>
.area_namePw input {
	width: 30%;
	display: inline-block;
}
.area_reply {

	background-color : #FAFAFA;
	
	border-top : 3px solid #EFEFEF;
	border-bottom : 3px solid #EFEFEF;
}
</style>

<title>방명록</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
<div class="wrap">
	<form name="frmGuest" method="post"
			action="${cPath}/guest/insertGuest.do" >
			<input type="hidden" name="guest_no" value="${guest.guest_no}" />
		<div class="form">
			<h3>Guestbook</h3>
			<div class="area_reply">
				<div class="area_namePw">
					<div class="mb-4">
						<input type="text" class="form-control" 
						name="guest_name" id="guest_name" placeholder="name">
						<input type="password" class="form-control"
						name="guest_pw" id="guest_pw" placeholder="password">
					</div>
				</div>
				<div class="area_text">	
					<div class="mb-4">
						 <textarea class="form-control" aria-label="With textarea" placeholder="여러분의 소중한 방명록을 작성해주세요"
						 name="guest_content" id="guest_content"></textarea>
			  		</div>
			  	</div>	
			  	<div class="area_btn">	
					<div class="mb-4 form-check">
			  			<input type=submit class="btn btn-primary" value="작성" />
					</div>
				</div>
			</div>
			</div>
</form>
<table class="table">
	<thead class="table-primary">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>내용</td>
			<td colspan="2">등록일자</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="guest" items="${guestList}">
			<tr>
				<td>${guest.guest_no}</td>
				<td>${guest.guest_name}</td>
				<td>${guest.guest_pw}</td>
				<td>${guest.guest_content}</td>
				<td>${guest.append_date}</td>
				<td>
				
					<!--<input type=button value="삭제1"  class="btn btn-danger"
						onClick="fn_remove_article('${cPath}/guest/delGuest.do', ${guest.guest_no})">
							
					  <input type="button" value="삭제1" class="btn btn-danger"
                    onclick="location.href = 'delGuest.do?guest_no=${guest.guest_no}'">
						-->
					<form>
					 <input type="hidden" id="id_no" value="${guest.guest_no}">
					 <button type="button" class="btn btn-danger"
					 	data-bs-toggle="modal" data-bs-target="viewModal">
						모달로 삭제</button>
					</form>
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>


</div>
<!-- -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
		crossorigin="anonymous"></script>
 

<script>

    function modal_view(guest_no) {

        $('#viewModal').on('show.bs.modal', function (event) {

            $(".modal-body #guest_no").val(guest_no);
        })

    }
</script>
	 <!--Modal -->
	<!-- <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">${guest.guest_no}번째 방명록 삭제</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
					    <input type="password" class="form-control" id="exampleInputPassword1">
  					</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					 <button type="button" class="btn btn-primary"
						onclick="fn_remove_article('${cPath}/guest/delGuest.do', ${guest.guest_no})">삭제</button>
				</div>
			</div>
		</div>
	</div>
	 -->
	 
	<!-- 수정 모달 창 -->

<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" 



aria-labelledby="exampleModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">



                <span aria-hidden="true">&times;</span></button>

                <h4 class="modal-title" id="exampleModalLabel">내 거래처</h4>

            </div>

            <div class="modal-body">

                <form name="customer" method="post" action="/My_customer/insert_customer">

                    <input type="hidden" class="form-control" id="seq" name="seq">

                    <div class="form-group">

                        <label for="recipient-name" class="control-label">회사이름</label>

                        <input type="text" class="form-control" id="customer_name" name="customer_name">

                    </div>

                    <div class="form-group">

                        <label for="recipient-name" class="control-label">담당자</label>

                        <input type="text" class="form-control" id="manager_name" name="manager_name">

                    </div>

                    <div class="form-group">

                        <label for="recipient-name" class="control-label">전화</label>

                        <input type="text" class="form-control" id="tel" name="tel">

                    </div>

                    <div class="form-group">

                        <label for="message-text" class="control-label">주소</label>

                        <textarea class="form-control" id="address" name="address" placeholder="주소를 입력해 주세요">



                        </textarea>

                    </div>

                </form>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

                <button type="button" id="insert_customer_btn" class="btn btn-primary">등록</button>

            </div>

        </div>

    </div>

</div>
	<!--  jQuery 연결 -->
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
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