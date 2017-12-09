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
							<c:choose>
								<c:when test="${ sessionScope.store eq null }">
									<li><a href="/everycvs/main/main.do" class="fa-home active">EVERYCVS</a></li>
									<li><a href="/everycvs/main.do#cvssearch"><span class="fa-search">CVS SEARCH</span></a></li>
									<li><a href="#event"><span class="fa-gift">EVENT</span></a></li>
									<li><a href="#help"><span class="fa-question-circle">HELP</span></a></li>
								</c:when>
								<c:when test="${ sessionScope.store ne null}">
									<li><a href="/everycvs/main/main.do" class="fa-home active">EVERYCVS</a></li>
									<li><a href="/everycvs/main.do#cvssearch"><span class="fa-search">CVS SEARCH</span></a></li>
									<li><a href="#event"><span class="fa-cubes">Store Product</span></a></li>
								</c:when>
							</c:choose>

						</ul>
					</div>
				</div>
				<div class="col-md-4 no-padding">
					<ul id="hornavmenu" class="nav navbar-nav navbar-right">
						<c:if test="${ sessionScope.user eq null }">
							<li><a href="/everycvs/sign/signin.do"><span
									class="fa-user">LOGIN</span></a></li>
						</c:if>
						<c:if test="${ sessionScope.user ne null }">

							<li><a href="#">${sessionScope.user.user_name}</a>
								<ul>
									<li><a href="pages-services.html">My page</a></li>
									<li><a href="#">Cash : ${sessionScope.user.cash}</a></li>
									<li><a href="#">Point : ${sessionScope.user.point}</a></li>
									<li><a href="/everycvs/signout.do">Sign out</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Top Menu -->