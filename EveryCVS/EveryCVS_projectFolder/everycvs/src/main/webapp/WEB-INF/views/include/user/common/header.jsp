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
							<c:if test="${sessionScope.user.job eq 'storemanager'}">
								<li><a href="/everycvs/main/main.do" class="fa-home active">EVERYCVS</a></li>
								<li><a href="/everycvs/spmlist.do" class="fa-cubes">지점 상품 관리</a></li>
								<li><a href="/everycvs/apmlist.do" class="fa-question-circle">지점 상품 추가</a></li>
							</c:if>
							<c:if test="${sessionScope.user.job ne 'storemanager'}">
								<c:if test="${ sessionScope.store eq null}">
									<li><a href="/everycvs/main/main.do"	class="fa-home active">EVERYCVS</a></li>
								</c:if>
								<c:if test="${ sessionScope.store ne null}">
									<li><a href="/everycvs/page/storemain.do?sno=${sessionScope.store.store_no}" class="fa-home active">STORE MAIN</a></li>
								</c:if>
									<li><a href="/everycvs/main.do#cvssearch" class="fa-search">CVS SEARCH</a></li>
									<li><a href="/everycvs/page/eventmain.do" class="fa-gift">EVENT</a></li>
									<li><a href="/everycvs/page/servicemain.do" class="fa-question-circle">HELP</a></li>
							</c:if>
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
									<li><a href="/everycvs/mypage.do">My page</a></li>
									<li><a href="/everycvs/user/infointro.do">내 정보수정</a></li>
									<li><a href="#">Cash : ${sessionScope.user.cash}</a></li>
									<c:if test="${sessionScope.user.job eq 'customer'}">
										<li><a href="#">Point : ${sessionScope.user.point}</a></li>
									</c:if>
									<li><a href="/everycvs/user/signout.do">Sign out</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Top Menu -->