<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<script type="text/javascript">
	
	function deleteService(sno) {
		var answer = false;
		
		answer = confirm("해당 게시물을 삭제하시겠습니까?");
		if (answer){
			location.href ='/everycvs/page/deleteService.do?sno='+sno;
			alert("삭제되었습니다.");
			}
	}
	function modifyService(no) {
		location.href = '/everycvs/page/serviceModifyPage.do?no='+no;
		
	}
	</script>
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-9">
				<!-- Main Content -->
				<div class="headline">
					<h2>고객센터</h2>
				</div>
				<hr>
				<%-- <c:forEach items=" ${servicecenter }" var="sc">  --%>
				<label>작성자 <span class="color-red">*</span>
				</label>
				<div class="row margin-bottom-20">
					<div class="col-md-6 col-md-offset-0">
						<input class="form-control" type="text"
							value="${servicecenter.user_name}" readonly>
					</div>
				</div>
				<label>제목 <span class="color-red">*</span>
				</label>
				<div class="row margin-bottom-20">
					<div class="col-md-6 col-md-offset-0">
						<input class="form-control" type="text"
							value="${servicecenter.title }" readonly>
					</div>
				</div>
				<div>
					<label>내용</label>
					<div class="row margin-bottom-20">
						<div class="col-md-8 col-md-offset-0">
							<textarea rows="8" class="form-control" placeholder="내용을 입력해주세요"
								readonly>${servicecenter.contents }</textarea>
						</div>
					</div>
					<div align="center">
						<c:if
							test="${sessionScope.user.user_name eq servicecenter.user_name }">
							<button type="button" class="btn btn-primary"
								onclick="modifyService(${servicecenter.service_no});">수정</button>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp                                                                                                   
                                    <button type="button"
								class="btn btn-primary"
								onclick="deleteService(${servicecenter.service_no});">삭제</button>                                                                                               
                                     &nbsp&nbsp&nbsp&nbsp&nbsp
                                   </c:if>
						<button type="submit" class="btn btn-primary"
							onclick='location.href="/everycvs/page/selectServiceList.do"'>목록으로</button>

					</div>
				</div>
				<%-- </c:forEach>  --%>
				<hr>
				<!-- End Contact Form -->
				<!-- End Main Content -->
			</div>
			<!-- End Main Column -->

		</div>
		<!-- End Side Column -->
	</div>
</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->