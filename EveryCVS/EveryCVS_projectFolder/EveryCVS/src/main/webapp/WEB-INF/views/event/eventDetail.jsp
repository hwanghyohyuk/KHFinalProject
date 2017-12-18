<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet"
	type="text/css">
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<div class="col-md-12">
		
				<h2>${et.event_no}번 상세보기</h2>
				<div class="row">
					<div class="col-md-6 animate fadeIn">
						<img src="/everycvs/resources/upload/${et.stored_file_name}" alt="이벤트 이미지가 없습니다." class="jun_img">
					</div>
					<div class="col-md-6 margin-bottom-10 animate fadeInRight">
						<form name="event" method="post" action="eventDetail.do">
							<div class="clearfix"></div>
							<label>이벤트 이름</label><br>
							<div class="row margin-bottom-20">
								<div class="col-md-10 col-md-offset-0">
									<input class="form-control" type="text"
										 value="${et.title}" readonly><br>

									<label>이벤트 기간</label><br> 
									<input class="modify" type="text" value="${et.start_date}" readonly> 
									<input class="modify" type="text" value="${et.end_date}" readonly>
									<br><br> 
																
									<label>상세내용</label><br>
									<textarea rows="5" class="form-control"
										style="margin-bottom: 4px; width: 100%;" readonly>${et.contents}
                                    </textarea>
									<p>
										<button type="submit" class="btn btn-primary" style=float:left;>참여하기</button>
										<button type="button" class="btn btn-primary" onclick='location.href="/everycvs/eventList.do"' style=float:right;>CANCEL</button>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
				<hr>
				<!-- === END CONTENT === -->
				<!-- === BEGIN FOOTER === -->
				<c:import url="../include/user/common/footer.jsp"></c:import>
				<!-- === END FOOTER === -->
				<!-- JS -->
				<c:import url="../include/user/common/end.jsp"></c:import>
				<!-- === END === -->