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
			<!-- Register Box -->
			
			<div class="col-lg-10 col-lg-offset-1col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
					
					<div class="signup-page">
					<form id="signupform" action="/everycvs/sign/signuppost.do" method="post">
					<div class="signup-header margin-bottom-40">
						<h2 >Register a new account</h2>
						<p>
							Already a member? Click <a href="/everycvs/sign/signin.do">HERE</a> to login to your
							account.
						</p>
						<input name="job" type="hidden" value="customer"> 
					</div>
					<hr>
					<div class="row">
						<!-- 페이지 왼쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class=" input-group-lg  margin-bottom-40" id="emailstatus">
								<label>Email Address <span class="color-red">*</span></label> 
								<span class="input-group input-group-lg "> 
								<input class="form-control" placeholder="Email" id="signupemail" name="email" type="email"> 
								<span class="input-group-btn">
								<button type="button" class="btn btn-primary" onclick="certify();">Certify</button>
								</span>
								</span>
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
							<div class="input-group-lg  margin-bottom-40 has-feedback" id="namestatus">
								<label>Your Name</label> <input class="form-control" id="username"name="user_name" placeholder="Name" type="text" oninput="nameCheck();">
								<span class="glyphicon form-control-feedback" id="namefeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
							</div>
						</div>
						<!-- 페이지 오른쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div
								class="form-group input-group-lg  margin-bottom-40">
								<label>Gender</label> <br>
								<div class="btn-group margin-bottom-40" data-toggle="buttons">
									<label class="btn btn-primary btn-lg"> 
									<input type="radio" name="gender"  value="M" >남
									</label> 
									<label class="btn btn-primary btn-lg"> 
									<input type="radio" name="gender"  value="W" >여
									</label> 
									<label class="btn btn-primary btn-lg active"> 
									<input type="radio" name="gender"  value="N" checked>비공개
									</label>									
								</div>
								<div class="input-group-lg  margin-bottom-40">
									<label>Birth day</label> 
									<input class="form-control" id="birthday" name="birthday" type="date" min="1901-01-01" max="2009-12-31" onblur="birthCheck();">
								</div>
								<div class="input-group-lg  margin-bottom-40 has-feedback" id="phonestatus">
									<label>Phone</label> 
									<input class="form-control" id="phone" name="phone" placeholder="01012341234" type="tel" oninput="phoneCheck();">
									<span class="glyphicon form-control-feedback" id="phonefeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
								</div>
								<div class="input-group-lg  margin-bottom-40 has-feedback" id="addressstatus">
									<label>Address</label> 
									<input class="form-control" placeholder="Address" id="address" name="address" type="text" oninput="addressCheck();">
									<span class="glyphicon form-control-feedback" id="addressfeedback" style="font-size:20px;line-height:50px" aria-hidden="true"></span>
								</div>
							</div>
						</div>
						<!-- 페이지 하단부분 -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<hr>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<label class="checkbox"> <input type="checkbox" id="checkTerm" disabled>I read the <a href="#" data-toggle="modal" data-target="#tcmodal">Terms and Conditions</a>
								</label>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<button class="btn btn-primary btn-lg pull-right" type="button" onclick="userSubmit();">Registration</button>
							</div>
						</div>
					</div>
					</form>
					</div>
			</div>
			
			<!-- End Register Box -->
		</div>
	</div>
</div>
<!-- certifyform modal -->
<div class="modal fade" id="certifyform" tabindex="-1" role="dialog"
	aria-labelledby="" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">이메일 인증번호 입력</h3>
			</div>
			<div class="modal-body">
				<p>입력하신 이메일로 인증번호를 보내드렸습니다. <br>메일을 확인하신 후 인증번호를 입력해 주세요.</p>
				<span class="input-group-lg "> 
				<input class="form-control" placeholder="Certification Number" id="certifyno" name="certifyno" type="text">
				</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-lg" onclick="certifyConfirm();">제출</button>
			</div>
		</div>
	</div>
