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
<script type="text/javascript" src="/everycvs/resources/user/js/signup.js" type="text/javascript"></script>
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->