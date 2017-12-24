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
				<div class="login-page">
					<div class="login-header margin-bottom-30">
						<h2>Reset your password</h2>
					</div>
					<hr>
					<div>
					<div class="input-group-lg  margin-bottom-40">
						<label>Your Email Address</label> 
						<input class="form-control" type="email" readonly id="email" value="${passlink.email }" > 
					</div>
					<div class="input-group-lg  margin-bottom-40 has-feedback" id="pwdstatus">
						<label>Password <span class="color-red">*</span>
						</label> <input class="form-control" id="pwd" name="user_pwd" placeholder="length more than 8" type="password" oninput="pwdCheck();">
						<span class="glyphicon form-control-feedback" id="pwdfeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
					</div>
					<div class="input-group-lg  margin-bottom-40 has-feedback" id="repwdstatus">
						<label>Confirm Password <span class="color-red">*</span>
						</label> <input class="form-control" id="repwd" placeholder="re-input password"	type="password" oninput="repwdCheck();">
						<span class="glyphicon form-control-feedback" id="repwdfeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
					</div>
					<hr>
					<div class="input-group-lg margin-bottom-20">
						<button class="btn btn-primary btn-lg btn-block" onclick="resetPwd();">Submit</button>
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
var passcheck=0;
function pwdCheck(){
	var pwd = $("#pwd").val();
	if(pwd.length>7){
		$("#pwdstatus").addClass("has-success");
		$("#pwdstatus").removeClass("has-error");
		$("#pwdfeedback").addClass("glyphicon-ok");
		$("#pwdfeedback").removeClass("glyphicon-remove");
	}else if(pwd.length==0){
		$("#pwdstatus").removeClass("has-error");
		$("#pwdfeedback").removeClass("glyphicon-ok");
		$("#pwdfeedback").removeClass("glyphicon-remove");
	}else{
		$("#pwdstatus").removeClass("has-success");
		$("#pwdstatus").addClass("has-error");
		$("#pwdfeedback").removeClass("glyphicon-ok");
		$("#pwdfeedback").addClass("glyphicon-remove");
	}
}
function repwdCheck(){
	var pwd = $("#pwd").val();
	var repwd = $("#repwd").val();
	if(pwd.length>7&&pwd==repwd){
		$("#repwdstatus").addClass("has-success");
		$("#repwdstatus").removeClass("has-error");
		$("#repwdfeedback").addClass("glyphicon-ok");
		$("#repwdfeedback").removeClass("glyphicon-remove");
		swal({
			title: 'Success!',
			text: '입력하신 두 비밀번호가 같습니다',
			timer: 1500,
			type: 'success'
		});
		passcheck=1;
	}else if(repwd.length==0){
		$("#repwdstatus").removeClass("has-error");
		$("#repwdfeedback").removeClass("glyphicon-ok");
		$("#repwdfeedback").removeClass("glyphicon-remove");
		passcheck=0;
	}else{
		$("#repwdstatus").removeClass("has-success");
		$("#repwdstatus").addClass("has-error");		
		$("#repwdfeedback").removeClass("glyphicon-ok");
		$("#repwdfeedback").addClass("glyphicon-remove");
		passcheck=0;
	}
}
function resetPwd(){
	var email = $("#email").val();
	var pwd = $("#pwd").val();
	if(passcheck>0){
			$.ajax({
				url:'/everycvs/user/resetpwdpost.do',
				data:{"email":email,
					"pwd":pwd },
				type:"post",
				beforeSend:function(){
					swal({
						  title: '비밀번호 재설정 중',
						  allowOutsideClick: false,
						  onOpen: () => {swal.showLoading()}
						})
				},
				success:function(data){
					if(data==2){
						swal({
							title: 'Success!',
							text: '비밀번호 재설정을 완료했습니다.',
							timer: 1500,
							type: 'success'
						});
						setTimeout(function(){
							swal({
								  title: '현재 화면 기능 만료',
								  text: '3초 후 창이 닫힙니다',
								  timer: 3000,
								  allowOutsideClick: false,
								  onOpen: () => {swal.showLoading()}
								});
						}, 1500);
						setTimeout("windowClose()",4500);
					}else{
						swal({
							title: 'Error!',
							text: '비밀번호 재설정을 실패했습니다.',
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
				title: '비밀번호 불일치',
				text: '입력하신 두 비밀번호가 서로 다릅니다\n다시 입력해주세요',
				timer: 1500,
				type: 'error'
			});
		}
}

function windowClose(){
	  window.opener='Self';
      window.open('','_parent','');
      window.close();
}
</script>
<c:if test="${result eq false}">
<script type="text/javascript">
swal({
	title: 'Warning',
	html: '비밀번호 재설정을 이미 진행하셨거나 <br> 재설정 만료시간이 지났습니다',
	allowOutsideClick: false,
	timer: 1500,
	type: 'warning'
});
setTimeout(function(){
	swal({
		  title: '현재 화면 기능 만료',
		  text: '3초 후 창이 닫힙니다',
		  timer: 3000,
		  allowOutsideClick: false,
		  onOpen: () => {swal.showLoading()}
		});
}, 1500);
setTimeout("windowClose()",4500);
</script>
</c:if>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->