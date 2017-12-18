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
			<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
				<form class="signup-page">
					<div class="signup-header">
						<h2>Register a new account</h2>
						<p>
							Already a member? Click <a href="#">HERE</a> to login to your
							account.
						</p>
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<label>Your Store Number</label>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-7">
					 <input class="form-control margin-bottom-20" placeholder="store number" type="text" id="storeno" name="sno"> 
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5">
					<button type="button" class="btn btn-primary pull-right" >Check Number</button>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					<label>Your Store Information</label>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					 <textarea class="form-control margin-bottom-20" style="resize: none;" placeholder="Information" rows="5" disabled id="storeinfo" name="sinfo"></textarea>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					<label>Your Name</label>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					 <input class="form-control margin-bottom-20" placeholder="Name" type="text" name="name"> 
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
					<label>Email Address <span class="color-red">*</span></label> 
					</div>
					<div class="col-md-7 col-sm-7 col-xs-7">
					<input class="form-control margin-bottom-20" placeholder="Email" id="signupemail" name="email" type="email">
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5">
					<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">Email Certification</button>
					</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>Password <span class="color-red">*</span>
							</label> <input class="form-control margin-bottom-20" placeholder="length more than 8"  type="password" id="originpwd" name="originpwd">
						</div>
						<div class="col-sm-6">
							<label>Confirm Password <span class="color-red">*</span>
							</label> <input class="form-control margin-bottom-20" placeholder="re-input password"  type="password" id="confirmpwd" name="confirmpwd">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-8">
							<label class="checkbox"> <input type="checkbox">I
								read the <a href="#">Terms and Conditions</a>
							</label>
						</div>
						<div class="col-lg-4 text-right">
							<button class="btn btn-primary" type="submit">Register</button>
						</div>
					</div>
				</form>
			</div>
			<!-- End Register Box -->
		</div>
	</div>
</div>
<!-- Small modal -->
<!-- 모달 안에 인증번호 입력란 인증메일보내기 버튼 제출버튼 -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Email Certification</h4>
      </div>
      <div class="modal-body">
      <p>Press the <b>Send button</b> first.
      <br>Second, if mail sending is successful, <b>check your email</b>.
      <br>Last, <b>Input your certification number</b> and press the <b>Submit</b> button.
      </p>
      <br>
      <div class="col-md-5 col-sm-5 col-xs-12">
			<button type="button" class="btn btn-default btn-block">Send Certification Number</button>
			<br>
		</div>
       <div class="col-md-7 col-sm-7 col-xs-12">
			<input class="form-control" placeholder="input your certification number" type="text" id="certifino"> 
		</div>		 
		<div class="row">
			<br><br>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->