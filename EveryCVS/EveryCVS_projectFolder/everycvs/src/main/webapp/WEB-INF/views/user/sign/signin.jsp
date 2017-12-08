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
		<div class="container">
			<div class="row margin-vert-30">
				<!-- Login Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<form class="login-page" name="form1" method="post" action="/everycvs/signinpost.do">
						<div class="login-header margin-bottom-30">
							<h2>Sign In to your account</h2>
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-user"></i>
							</span> <input placeholder="Email" id="email" name = "email" class="form-control" type="email">
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-lock"></i>
							</span> <input placeholder="Password" id="pwd" name = "pwd" class="form-control"
								type="password">
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="checkbox"> <input type="checkbox" name="usecookie">Stay
									signed in
								</label>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary pull-right" type="submit">Sign In</button>
							</div>
						</div>
						<hr>
						<h4>Need Account ?</h4>
						<p>
							<a href="#">Click here</a>to create your account!
						</p>
						<br>
						<h4>Forget your Password ?</h4>
						<p>
							<a href="#">Click here</a>to reset your password.
						</p>
					</form>
				</div>
				<!-- End Sign In Box -->
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