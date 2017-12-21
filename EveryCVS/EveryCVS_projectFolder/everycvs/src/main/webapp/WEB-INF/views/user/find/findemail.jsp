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
						<h2>Check your account</h2>
					</div>
					<div class="input-group input-group-lg margin-bottom-20" id="emailstatus">
						<span class="input-group-addon"> <i class="fa fa-user"></i>
						</span> <input placeholder="Email" id="email" name="email"
							class="form-control " type="email" oninput="checkEmail();">
					</div>
					<div class="row">
						<div class="col-md-12">
							<button class="btn btn-primary btn-lg btn-block" type="button" onclick="findEmail();">Submit</button>
						</div>
						<div class="col-md-12">
							<a class="btn btn-default btn-lg btn-block"
								href="/everycvs/sign/signin.do">Cancel</a>
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
function next(){
	location.href="/everycvs/user/findname.do";
}

function findEmail(){
	var email = $("#email").val();
	var isComplete=0;
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
					$("#emailstatus").addClass("has-success");
					$("#emailstatus").removeClass("has-error");
					swal({
						title: '이메일을 찾을 수 없습니다',
						timer: 1500,
						type: 'error'
					});
				}else{
					$("#emailstatus").removeClass("has-success");
					$("#emailstatus").addClass("has-error");
					swal({
						title: '이메일이 확인되었습니다',
						timer: 1500,
						type: 'success'
					});
					setTimeout("next()",1500);
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
	}else {
		swal({
			title: '입력 오류',
			text: '이메일을 확인해주세요',
			timer: 1500,
			type: 'error'
		});
	}
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->