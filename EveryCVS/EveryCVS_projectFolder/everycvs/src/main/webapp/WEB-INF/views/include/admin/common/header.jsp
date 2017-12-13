<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper">
	<header class="main-header">
		<!-- Logo -->
		<a href="/everycvs/main/main.do" class="logo">ADMIN</a><!-- 절대경로 -->
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <img
							src="/everycvs/resources/admin/dist/img/user2-160x160.jpg"
							class="user-image" alt="User Image" /> <span class="hidden-xs">${sessionScope.user.user_name}</span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header"><img
								src="/everycvs/resources/admin/dist/img/user2-160x160.jpg"
								class="img-circle" alt="User Image" />
								<p>
									${sessionScope.user.user_name}&nbsp;
									<c:choose>
										<c:when test="${sessionScope.user.job eq 'storemanager'}">
										- Store Manager
										</c:when>
										<c:when test="${sessionScope.user.job eq 'cvsmanager'}">
										- CVS Manager
										</c:when>
										<c:otherwise>
										- Site Manager
										</c:otherwise>
									</c:choose>
									<small>Member since
										${sessionScope.user.enroll_date}</small>
								</p></li>
							
						<c:if test="${ sessionScope.user.job eq 'storemanager' }">
							<!-- Menu Body -->
							<li class="user-body">
							<div class="col-md-12">Cash : ${ sessionScope.user.cash }
							</div>
							
							</li>
						</c:if>
							
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">Profile</a>
								</div>
								<div class="pull-right">
									<a href="/everycvs/user/signout.do" class="btn btn-default btn-flat">Sign
										out</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="/everycvs/resources/admin/dist/img/user2-160x160.jpg"
						class="img-circle" alt="User Image" />
				</div>
				<div class="pull-left info">
					<p>${sessionScope.user.user_name}</p>
				</div>
			</div>
			
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">
				<li class="header">${sessionScope.user.brand_name}&nbsp;NAVIGATION</li>
				<c:choose>
					<c:when test="${sessionScope.user.job eq 'storemanager'}">
						<li><a href="/everycvs/main/main.do"><i class="fa fa-home"></i>${sessionScope.user.store_name}</a></li>
						<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
								<span>지점 상품 관리</span> <i class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li><a href="#"><i class="fa fa-circle-o"></i> LevelOne</a></li>
								<li><a href="#"><i class="fa fa-circle-o"></i> LevelOne	<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu">
										<li><a href="#"><i class="fa fa-circle-o"></i>LevelTwo</a></li>
										<li><a href="#"><i class="fa fa-circle-o"></i>LevelTwo <i class="fa fa-angle-left pull-right"></i></a>
											<ul class="treeview-menu">
												<li><a href="#"><i class="fa fa-circle-o"></i>LevelThree</a></li>
												<li><a href="#"><i class="fa fa-circle-o"></i>LevelThree</a></li>
											</ul></li>
									</ul></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-question-circle"></i>	고객센터</a></li>
					</c:when>
					<c:when test="${sessionScope.user.job eq 'cvsmanager'}">
						<li><a href="/everycvs/main/main.do"><i class="fa fa-dashboard"></i> Dash Board</a></li>
						<li><a href="/everycvs/cvsstorelist.do">
							<i class="fa fa-home"></i> 지점 관리</a>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-cube"></i>
								<span> 상품 관리</span>
							</a>
							<ul class="treeview-menu">
								<li><a href="/everycvs/cvsproductList.do"><i class="fa fa-search"></i> 상품 리스트</a></li>
								<li><a href="/everycvs/cvsproductwriteview.do"><i class="fa fa-plus"></i> 상품 등록</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-gift"></i>
								<span> 이벤트 관리</span>
							</a>
							<ul class="treeview-menu">
								<li><a href="/everycvs/cvseventlist.do?code=1">
									<i class="fa fa-search"></i> 진행 중인 이벤트 리스트</a></li>
								<li><a href="/everycvs/cvseventlist.do?code=2">
									<i class="fa fa-archive"></i> 종료된 이벤트 리스트</a></li>
								<li><a href="/everycvs/cvseventwriteview.do">
									<i class="fa fa-plus"></i> 이벤트 등록</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
					<li><a href="/everycvs/main/main.do"><i class="fa fa-dashboard"></i> Dash Board</a></li>
						<li><a href="/everycvs/admin/manageUser.do"><i class="fa fa-users"></i>회원 관리</a></li>
						<li><a href="/everycvs/admin/manageCmnt.do"><i class="fa fa-list-alt"></i>커뮤니티 관리</a></li>
						<li><a href="/everycvs/admin/manageSrvc.do"><i class="fa fa-question-circle"></i>고객센터 관리</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>