</div>
<!-- Terms and Conditions modal -->
<div class="modal fade" id="tcmodal" tabindex="-1" role="dialog"
	aria-labelledby="" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title">개인정보 처리 방침</h3>
			</div>
			<div class="modal-body">
			<EM>개인정보의 수집 및 이용목적</EM> 
			<P>회사는 서비스 제공을 위하여 필요한 최소한의 범위 내에서 다음 각 항목과 같은 목적으로 개인정보를 수집하고 있습니다.</P><br>
			<TABLE>
			<CAPTION>개인정보의 수집 및 이용목적</CAPTION>
			<COLGROUP>
			<COL width=300>
			<COL width=340>
			<COL></COLGROUP>
			<THEAD>
			<TR>
			<TH scope=col>개인정보 수집항목</TH>
			<TH scope=col>수집 목적</TH>
			<TH scope=col>보유 및 이용기간</TH></TR></THEAD>
			<TBODY>
			<TR>
			<TD>
			<P>성명, 비밀번호, 생년월일, 성별, 이동전화 번호, &nbsp;</P>
			<P>이메일&nbsp;&nbsp;</P></TD>
			<TD>회원제 서비스에 따른 본인 식별을 위해 사용 </TD>
			<TD class=other rowSpan=5>
			<P>회원탈퇴 시까지&nbsp;</P>
			<P>(기타 선택항목: 서비스 이용시까지)</P></TD></TR>
			<TR>
			<TD>광고성 정보 수신 동의 여부(이메일/우편/문자[SMS],전화)</TD>
			<TD>
			<UL>
			<LI>- 공지, 불만처리 등을 위한 원활한 의사소통의 전달</LI>
			<LI>- 새로운 서비스 및 상품이나 이벤트 정보 제공</LI>
			<LI>- 제휴 행사 및 서비스 홍보를 위한 TM자료 활용 </LI></UL></TD></TR>
			<TR>
			<TD>주소</TD>
			<TD>DM, 경품 및 쇼핑물품 배송지 확보</TD></TR>
			<TR>
			<TD>기타 선택항목(직장명,직장주소,부서명,생일)</TD>
			<TD>회원별 맞춤 서비스를 제공하기 위한 선택 입력</TD></TR></TBODY></TABLE>
			<P>그 밖에 인권침해 및 사생활 침해가 우려되는 개인정보는 일체 수집하지 않습니다.</P>
			<P>&nbsp;</P>
			</div>
			<div class="modal-footer">
				<button type="button" id="select" class="btn btn-primary btn-lg" onclick="termsCheck();">Agree</button>
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
//admin
var storecheck=0;
//user
//common
var emailcheck=0,
	passcheck=0,
	namecheck=0,
	birthcheck=0,
	phonecheck=0,
	addresscheck=0,
	termsToggle=false;
