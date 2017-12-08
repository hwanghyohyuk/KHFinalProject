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
					<form class="login-page">
						<div class="login-header margin-bottom-30">
							<h2>Login to your account</h2>
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-email"></i>
							</span> <input placeholder="Email" class="form-control" type="text">
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-lock"></i>
							</span> <input placeholder="Password" class="form-control"
								type="password">
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="checkbox"> <input type="checkbox">Stay
									signed in
								</label>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary pull-right" type="submit">Login</button>
							</div>
						</div>
						<hr>
						<h4>Forget your Password ?</h4>
						<p>
							<a href="#">Click here</a>to reset your password.
						</p>
					</form>
				</div>
				<!-- End Login Box -->
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