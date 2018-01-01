<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<link rel="stylesheet" href="/everycvs/resources/user/css/userinfo.css" type="text/css">
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<c:set var="user" value="${sessionScope.user }"></c:set>
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<div
				class="col-lg-10 col-lg-offset-1col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
				<div class="signup-page">
					<div class="signup-header margin-bottom-40">
						<h2>User Infomation Modification</h2>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-4 col-sm-3 col-sm-offset-4 col-xs-7">
							<div class="thumbnail-wrapper"> 
								<div class="thumbnail"> 
									<div class="centered"> 
									<c:if test="${user.stored_file_name eq null || user.stored_file_name eq ''}">
									<img id="userimg" src="/everycvs/resources/user/img/user.png">
									</c:if>
									<c:if test="${user.stored_file_name ne null && user.stored_file_name ne ''}">
									<img id="userimg" src="/everycvs/resources/upload/${user.stored_file_name }">
									</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5 col-sm-5 col-xs-5">
							<form id="file-form" method="post" enctype="multipart/form-data" action="">
							<div class="filebox bs3-primary preview-image">
								<label for="input_file" class="btn btn_primary btn-lg">업로드</label>
								<input type="file" id="input_file" name="userimgfile" class="upload-hidden">
								<br>	<br>
								<input class="btn btn-green btn-lg" type="button" id="userimginit" onclick ="initImg();" value = "기본이미지">
							</div>
							</form>
						</div>
					</div>
					<hr>
					<form id="modifyform" action="/everycvs/user/modifypost.do"
						method="post">
						<div class="row">
							<!-- 페이지 상단부분 지점관리자만-->
							<c:if test="${user.job eq 'storemanager'}">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="margin-bottom-40">
										<label>Your Store Information</label>
										<textarea class="form-control"
											style="resize: none; font-size: 18px; line-height: 1.33;"
											placeholder="Information" rows="5" readonly id="storeinfo"
											name="sinfo">
								
								</textarea>
									</div>
									<hr>
								</div>
							</c:if>
							<!-- 페이지 왼쪽부분 -->
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class=" input-group-lg  margin-bottom-40" id="emailstatus">
									<label>Email Address</label> <input class="form-control"
										placeholder="Email" id="signupemail" name="email" type="email"
										value="${user.email}" readonly>
								</div>
								<div class="input-group-lg  margin-bottom-40 has-feedback"
									id="namestatus">
									<label>Your Name</label> <input class="form-control"
										id="username" name="user_name" placeholder="Name" type="text"
										oninput="nameCheck();" value="${user.user_name}"> <span
										class="glyphicon form-control-feedback" id="namefeedback"
										style="font-size: 20px; line-height: 50px" aria-hidden="true"></span>
								</div>
								<div class="input-group-lg  margin-bottom-40"
									id="birthdaystatus">
									<label>Birth day</label> <input class="form-control"
										id="birthday" name="birthday" type="date" min="1901-01-01"
										max="2009-12-31" onchange="birthCheck();"
										value="${user.birthday }">
								</div>
								<div class="input-group-lg  margin-bottom-40 has-feedback"
									id="phonestatus">
									<label>Phone</label> <input class="form-control" id="phone"
										name="phone" placeholder="01012341234" type="tel"
										oninput="phoneCheck();" value="${user.phone }"> <span
										class="glyphicon form-control-feedback" id="phonefeedback"
										style="font-size: 20px; line-height: 50px" aria-hidden="true"></span>
								</div>
							</div>
							<!-- 페이지 오른쪽부분 -->
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="form-group input-group-lg  margin-bottom-40">
									<label>Gender</label> <br>
									<div class="btn-group margin-bottom-40" data-toggle="buttons">
										<c:set var="gender" value="${user.gender }"></c:set>
										<c:if test="${gender eq 'M' }">
											<c:set var="m" value="active"></c:set>
											<c:set var="mc" value="checked"></c:set>
										</c:if>
										<c:if test="${gender eq 'W' }">
											<c:set var="w" value="active"></c:set>
											<c:set var="wc" value="checked"></c:set>
										</c:if>
										<c:if test="${gender eq 'N' }">
											<c:set var="n" value="active"></c:set>
											<c:set var="nc" value="checked"></c:set>
										</c:if>
										<label class="btn btn-primary btn-lg ${m}"><input
											type="radio" name="gender" value="M" ${mc}>남</label> <label
											class="btn btn-primary btn-lg ${w}"><input
											type="radio" name="gender" value="W" ${wc}>여</label> <label
											class="btn btn-primary btn-lg ${n}"><input
											type="radio" name="gender" value="N" ${nc}>비공개</label>
									</div>
									<div class="input-group-lg  margin-bottom-40 has-feedback"
										id="addressstatus">
										<label>Address</label> <input class="form-control"
											placeholder="Address" id="address" name="address" type="text"
											oninput="addressCheck();" value="${user.address }"> <span
											class="glyphicon form-control-feedback" id="addressfeedback"
											style="font-size: 20px; line-height: 50px" aria-hidden="true"></span>
									</div>
									<div class="input-group-lg  margin-bottom-40 has-feedback"
										id="pwdstatus">
										<label>Password </label> <input class="form-control" id="pwd"
											name="user_pwd" placeholder="length more than 8"
											type="password" oninput="pwdCheck();"> <span
											class="glyphicon form-control-feedback" id="pwdfeedback"
											style="font-size: 20px; line-height: 50px" aria-hidden="true"></span>
									</div>
									<div class="input-group-lg  margin-bottom-40 has-feedback"
										id="repwdstatus">
										<label>Confirm Password </label> <input class="form-control"
											id="repwd" placeholder="re-input password" type="password"
											oninput="repwdCheck();"> <span
											class="glyphicon form-control-feedback" id="repwdfeedback"
											style="font-size: 20px; line-height: 50px" aria-hidden="true"></span>
									</div>
								</div>
							</div>
							<!-- 페이지 하단부분 -->
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<hr>
								<button class="btn btn-primary btn-lg pull-right" type="button"
									onclick="checkSubmit();">MODIFY</button>
							</div>
						</div>
					</form>
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
var passcheck=0,
namecheck=0,
birthcheck=0,
phonecheck=0,
addresscheck=0;
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
		$("#birthdaystatus").addClass("has-success");
		$("#birthdaystatus").removeClass("has-error");	
		birthcheck=1;
	}else{
		$("#birthdaystatus").removeClass("has-success");
		$("#birthdaystatus").addClass("has-error");	
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
function checkSubmit(){
	var pwd=$('#pwd').val();
	var repwd=$('#repwd').val();	
	nameCheck();
	birthCheck();
	phoneCheck();
	addressCheck();	
	if(namecheck==0){
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
	}
	if(pwd.length>0 && repwd.length>0){
			if(passcheck==0){//길이가 모두 0보다 클때지만 passcheck가 성립하지 않았을때
				swal({
					title: '비밀번호 유효성 오류',
					timer:1500,
					text: '비밀번호 유효성 검사를 완료해주세요',
					type: 'error'
				});
				$("#repwd").focus();
				return;
			}
	}else if(pwd.length>0 && repwd.length==0){
		swal({
			title: '비밀번호 유효성 오류',
			timer:1500,
			text: '비밀번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#repwd").focus();
		return;
	}else if(pwd.length==0 && repwd.length>0){
		swal({
			title: '비밀번호 유효성 오류',
			timer:1500,
			text: '비밀번호 유효성 검사를 완료해주세요',
			type: 'error'
		});
		$("#pwd").focus();
		return;
	}
	swal({
		title: '사용자 정보 수정 완료',
		html:'안전한 정보 저장을 위해 로그아웃됩니다',
		timer:2000,
		type: 'success'
	});
	setTimeout(function(){
		$('#modifyform').submit();
	},1900);
	
}
$(document).ready(function(){
   var fileTarget = $('.filebox .upload-hidden');
    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        }else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };
    });
    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');
    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();
        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                $("#userimg").attr("src",src);
            }
            reader.readAsDataURL($(this)[0].files[0]);
            
            var form = $('#file-form')[0];
            var formData = new FormData(form);
            formData.append("fileObj", $("#input_file")[0].files[0]);

            $.ajax({
       			url: '/everycvs/ajax/userimgupload.do',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function(result){
                	swal({
    					title: '이미지 업로드 성공',
    					timer: 1500,
    					type: 'success'
    				});
                },
                error:function(error){
        			console.log(error);
        		}
                });
        }
    });
});

$(document).ready(function(){
	$.ajax({
		url:'/everycvs/ajax/storeinfo.do',
		type:'post',
		success:function(store){
			if(store!=null){
				var values = '브랜드 : '+store.brand_name+
				'\n지점명 : '+store.store_name+
				'\n도로명 주소 : '+store.road_address;
				$('#storeinfo').val(values);
			}						
		},
		error:function(error){
			console.log(error);
		}
	});
});

function initImg(){
	$.ajax({
		url:'/everycvs/ajax/initimg.do',
		type:'get',
		success:function(data){
			if(data>0){
				$("#userimg").attr("src","/everycvs/resources/user/img/user.png");
			}else{
				console.log("internal server error");
			}		
		},
		error:function(error){
			console.log(error);
		}
	});
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->