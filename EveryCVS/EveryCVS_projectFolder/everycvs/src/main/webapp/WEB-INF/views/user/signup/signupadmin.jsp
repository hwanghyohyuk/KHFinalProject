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
<!-- 
	 -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Register Box -->
			
			<div class="col-lg-10 col-lg-offset-1col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
					
					<div class="signup-page">
					<form>
					<div class="signup-header margin-bottom-40">
						<h2>Register a new account</h2>
						<p>
							Already a member? Click <a href="#">HERE</a> to login to your
							account.
						</p>
					</div>
					<hr>
					<div class="row">
					<!-- 페이지 상단부분 -->
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="input-group-lg  margin-bottom-40">
								<label>Your Store Number</label>
								<span class="input-group input-group-lg ">
								<input class="form-control" placeholder="store number" type="text" id="storeno" name="sno"> 
							 	<span class="input-group-btn">
								<button type="button" class="btn btn-primary pull-right" >Check Number</button>
								</span>
								</span>
							</div>
							<div class="margin-bottom-40">
								<label>Your Store Information</label>
								<textarea class="form-control" style="resize: none;font-size: 18px;line-height: 1.33;" placeholder="Information" rows="5" disabled id="storeinfo" name="sinfo"></textarea>
							</div>
							<hr>
						</div>
						<!-- 페이지 왼쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">						
							<div class=" input-group-lg  margin-bottom-40">
								<label>Email Address <span class="color-red">*</span></label> 
								<span class="input-group input-group-lg "> 
								<input class="form-control" placeholder="Email" id="signupemail" name="email" type="email"> 
								<span class="input-group-btn">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#certifyform">Certify</button>
								</span>
								</span>
							</div>
							<div class="input-group-lg  margin-bottom-40">
								<label>Password <span class="color-red">*</span>
								</label> <input class="form-control" placeholder="length more than 8" type="password">
							</div>
							<div class="input-group-lg  margin-bottom-40">
								<label>Confirm Password <span class="color-red">*</span>
								</label> <input class="form-control " placeholder="re-input password" type="password">
							</div>
							<div class="input-group-lg  margin-bottom-40">
								<label>Your Name</label> <input class="form-control" placeholder="Name" type="text">
							</div>
						</div>
						<!-- 페이지 오른쪽부분 -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class="form-group input-group-lg  margin-bottom-40">
								<label>Gender</label> <br>
								<div class="btn-group margin-bottom-40" data-toggle="buttons">
									<label class="btn btn-primary btn-lg"> 
									<input type="radio" name="gender" id="option1" value="M" autocomplete="off">남
									</label> 
									<label class="btn btn-primary btn-lg"> 
									<input type="radio" name="gender" id="option2" value="W" autocomplete="off">여
									</label> 
									<label class="btn btn-primary btn-lg active"> 
									<input type="radio" name="gender" id="option3" value="default" autocomplete="off" checked>비공개
									</label>									
								</div>
								<div class="input-group-lg  margin-bottom-40">
									<label>Birth day</label> 
									<input class="form-control" id="birthday" name="birthday" type="date" min="1901-1-1" max="2009-12-31">
								</div>
								<div class="input-group-lg  margin-bottom-40">
									<label>Phone</label> 
									<input class="form-control" placeholder="01012341234" type="tel">
								</div>
								<div class="input-group-lg  margin-bottom-40">
									<label>Address</label> 
									<input class="form-control" placeholder="Address" id="address" name="address" type="text">
								</div>
							</div>
						</div>
						<!-- 페이지 하단부분 -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<hr>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<label class="checkbox"> <input type="checkbox">I read the <a href="#" data-toggle="modal" data-target="#tcmodal">Terms and Conditions</a>
								</label>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<button class="btn btn-primary btn-lg pull-right" type="submit">Registration</button>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Email Certify</h4>
			</div>
			<div class="modal-body">
				<p>One fine body&hellip;</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
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
				<h4 class="modal-title">Terms and Conditions</h4>
			</div>
			<div class="modal-body">
				<p>One fine body&hellip;</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
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