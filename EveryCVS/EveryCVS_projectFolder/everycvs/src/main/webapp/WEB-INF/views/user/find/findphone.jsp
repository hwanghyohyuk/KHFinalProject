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
						<h2>Check your phone</h2>
					</div>
					<hr>
					<div class="input-group-lg  margin-bottom-40 has-feedback" id="phonestatus">
						<input class="form-control" id="phone" name="phone" placeholder="01012341234" type="tel" oninput="phoneCheck();">
						<span class="glyphicon form-control-feedback" id="phonefeedback" style="font-size:20px;line-height:0px" aria-hidden="true"></span>
					</div>
					<div class="row">
						<div class="col-md-12 margin-bottom-20">
							<button class="btn btn-primary btn-lg btn-block" onclick="findPhone();">Submit</button>
						</div>
						<div class="col-md-12">
							<a class="btn btn-default btn-lg btn-block" href="/everycvs/sign/signin.do">Cancel</a>
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
					});
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
					setTimeout("checkPasslink()",1500);
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
function checkPasslink(){
	$.ajax({
		url:'/everycvs/user/checkpasslink.do',
		type:'post',
		beforeSend:function(){
			swal({
				  title: '확인 중...',
				  html: '기존 비밀번호 재설정 링크 유무',
				  allowOutsideClick: false,
				  onOpen: () => {swal.showLoading()}
				})
		},
		success:function(data){
			if(data===1){
				swal({
					title: '기존 비밀번호 재설정 링크 존재',
					text: "비밀번호 재설정 링크를 다시 보내시겠습니까?",
					type: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '예',
					cancelButtonText: '아니요',
					confirmButtonClass: 'btn btn-success btn-lg',
					cancelButtonClass: 'btn btn-danger btn-lg',
					buttonsStyling: false,
					allowOutsideClick: false,
					reverseButtons: true
					}).then((result) => {
					if (result.value) {
						sendEmail(1);
					} else if (result.dismiss === 'cancel') {
						swal({
							title: '취소됨',
							text: "이메일을 다시 확인해주세요",
							timer: 1500,
							type: 'error'
						});
					}
				});
			}else if(data===0){
				sendEmail(0);
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
function sendEmail(pValue){
	$.ajax({
		url:'/everycvs/user/sendresetpwd.do',
		data:{'pValue':pValue},
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
			}else if(data===1){
				swal({
					title: '비밀번호 재설정 메일 전송 성공',
					html: '입력하신 이메일로 비밀번호 재설정 링크를 보내드렸습니다',
					timer: 2000,
					type: 'success'
				});
				setTimeout("next()",2000);
			}else{
				swal({
					title: '알수없는 에러',
					timer: 1500,
					type: 'warning'
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