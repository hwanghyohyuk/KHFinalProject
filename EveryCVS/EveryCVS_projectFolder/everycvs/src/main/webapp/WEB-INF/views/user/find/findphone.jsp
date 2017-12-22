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
			<!-- Login Box -->
			<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
				<form class="login-page">
					<div class="login-header margin-bottom-30">
						<h2>Check your phone</h2>
					</div>
					<div class="input-group-lg  margin-bottom-40 has-feedback" id="phonestatus">
						<input class="form-control" id="phone" name="phone" placeholder="01012341234" type="tel" oninput="phoneCheck();">
						<span class="glyphicon form-control-feedback" id="phonefeedback" style="font-size:20px;line-height:0px" aria-hidden="true"></span>
					</div>
					<div class="row">
						<div class="col-md-12">
							<button class="btn btn-primary btn-lg btn-block" type="button" onclick="findPhone();">Submit</button>
						</div>
						<div class="col-md-12">
							<a class="btn btn-default btn-lg btn-block" href="/everycvs/sign/signin.do">Cancel</a>
						</div>
					</div>
				</form>
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
function phoneCheck(){
	var phone = $("#phone").val();
	if (phone == "") {
		$("#phonestatus").removeClass("has-error");
		$("#phonefeedback").removeClass("glyphicon-ok");
		$("#phonefeedback").removeClass("glyphicon-remove");
		isGood = false;
	} else {
		var pattern = /^[0-9]{10,11}$/;
		if(pattern.test(phone)){
			$("#phonestatus").addClass("has-success");
			$("#phonestatus").removeClass("has-error");
			$("#phonefeedback").addClass("glyphicon-ok");
			$("#phonefeedback").removeClass("glyphicon-remove");
			isGood = true;
		}else{
			$("#phonestatus").removeClass("has-success");
			$("#phonestatus").addClass("has-error");		
			$("#phonefeedback").removeClass("glyphicon-ok");
			$("#phonefeedback").addClass("glyphicon-remove");
			isGood = false;
		}
	}
}
function next(){
	location.href="/everycvs/user/findsuccess.do";
}
function findPhone(){
	var phone = $("#phone").val();
	if (isGood) {			
		$.ajax({
			url:'/everycvs/user/findphonepost.do',
			data:{'phone':phone},
			type:'post',
			beforeSend:function(){
				swal({
					  title: '휴대폰 번호 확인 중...',
					  allowOutsideClick: false,
					  onOpen: () => {swal.showLoading()}
					})
			},
			success:function(data){
				if(data===0){
					$("#namestatus").removeClass("has-success");
					$("#namestatus").addClass("has-error");		
					$("#namefeedback").removeClass("glyphicon-ok");
					$("#namefeedback").addClass("glyphicon-remove");
					swal({
						title: '휴대폰 번호가 일치하지 않습니다',
						timer: 1500,
						type: 'error'
					});
				}else{
					$("#namestatus").addClass("has-success");
					$("#namestatus").removeClass("has-error");
					$("#namefeedback").addClass("glyphicon-ok");
					$("#namefeedback").removeClass("glyphicon-remove");
					swal({
						title: '휴대폰 번호가 일치합니다',
						timer: 1500,
						type: 'success'
					});
					setTimeout("sendEmail()",1500);
				}	
			},
			error : function(request, status, error) {
				$("#namestatus").removeClass("has-success");
				$("#namestatus").addClass("has-error");		
				$("#namefeedback").removeClass("glyphicon-ok");
				$("#namefeedback").addClass("glyphicon-remove");
				swal({
					title: '오류',
					text: error,
					timer: 1500,
					type: 'error'
				});
			}});	
	}else {
		$("#namestatus").removeClass("has-success");
		$("#namestatus").addClass("has-error");		
		$("#namefeedback").removeClass("glyphicon-ok");
		$("#namefeedback").addClass("glyphicon-remove");
		swal({
			title: '입력 오류',
			text: '휴대폰 번호를 확인해주세요',
			timer: 1500,
			type: 'error'
		});
	}
}

function sendEmail(){
	$.ajax({
		url:'/everycvs/user/sendresetpwd.do',
		type:'post',
		beforeSend:function(){
			swal({
				  title: '비밀번호 재설정 이메일 전송 중...',
				  allowOutsideClick: false,
				  onOpen: () => {swal.showLoading()}
				})
		},
		success:function(data){
			if(data===(-3)){
				swal({
					title: '오류',
					text: '이메일 전송 오류',
					timer: 1500,
					type: 'error'
				});
			}else if(data===(-2)){
				swal({
					title: '오류',
					text: '서버 오류',
					timer: 1500,
					type: 'error'
				});
			}else if(data===(-1)){
				swal({
					title: '오류',
					text: '인증번호 생성 오류',
					timer: 1500,
					type: 'error'
				});
			}else if(data===0){
				swal({
					title: '비밀번호 재설정 메일 전송 성공',
					timer: 1500,
					type: 'success'
				});
				setTimeout("next()",1500);
			}else{
				swal({
					title: '이메일 중복',
					text: '다른 이메일을 입력해주세요',
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
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->