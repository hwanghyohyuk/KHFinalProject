<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/custom.css" rel="stylesheet">
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
				<b>GS25</b>&nbsp;&nbsp;Event management
			</h2>
			<!-- aqua panel -->
			<div class="panel panel-blue">
				<div class="panel-heading">
					<h3 class="panel-title">Modify event</h3>
				</div>

				<div class="panel-body">
					<div class="col-sm-6" style="padding-left: 0px;">
						<div class="jun5">No. ${event.event_no}</div>
						<form class="form-inline" name="event" method="post" action="cvseventmodifywrite.do">
						<input type="hidden" name="writer" value="${sessionScope.user.user_no}">
						<input type="hidden" name="event_no" value="${event.event_no}">
							<div class="form-group" id="jun_input1">
								<label for="title" style="padding-right: 65px;">Event
									Title</label> <input type="text" class="form-control" id="title" name="title"
									style="width: 300px;" value="${event.title}">
							</div>
							<br>

							<div class="form-group" id="jun_input1">
								<label for="date1" style="padding-right: 70px;">Start
									Date</label> <input type="date" class="form-control" id="date1" name="start_date"
									style="width: 130px;" value="${event.start_date}">
							</div>
							<br>
							<div class="form-group" id="jun_input1">
								<label for="date2" style="padding-right: 77px;">End Date</label>
								<input type="date" class="form-control" id="date2" name="end_date"
									style="width: 130px;" value="${event.end_date}">
							</div>
							<br>
							<div class="form-group" id="jun_input1">
								<label for="limit"
									style="padding-right: 22px; padding-top: 6px; float: left;">Participation
									limit</label> <input type="number" class="form-control jun10" name="join_limit"
									id="limit" placeholder="참여제한횟수" style="width: 120px;" value="${event.join_limit}">
							</div>
							<br>
							<div class="form-group" id="jun_input1" style="margin-top: 10px;">
								<label for="imgurl"
									style="float: left; padding: 0px 59px 10px 0px;">Event
									image</label> <input type="file" id="imgurl" style="padding: 0px;">
							</div>
					</div>
					<div class="col-sm-6 jun9">
						<div class="form-group" id="jun_input1">
							<label for="contents" style="padding-right: 61px;">Contents</label>
							<textarea class="form-control" id="contents" name="contents"
								style="height: 142px; padding: 2px 4px;" value="">${event.contents}</textarea>
						</div>
						<br>
						<button type="submit" class="btn btn-danger btn-lg jun4 jun7"
							id="width100">SUBMIT</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- End aqua panel -->
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
	function check() {
		// input 이 비었으면 alert
	}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->