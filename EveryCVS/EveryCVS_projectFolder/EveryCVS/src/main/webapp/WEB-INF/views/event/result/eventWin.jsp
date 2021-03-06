<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet"
	type="text/css">
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-12">
				<!-- Blog Post -->
				<div class="blog-post padding-bottom-20">
					<!-- Blog Item Header -->
					<div class="blog-item-header">
						<!-- Title -->
						<h2>
							<a href="#">이벤트 당첨을 축하드립니다!</a>
						</h2>
						<div class="clearfix"></div>
						<!-- End Title -->
					</div>
					<!-- End Blog Item Header -->
					<div class="container">
						<div align="left" style="margin-left: 10%; margin-right: 10%">
							<div style="float: left;">
								<span class="label label-default">No.${ert.event_result_no}</span>
								<span class="label label-default">작성일 :${ert.write_date}</span>
							</div>
							<div style="float: right;">
								<font color="black">작성자 : </font><font color="black">${ert.user_name}</font>
							</div>
							<br> <br>
							<div class="well well">${ert.title}</div>
							<div class="panel-body">
								<table>
									<tr>
										<td>${ert.contents}</td>
									</tr>
								</table>
								<br><hr><br> 
								<div class="row" id="userlist"></div>
								<br><hr><br>
							</div>
							<div align="center">
							<c:if test="${sessionScope.user.user_no eq ert.writer }">
							 <a href="/everycvs/eventResultDelete.do?rno=${ert.event_result_no }" class="btn btn-primary">삭제</a>
								<a href="/everycvs/eventresultlist.do" class="btn btn-primary">목록</a>
								</c:if>
								<c:if test="${sessionScope.user.user_no ne ert.writer }">
								<a href="/everycvs/eventresultlist.do" class="btn btn-primary">목록</a>
								</c:if>
							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
$(function(){
	var eventNo=${ert.event_no};
	ajaxJoinUserList(eventNo);
});
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
				values +='<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">'+data[i].user_name+'</div>';
			}
			$("#userlist").html(values);
		},
		error:function(error){
			console.log(error);
		}
	});	
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->