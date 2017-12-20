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
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
				<form class="signup-page">
					<div class="signup-header">
						<h2>Choose a new account type</h2>
						<p>
							Already a member? Click <a href="#">HERE</a> to login to your
							account.
						</p>
					</div>
					<a type="button" class="btn btn-primary btn-lg btn-block" href="signup.do">Sign Up for Customer</a>
					<a type="button" class="btn btn-default btn-lg btn-block" href="signupadmin.do">Sign Up for Store Manager</a>
				</form>
			</div>
			<!-- End Register Box -->
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