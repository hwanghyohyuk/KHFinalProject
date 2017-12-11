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
					<form class="login-page" name="form1" method="post" action="/everycvs/user/findphonepost.do">
						<div class="login-header margin-bottom-30">
							<h2>Succeed find your account</h2>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h3>Congraturation! </h3>
								<h4>Now, please <b>check your email</b>.<br>
								We send to your email for temporary password. </h4>
							</div>
							<div class="col-md-12">
								<button class="btn btn-primary pull-right" type="submit">Submit</button>
							</div>
							<div class="col-md-12">
								<a class="btn btn-primary pull-right" href="/everycvs/sign/signin.do">Next</a>
							</div>
						</div>
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
<c:if test="${result eq false }">
<script type="text/javascript">
alert("Sign in fail...\n check your email or password...");
</script>
</c:if>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->