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
<!-- === BEGIN CONTENT === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-9">
				<!-- Main Content -->
				<div class="headline">
					<h2>이벤트 등록</h2>
					<br>
					<h4>이벤트의 내용을 입력하세요</h4>
				</div>
				<br>
				<!-- Contact Form -->
				<form name="event" method="post" action="eventInsert.do">
					<label>이벤트 이름</label>
					<div class="row margin-bottom-20">
						<div class="col-md-6 col-md-offset-0">
							<input class="form-control" name="title" type="text" placeholder="이벤트명을 입력하세요">
						</div>
					</div>
					<label>이벤트 기간 <span class="color-red">*</span>
					</label>
					<div class="row margin-bottom-20">
						<div class="col-md-6 col-md-offset-0">
							<input class="form-text" type="Date" name="start_date" placeholder="시작일 입력">
							<input class="form-text" type="Date" name="end_date" placeholder="종료일 입력">
						</div>
					</div>
					<input type="hidden" name="writer" value="${sessionScope.admin.아직 여길 뭘써야할지 }">
					<label>이미지 첨부</label>
					<div class="row margin-bottom-20">
						<div class="col-md-6 col-md-offset-0">
							<input class="form-text" type="text" placeholder="파일을 선택하세요"><!-- 이건안넘어가고 --> 
							<input type="button" value="파일첨부">
						</div>
					</div>
					<label>상세내용</label>
					<div class="row margin-bottom-20">
						<div class="col-md-8 col-md-offset-0">
							<textarea rows="8" name="contents" class="form-control"
								placeholder="이벤트의 상세내용을 입력하세요"></textarea>
						</div>
					</div>
					<p>
						<button type="submit" class="btn btn-primary">Send
							Message</button>
						<button type="button" class="btn btn-primary" onclick="">Cancel</button>
					</p>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->