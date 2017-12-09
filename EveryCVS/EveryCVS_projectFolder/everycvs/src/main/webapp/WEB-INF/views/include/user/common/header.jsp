<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="body-bg">
	<!-- Header -->
	<div id="header">
		<div class="container"
			style="background-image: url('/everycvs/resources/user/img/top.png');"></div>
	</div>
	<!-- End Header -->
	<!-- Top Menu -->
	<div id="hornav" class="bottom-border-shadow">
		<div class="container no-padding border-bottom">
			<div class="row">
				<div class="col-md-8 no-padding">
					<div class="visible-lg">
						<ul id="hornavmenu" class="nav navbar-nav">
							<li><a href="/everycvs/main/main.do" class="fa-home active">EVERYCVS</a></li>
							<li><a href="#"><span class="fa-search">CVS
										SEARCH</span></a></li>
							<li><a href="#"><span class="fa-gift">EVENT</span></a></li>
							<li><a href="/everycvs/selectServiceList.do"><span class="fa-question-circle">HELP</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 no-padding">
					<ul id="hornavmenu" class="nav navbar-nav navbar-right">
						<c:if test="${ sessionScope.user == null }">
							<li><a href="/everycvs/sign/signin.do"><span
									class="fa-user">LOGIN</span></a></li>
						</c:if>
						<c:if test="${ sessionScope.user != null }">

							<li><a href="/everycvs/">${sessionScope.user.user_name}</a>
								<ul>
									<li><a href="/everycvs/signout.do">Sign out</a></li>
									<li><a href="pages-services.html">Services</a></li>
									<li><a href="pages-faq.html">F.A.Q.</a></li>
									<li><a href="pages-about-me.html">About Me</a></li>
									<li><a href="pages-full-width.html">Full Width</a></li>
									<li><a href="pages-left-sidebar.html">Left Sidebar</a></li>
									<li><a href="pages-right-sidebar.html">Right Sidebar</a></li>
									<li><a href="pages-login.html">Login</a></li>
									<li><a href="pages-sign-up.html">Sign-Up</a></li>
									<li><a href="pages-404.html">404 Error Page</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Top Menu -->