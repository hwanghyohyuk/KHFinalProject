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
			<div class="row margin-vert-30">
				<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
					<div class="login-page">
						<div class="login-header margin-bottom-30">
							<h2>Sign In to your account</h2>
						</div>
						<div class="input-group input-group-lg margin-bottom-20" id="emailstatus">
							<span class="input-group-addon"> <i class="fa fa-user"></i></span>
							<input placeholder="Email" id="email" name="email" class="form-control " type="email" oninput="checkEmail();">
						</div>
						<div class="input-group input-group-lg margin-bottom-20" id="pwdstatus">
							<span class="input-group-addon"> <i class="fa fa-lock"></i></span> 
							<input placeholder="Password" id="pwd" name = "pwd" class="form-control" type="password" oninput="checkPwd();">
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="checkbox"> <input type="checkbox" name="usecookie">Stay
									signed in
								</label>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary btn-lg pull-right" id="submit" type="button" onclick="signIn();">Sign In</button>
							</div>
						</div>
						<hr>
						<h4>Need Account ?</h4>
						<p>
							<a href="/everycvs/sign/signupintro.do">Click here</a>&nbsp;to create your account!
						</p>
						<br>
						<h4>Forget your Password ?</h4>
						<p>
							<a href="/everycvs/user/findemail.do">Click here</a>&nbsp;to reset your password.
						</p>
					</div>
				</div>
				<!-- End Sign In Box -->
			</div>
		</div>
	</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->

<c:if test="${sign eq false }">
<script type="text/javascript">
swal({
	title: 'INFORMATION',
	html: '로그인이 필요한 서비스입니다',
	timer: 1500,
	type: 'info'
});
</script>
</c:if>

<c:if test="${signup eq true}">
<script type="text/javascript">
swal({
	title: '회원가입을 축하합니다!',
	html: '이제 모두의 편의점을 마음껏 이용하실 수 있습니다',
	timer: 2000,
	type: 'info'
});
</script>
</c:if>

<script type="text/javascript">
var isGood = false, checkpwd=0;
function checkEmail(){
	var email = $("#email").val();
	if(email != ''){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email.match(regExp) != null) {
			isGood = true;
			$("#emailstatus").addClass("has-success");
			$("#emailstatus").removeClass("has-error");
		}else{
			isGood = false;
			$("#emailstatus").removeClass("has-success");
			$("#emailstatus").addClass("has-error");
		}
	}else{
		isGood = false;
		$("#emailstatus").removeClass("has-success");
		$("#emailstatus").removeClass("has-error");
	}
}
function checkPwd(){
	var pwd = $("#pwd").val();
	if(pwd.length>7){
		$("#pwdstatus").addClass("has-success");
		$("#pwdstatus").removeClass("has-error");
		checkpwd=1;
	}else if(pwd.length==0){
		$("#pwdstatus").removeClass("has-error");
		checkpwd=0;
	}else{
		$("#pwdstatus").removeClass("has-success");
		$("#pwdstatus").addClass("has-error");
		checkpwd=0;
	}
}
function signIn(){
	if(isGood){
		if(checkpwd>0){
			var email = $("#email").val();
			var pwd = $("#pwd").val();
			$.ajax({
				url:'/everycvs/user/signinpost.do',
				type:'post',
				data:{"email":email,
					"pwd":pwd},
				beforeSend:function(){
					swal({
						  title: 'SIGN IN...',
						  allowOutsideClick: false,
						  onOpen: () => {swal.showLoading()}
						})
				},
				success:function(data){
					if(data>0){
						swal({
							title: 'SIGN IN SUCCESS',
							timer: 1500,
							type: 'success'
						});
						setTimeout(function(){
							switch (data) {
							  case 1 : location.href="/everycvs/main/main.do"; break;
							  case 2 : location.href="/everycvs/main/storemain.do"; break;
							  case 3 : location.href="/everycvs/main/cvsmain.do"; break;
							  case 4 : location.href="/everycvs/main/sitemain.do"; break;
							}},1000);
					}else{
						swal({
							title: 'SIGN IN FAIL',
							text: 'check your email or password...',
							timer: 1500,
							type: 'error'
						});
						$("#pwd").focus();
					}					
				},
				error:function(request, status, error){
					swal({
						title: 'ERROR',
						text: error,
						timer: 1500,
						type: 'error'
					});
					$("#email").focus();
				}});			
		}else{
			swal({
				title: 'ERROR',
				text: 'check your password...',
				timer: 1500,
				type: 'error'
			});
			$("#pwd").focus();
		}
	}else{
		swal({
			title: 'ERROR',
			text: 'check your email address...',
			timer: 1500,
			type: 'error'
		});
		$("#pwd").focus();
	}
}
function init(){
	$('#email').on('keydown', function(e) {
		var keyCode = e.which;
		if (keyCode === 13) { // Enter Key
			signIn();
		}
	});
	$('#pwd').on('keydown', function(e) {
		var keyCode = e.which;
		if (keyCode === 13) { // Enter Key
			signIn();
		}
	});
}
$(window).on("load", function() {
	init();
});
</script>
<!-- /JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->