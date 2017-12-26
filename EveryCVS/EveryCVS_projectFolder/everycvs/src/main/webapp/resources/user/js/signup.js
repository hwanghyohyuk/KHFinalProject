/**
 * 사용자 지점관리자 회원가입 JavaScript
 */
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

function checkCertify(){
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
				url:'/everycvs/sign/checkcertify.do',
				data:{'email':email},
				type:'post',
				beforeSend:function(){
					swal({
						  title: '확인 중...',
						  html: '기존 인증번호 요청 유무',
						  allowOutsideClick: false,
						  onOpen: () => {swal.showLoading()}
						})
				},
				success:function(data){
					if(data===1){
						swal({
							title: '기존 인증번호 요청 존재',
							text: "인증번호를 다시 요청하시겠습니까?",
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
								sendCertify(1);
							} else if (result.dismiss === 'cancel') {
								swal({
									title: '취소됨',
									text: "기존 인증번호를 입력해주세요",
									timer: 1500,
									type: 'error'
								});
								$('#certifyform').modal({backdrop:'static', keyboard: false});
								$('#certifyno').focus();
							}
						});
					}else if(data===0){
						sendCertify(0);
					}
				},
				error : function(request, status, error) {
					swal({
						title: '오류',
						text: error,
						timer: 1500,
						type: 'error'
					});
					$("#signupemail").focus();
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
			$("#signupemail").focus();
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
		 $("#signupemail").focus();
	}
}
function sendCertify(cValue){
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
				data:{'email':email,
					'cValue':cValue},
				type:'post',
				beforeSend:function(){
					swal({
						  title: '인증메일 전송 중',
						  allowOutsideClick: false,
						  onOpen: () => {swal.showLoading()}
						})
				},
				success:function(data){
					if(data===(-3)){
						swal({
							title: '오류',
							text: '서버 오류',
							timer: 1500,
							type: 'error'
						});
					}else if(data===(-2)){//이메일 전송 오류
						swal({
							title: '오류',							
							text: '이메일 전송 오류',
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
						$("#certifyno").focus();
					}else{
						$("#emailstatus").removeClass("has-success");
						$("#emailstatus").addClass("has-error");
						swal({
							title: '이메일 중복',
							text: '다른 이메일을 입력해주세요',
							timer: 1500,
							type: 'error'
						});
						$("#signupemail").focus();
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
			$("#signupemail").focus();
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
		$("#signupemail").focus();
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
					$('#certifyform').modal('hide');
					emailcheck=1;
					$("#pwd").focus();
				}else{
					swal({
						title: 'Error!',
						text: '이메일 인증에 실패했습니다.',
						timer: 1500,
						type: 'error'
					});
					$('#certifyno').focus();
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
			text: '인증번호는 8자리 입니다\n다시 입력해주세요',
			timer: 1500,
			type: 'error'
		});
		emailcheck=0;
		$('#certifyno').focus();
	}
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
		$('#username').focus();
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
		$('#phone').focus();
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
		$("#signupemail").focus();
		return;
	}else	if(passcheck==0){
		swal({
			title: '비밀번호 유효성 오류',
			timer:1500,
			text: '비밀번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#repwd").focus();
		return;
	}else	if(namecheck==0){
		swal({
			title: '이름 유효성 오류',
			timer:1500,
			text: '이름 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#username").focus();
		return;
	}else	if(birthcheck==0){
		swal({
			title: '생년월일 유효성 오류',
			timer:1500,
			text: '생년월일 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#birthday").focus();
		return;
	}else	if(phonecheck==0){
		swal({
			title: '전화번호 유효성 오류',
			timer:1500,
			text: '전화번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#phone").focus();
		return;
	}else	if(addresscheck==0){
		swal({
			title: '주소 유효성 오류',
			timer:1500,
			text: '주소 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#address").focus();
		return;
	}else	if(!termsToggle){
		swal({
			title: '개인정보 처리방침 오류',
			timer:1500,
			text: '개인정보 처리방침에 동의해주세요',
			type: 'error'
		});
		$('#tcmodal').modal('show') ;		
		return;
	}
	$('#signupform').submit();
}
//관리자 회원가입 부분
//가입번호 체크
function enrollNoCheck(){
	var enrollNo = $("#enrollNo").val();
	if(enrollNo.length>7){
		$("#numstatus").addClass("has-success");
		$("#numstatus").removeClass("has-error");
	}else if(enrollNo.length==0){
		$("#numstatus").removeClass("has-success");
		$("#numstatus").removeClass("has-error");
	}else{
		$("#numstatus").removeClass("has-success");
		$("#numstatus").addClass("has-error");
	}
}
//가입번호 비교 부분
function enrollNoCompare(){
	var enrollNo = $("#enrollNo").val();
	if(enrollNo.length>7){
		$.ajax({
			url:'/everycvs/sign/enrollcompare.do',
			data:{'enrollNo':enrollNo},
			type:'post',
			beforeSend:function(){
				swal({
					  title: '가입번호 확인 중',
					  allowOutsideClick: false,
					  onOpen: () => {swal.showLoading()}
					})
			},
			success:function(store){
			if(store!=null){
				var values = '브랜드 : '+store.brand_name+
				'\n지점명 : '+store.store_name+
				'\n도로명 주소 : '+store.road_address;
				$('#storeinfo').val(values);
				var tags = '<input type="hidden" name="brand_no" value="'+store.brand_no+'">'+
				'<input type="hidden" name="store_no" value="'+store.store_no+'">';
				$('#addhidden').html(tags);
				swal({
					title: 'Success!',
					text: '가입번호가 일치하는 지점을 찾았습니다.',
					timer: 1500,
					type: 'success'
				});				
				storecheck=1;
			}else{
				swal({
					title: 'Error!',
					text: '가입번호가 일치하는 지점을 찾지 못했습니다.',
					timer: 1500,
					type: 'error'
				});
				storecheck=0;
			}
		},
		error : function(request, status, error) {
			swal({
				title: '오류',
				text: error,
				timer: 1500,
				type: 'error'
			});
			storecheck=0;
		}});
	}else{
		swal({
			title: '지점 가입번호 오류',
			timer:1500,
			text: '지점 가입번호를 확인해주세요',
			type: 'error'
		});
		storecheck=0;
	}	
}
function adminSubmit(){
	//관리자 제출부분
	if(storecheck==0){
		swal({
			title: '지점가입번호 인증 오류',
			timer:1500,
			text: '지점가입번호 인증을 완료해주세요',
			type: 'error'
		});
		$('#enrollNo').focus();
		return;
	}else if(emailcheck==0){
		swal({
			title: '이메일 유효성 오류',
			timer:1500,
			text: '이메일 인증을 완료해주세요',
			type: 'error'
		});
		$('#signupemail').focus();
		return;
	}else	if(passcheck==0){
		swal({
			title: '비밀번호 유효성 오류',
			timer:1500,
			text: '비밀번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$('#repwd').focus();
		return;
	}else	if(namecheck==0){
		swal({
			title: '이름 유효성 오류',
			timer:1500,
			text: '이름 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$('#username').focus();
		return;
	}else	if(birthcheck==0){
		swal({
			title: '생년월일 유효성 오류',
			timer:1500,
			text: '생년월일 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$('#birthday').focus();
		return;
	}else	if(phonecheck==0){
		swal({
			title: '전화번호 유효성 오류',
			timer:1500,
			text: '전화번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$('#phone').focus();
		return;
	}else	if(addresscheck==0){
		swal({
			title: '주소 유효성 오류',
			timer:1500,
			text: '주소 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$('#address').focus();
		return;
	}else	if(!termsToggle){
		swal({
			title: '개인정보 처리방침 오류',
			timer:1500,
			text: '개인정보 처리방침에 동의해주세요',
			type: 'error'
		});
		$('#tcmodal').modal('show');	
		return;
	}
	$('#signupform').submit();
}