function certify(){
	var isGood = "";
	var email = $("#signupemail").val();
	if(email != ''){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (email.match(regExp) != null) {
			isGood = true;
		}else{
			isGood = false;
		}
		if (isGood) {			
			$.ajax({
				url:'/everycvs/sign/checkemail.do',
				data:{'email':email},
				type:'post',
				beforeSend:function(){
					swal({
						  title: '인증메일 전송 중',
						  allowOutsideClick: false,
						  onOpen: () => {swal.showLoading()}
						})
				},
				success:function(data){
					if(data===(-3)){//이메일 전송 오류
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
						$("#emailstatus").addClass("has-success");
						$("#emailstatus").removeClass("has-error");
						swal({
							title: '인증메일 전송 성공',
							timer: 1500,
							type: 'success'
						});
						$('#certifyform').modal({backdrop:'static', keyboard: false}) ;
					}else{
						$("#emailstatus").removeClass("has-success");
						$("#emailstatus").addClass("has-error");
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
		}else {
			$("#emailstatus").removeClass("has-success");
			$("#emailstatus").addClass("has-error");
			swal({
				title: '입력 오류',
				text: '이메일을 확인해주세요',
				timer: 1500,
				type: 'error'
			});
		}
	}else{
		$("#emailstatus").removeClass("has-success");
		$("#emailstatus").addClass("has-error");
		swal({
			title: '입력 오류',
			text: '이메일을 입력해주세요',
			timer: 1500,
			type: 'error'
		});
	}
}
function certifyConfirm(){
	var email = $("#signupemail").val();
	var certifyno = $('#certifyno').val();
	if(certifyno.length==8){
		$.ajax({
			url:'/everycvs/sign/checkcertification.do',
			data:{"email":email,
				"certifyno":certifyno },
			type:"post",
			beforeSend:function(){
				swal({
					  title: '인증번호 확인 중',
					  allowOutsideClick: false,
					  onOpen: () => {swal.showLoading()}
					})
			},
			success:function(data){
				if(data==1){
					swal({
						title: 'Success!',
						text: '이메일 인증을 완료했습니다.',
						timer: 1500,
						type: 'success'
					});
				}else{
					swal({
						title: 'Error!',
						text: '이메일 인증에 실패했습니다.',
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
	}else if(certifyno.length!=8){
		swal({
			title: '인증번호 입력 오류',
			text: '인증번호는 8자리 입니다<br>다시 입력해주세요',
			timer: 1500,
			type: 'error'
		});
	}
	
	$('#certifyform').modal('hide');
	emailcheck=1;
}
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
function nameCheck(){
	var username = $("#username").val();
	if (username == "") {
		namecheck = 0;
		$("#namestatus").removeClass("has-error");
		$("#namefeedback").removeClass("glyphicon-ok");
		$("#namefeedback").removeClass("glyphicon-remove");
	} else {
		var pattern = /^[가-힣]{2,4}$/;
		if(pattern.test(username)){	
			$("#namestatus").addClass("has-success");
			$("#namestatus").removeClass("has-error");
			$("#namefeedback").addClass("glyphicon-ok");
			$("#namefeedback").removeClass("glyphicon-remove");
			namecheck = 1;
		}else{
			$("#namestatus").removeClass("has-success");
			$("#namestatus").addClass("has-error");		
			$("#namefeedback").removeClass("glyphicon-ok");
			$("#namefeedback").addClass("glyphicon-remove");
			namecheck = 0;
		}	
	}
}
function birthCheck(){
	var temp = $("#birthday").val();
	var birthday = new Date(temp);

	var startDate = new Date("1900-12-31");
	var endDate = new Date("2010-01-01");

	if (birthday.getTime() > startDate.getTime() && birthday.getTime() < endDate.getTime()) {
		swal({
			title: '생년월일 입력 성공',
			timer:1500,
			text: '곧 닫힙니다.',
			type: 'success'
		});
		birthcheck=1;
	}else{
		swal({
			title: '생일 입력 실패',
			timer:1500,
			text: '다시 입력해주세요',
			type: 'error'
		});
		birthcheck=0;
	}
}
function phoneCheck(){
	var phone = $("#phone").val();
	if (phone == "") {
		$("#phonestatus").removeClass("has-error");
		$("#phonefeedback").removeClass("glyphicon-ok");
		$("#phonefeedback").removeClass("glyphicon-remove");
		phonecheck = 0;
	} else {
		var pattern = /^[0-9]{10,11}$/;
		if(pattern.test(phone)){
			$("#phonestatus").addClass("has-success");
			$("#phonestatus").removeClass("has-error");
			$("#phonefeedback").addClass("glyphicon-ok");
			$("#phonefeedback").removeClass("glyphicon-remove");
			phonecheck = 1;
		}else{
			$("#phonestatus").removeClass("has-success");
			$("#phonestatus").addClass("has-error");		
			$("#phonefeedback").removeClass("glyphicon-ok");
			$("#phonefeedback").addClass("glyphicon-remove");
			phonecheck = 0;
		}
	}
}

function addressCheck(){
	var address = $("#address").val();
	if (address.length>5) {
		$("#addressstatus").addClass("has-success");
		$("#addressstatus").removeClass("has-error");
		$("#addressfeedback").addClass("glyphicon-ok");
		$("#addressfeedback").removeClass("glyphicon-remove");
		addresscheck=1;
	}else if(address.length==0){
		$("#addressstatus").removeClass("has-error");
		$("#addressfeedback").removeClass("glyphicon-ok");
		$("#addressfeedback").removeClass("glyphicon-remove");
		addresscheck=0;
	}else{
		$("#addressstatus").removeClass("has-success");
		$("#addressstatus").addClass("has-error");		
		$("#addressfeedback").removeClass("glyphicon-ok");
		$("#addressfeedback").addClass("glyphicon-remove");
		addresscheck=0;
	}
}
function termsCheck(){
	if(!termsToggle){
		$('#checkTerm').prop('checked', true);
		$('#select').html("Degree");
		termsToggle=true;
	}else{
		$('#checkTerm').prop('checked', false);
		$('#select').html("Agree");
		termsToggle=false;
	}
	$('#tcmodal').modal('hide');
}

function userSubmit(){
	if(emailcheck==0){
		swal({
			title: '이메일 유효성 오류',
			timer:1500,
			text: '이메일 인증을 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(passcheck==0){
		swal({
			title: '비밀번호 유효성 오류',
			timer:1500,
			text: '비밀번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(namecheck==0){
		swal({
			title: '이름 유효성 오류',
			timer:1500,
			text: '이름 유효성 검사를 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(birthcheck==0){
		swal({
			title: '생년월일 유효성 오류',
			timer:1500,
			text: '생년월일 유효성 검사를 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(phonecheck==0){
		swal({
			title: '전화번호 유효성 오류',
			timer:1500,
			text: '전화번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(addresscheck==0){
		swal({
			title: '주소 유효성 오류',
			timer:1500,
			text: '주소 유효성 검사를 완료해주세요',
			type: 'error'
		});
		return;
	}else	if(!termsToggle){
		swal({
			title: '개인정보 처리방침 오류',
			timer:1500,
			text: '개인정보 처리방침에 동의해주세요',
			type: 'error'
		});
		return;
	}
	$('#signupform').submit();
}
function adminSubmit(){
	//관리자 제출부분
}
</script>
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->