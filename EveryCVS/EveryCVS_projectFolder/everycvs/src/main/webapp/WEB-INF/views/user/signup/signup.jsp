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
					<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
						<form class="signup-page">
							<div class="signup-header">
								<h2>Register a new account</h2>
								<p>
									Already a member? Click <a href="#">HERE</a>to login to your
									account.
								</p>
							</div>
							<label>First Name</label> <input
								class="form-control margin-bottom-20" type="text"> <label>Last
								Name</label> <input class="form-control margin-bottom-20" type="text">
							<label>Email Address <span class="color-red">*</span>
							</label> <input class="form-control margin-bottom-20" type="text">
							<div class="row">
								<div class="col-sm-6">
									<label>Password <span class="color-red">*</span>
									</label> <input class="form-control margin-bottom-20" type="password">
								</div>
								<div class="col-sm-6">
									<label>Confirm Password <span class="color-red">*</span>
									</label> <input class="form-control margin-bottom-20" type="password">
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
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->