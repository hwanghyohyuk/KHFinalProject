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
	<div class="container background-white padding-vert-60">
		<div class="row margin-vert-60 padding-vert-60 ">
			<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
				<div class="login-page">
					<div class="login-header margin-bottom-30">
						<h2>Check your account</h2>
					</div>
					<hr>
					<div class=" input-group-lg margin-bottom-20 has-feedback" id="emailstatus">
						<input placeholder="Email" id="email" name="email" class="form-control " type="email" oninput="checkEmail();">
						<span class="glyphicon form-control-feedback" id="emailfeedback" style="font-size:20px;line-height:0px" aria-hidden="true"></span>
					</div>
					<div class="row">
						<div class="col-md-12 margin-bottom-20">
							<button class="btn btn-primary btn-lg btn-block" onclick="findEmail();">Submit</button>
						</div>
						<div class="col-md-12">
							<a class="btn btn-default btn-lg btn-block"
								href="/everycvs/sign/signin.do">Cancel</a>
						</div>
					</div>
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
<script type="text/javascript">
var isGood = false;
function checkEmail(){
	var email = $("#email").val();
	if(email != ''){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email.match(regExp) != null) {
			isGood = true;
			$("#emailstatus").addClass("has-success");
			$("#emailstatus").removeClass("has-error");
			$("#emailfeedback").addClass("glyphicon-ok");
			$("#emailfeedback").removeClass("glyphicon-remove");
		}else{
			isGood = false;
			$("#emailstatus").removeClass("has-success");
			$("#emailstatus").addClass("has-error");
			$("#emailfeedback").removeClass("glyphicon-ok");
			$("#emailfeedback").addClass("glyphicon-remove");
		}
	}else{
		isGood = false;
		$("#emailstatus").removeClass("has-success");
		$("#emailstatus").removeClass("has-error");
		$("#emailfeedback").removeClass("glyphicon-ok");
		$("#emailfeedback").removeClass("glyphicon-remove");
	}
}
function next(){
	location.href="/everycvs/user/findname.do";
}

function findEmail(){
	var email = $("#email").val();
	if (isGood) {			
		$.ajax({
			url:'/everycvs/user/findemailpost.do',
			data:{'email':email},
			type:'post',
			beforeSend:function(){
				swal({
					  title: '이메일 확인 중...',
					  allowOutsideClick: false,
					  onOpen: () => {swal.showLoading()}
					})
			},
			success:function(data){
				if(data===0){
					$("#emailstatus").removeClass("has-success");
					$("#emailstatus").addClass("has-error");	
					$("#emailfeedback").removeClass("glyphicon-ok");
					$("#emailfeedback").addClass("glyphicon-remove");
					swal({
						title: '이메일을 찾을 수 없습니다',
						timer: 1500,
						type: 'error'
					});
				}else{
					$("#emailstatus").addClass("has-success");
					$("#emailstatus").removeClass("has-error");	
					$("#emailfeedback").addClass("glyphicon-ok");
					$("#emailfeedback").removeClass("glyphicon-remove");
					swal({
						title: '이메일이 확인되었습니다',
						timer: 1500,
						type: 'success'
					});
					setTimeout("next()",1000);
				}	
			},
			error : function(request, status, error) {
				$("#emailstatus").removeClass("has-success");
				$("#emailstatus").addClass("has-error");	
				$("#emailfeedback").removeClass("glyphicon-ok");
				$("#emailfeedback").addClass("glyphicon-remove");
				swal({
					title: '오류',
					text: error,
					timer: 1500,
					type: 'error'
				});
			}});	
	}else {
		$("#emailstatus").removeClass("has-success");
		$("#emailstatus").addClass("has-error");	
		$("#emailfeedback").removeClass("glyphicon-ok");
		$("#emailfeedback").addClass("glyphicon-remove");
		swal({
			title: '입력 오류',
			text: '이메일을 확인해주세요',
			timer: 1500,
			type: 'error'
		});
	}
}
function init(){
	$('#email').on('keydown', function(e) {
		var keyCode = e.which;
		if (keyCode === 13) { // Enter Key
			findEmail();
		}
	});
}
$(window).on("load", function() {
	init();
});
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->