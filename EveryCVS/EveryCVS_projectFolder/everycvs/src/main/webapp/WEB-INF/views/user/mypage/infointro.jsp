<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-60 padding-vert-60 ">
			<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
				<div class="jumbotron">
				<h3><b>사용자 정보 확인</b></h3>
				<br>
				<br>
				<div class="row center-block">
					<p class="text-center">
					<c:if test="${sessionScope.user.stored_file_name eq '' }">
					<img src="/everycvs/resources/user/img/user.png"  style="background-color: white; width:120px;height:120px;" class="img-circle">
					</c:if>
					<c:if test="${sessionScope.user.stored_file_name ne '' }">
					<img src="/everycvs/resources/user/img/user.png"  style="background-color: white; width:120px;height:120px;" class="img-circle">
					</c:if>
					</p>
					<p class="text-center lead"><b>
					${sessionScope.user.user_name}
					</b></p>	
					<div class="input-group-lg margin-vert-20 has-feedback" id="pwdstatus">
						<label>Password</label>
						<input class="form-control" id="pwd"  placeholder="Password" type="password" oninput="pwdCheck();">
						<span class="glyphicon form-control-feedback" id="pwdfeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
					</div>	
					<div class="input-group-lg">
						<button class="btn btn-primary btn-lg btn-block" onclick="submit();">Submit</button>
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
var pwdcheck=0;
function pwdCheck(){
	var pwd = $("#pwd").val();
	if(pwd.length>7){
		$("#pwdstatus").addClass("has-success");
		$("#pwdstatus").removeClass("has-error");
		$("#pwdfeedback").addClass("glyphicon-ok");
		$("#pwdfeedback").removeClass("glyphicon-remove");
		pwdcheck=1;
	}else if(pwd.length==0){
		$("#pwdstatus").removeClass("has-error");
		$("#pwdfeedback").removeClass("glyphicon-ok");
		$("#pwdfeedback").removeClass("glyphicon-remove");
		pwdcheck=0;
	}else{
		$("#pwdstatus").removeClass("has-success");
		$("#pwdstatus").addClass("has-error");
		$("#pwdfeedback").removeClass("glyphicon-ok");
		$("#pwdfeedback").addClass("glyphicon-remove");
		pwdcheck=0;
	}
}
function submit(){
	var pwd = $("#pwd").val();
	if(pwdcheck>0){
		$.ajax({
			url:'/everycvs/user/infoin.do',
			data:{'pwd':pwd},
			type:'post',
			beforeSend:function(){
				swal({
					  title: '사용자 정보 확인 중...',
					  allowOutsideClick: false,
					  onOpen: () => {swal.showLoading()}
					});
			},
			success:function(data){
				if(data>0){
					swal({
						title: '사용자 정보가 확인되었습니다',
						timer: 1500,
						type: 'success'
					});
					setTimeout("next()",1500);
				}else{
					swal({
						title: '사용자 정보가 일치하지 않습니다',
						timer: 1500,
						type: 'error'
					});
				}				
			},
			error : function(request, status, error) {
				swal({
					title: '오류',
					text: error,
					timer: 1500,
					type: 'error'
				});
			}});
	}else{
		swal({
			title: '비밀번호를 입력하세요',
			timer: 1500,
			type: 'error'
		});
	}	
}
function next(){
	location.href="/everycvs/user/userinfo.do";
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->