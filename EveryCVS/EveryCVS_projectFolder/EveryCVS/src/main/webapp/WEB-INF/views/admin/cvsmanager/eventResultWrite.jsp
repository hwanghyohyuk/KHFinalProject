<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/responsive.css" rel="stylesheet">
<c:import url="../../include/admin/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<!-- 선택적 -->
<c:import url="../../include/admin/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Main content -->
	<div id="content">
		<div class="container background-white">
			<h2 class="margin-bottom-30">
				<b>${sessionScope.user.brand_name}</b>&nbsp;&nbsp;Event management
			</h2>
			<form action="/everycvs/cvsevenResultWrite.do" method="post">
			<div class="box box-solid box-primary">
				<div class="box-header">
					<h3 class="box-title">Add Event Result</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<!-- 왼쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="input-group-lg  margin-bottom-40"
									id="addressstatus">
									<label>Title</label> <input class="form-control"
										placeholder="Title" id="title" name="title" type="text">
								</div>
								<input type="hidden" name="writer" value="${sessionScope.user.user_no }">
								<div class="input-group-lg">
									<br>
									<label>Original Event</label>
									<select class="form-control" id="selectEvent" name="event_no">
									<c:forEach var="e" items="${elist}">
										<option value="${e.event_no }">${e.title }</option>
									</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<!-- 오른쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div>
									<label>Contents Area</label>
									<textarea class="form-control"
										style="resize: none; font-size: 18px; line-height: 1.33;"
										placeholder="text" rows="8" id="contents" name="contents"></textarea>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin-top-20">
              			<button type="submit" class="btn btn-danger btn-lg pull-right" >SUBMIT</button>
              			</div> 
					</div>
				</div>
			</div>
			</form>
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Join User Table</h3>
				</div>
				<div class="box-body">
					<div class="row" id="userlist">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- JS Custom Function -->
<script type="text/javascript">
$(function(){
	var eventNo=$("#selectEvent option:selected").val();
	ajaxJoinUserList(eventNo);
	init();
});
function init(){
	$( "#selectEvent" ).change(function() {
		var eventNo=$("#selectEvent option:selected").val();
		ajaxJoinUserList(eventNo);
	});
}
function ajaxJoinUserList(eventNo){
	$.ajax({
		url:'/everycvs/ajax/joinuserlist.do',
		data:{"eventNo":eventNo},
		type:"GET",
		beforeSend:function(){
			swal({
				  title: '참여 테이블 불러오는 중...',
				  allowOutsideClick: false,
				  timer:500,
				  onOpen: () => {swal.showLoading()}
				})
		},
		success:function(data){
			console.log(data);
			var values = '';
			for(var i in data){
				values +='<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">'+data[i].user_name+'</div>';
			}
			$("#userlist").html(values);
		},
		error:function(error){
			console.log(error);
		}
	});	
}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->