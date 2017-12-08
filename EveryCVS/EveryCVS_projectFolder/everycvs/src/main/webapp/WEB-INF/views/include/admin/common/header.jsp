<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper">
	<header class="main-header">
		<!-- Logo -->
		<a href="main/main.do" class="logo">ADMIN</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<li class="dropdown messages-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
					</a>
						<ul class="dropdown-menu">
							<li class="header">You have 4 messages</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li>
										<!-- start message --> <a href="#">
											<div class="pull-left">
												<img
													src="/everycvs/resources/admin/dist/img/user2-160x160.jpg"
													class="img-circle" alt="User Image" />
											</div>
											<h4>
												Support Team <small><i class="fa fa-clock-o"></i> 5
													mins</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a>
									</li>
									<!-- end message -->
									<li><a href="#">
											<div class="pull-left">
												<img
													src="/everycvs/resources/admin/dist/img/user3-128x128.jpg"
													class="img-circle" alt="user image" />
											</div>
											<h4>
												AdminLTE Design Team <small><i class="fa fa-clock-o"></i>
													2 hours</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="/everycvs/resources/admin/dist/img/user4-128x128.jpg"
													class="img-circle" alt="user image" />
											</div>
											<h4>
												Developers <small><i class="fa fa-clock-o"></i>
													Today</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="/everycvs/resources/admin/dist/img/user3-128x128.jpg"
													class="img-circle" alt="user image" />
											</div>
											<h4>
												Sales Department <small><i class="fa fa-clock-o"></i>
													Yesterday</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="/everycvs/resources/admin/dist/img/user4-128x128.jpg"
													class="img-circle" alt="user image" />
											</div>
											<h4>
												Reviewers <small><i class="fa fa-clock-o"></i> 2
													days</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
								</ul>
							</li>
							<li class="footer"><a href="#">See All Messages</a></li>
						</ul></li>
					<!-- Notifications: style can be found in dropdown.less -->
					<li class="dropdown notifications-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-bell-o"></i> <span class="label label-warning">10</span>
					</a>
						<ul class="dropdown-menu">
							<li class="header">You have 10 notifications</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li><a href="#"> <i class="fa fa-users text-aqua"></i>
											5 new members joined today
									</a></li>
									<li><a href="#"> <i class="fa fa-warning text-yellow"></i>
											Very long description here that may not fit into the page and
											may cause design problems
									</a></li>
									<li><a href="#"> <i class="fa fa-users text-red"></i>
											5 new members joined
									</a></li>

									<li><a href="#"> <i
											class="fa fa-shopping-cart text-green"></i> 25 sales made
									</a></li>
									<li><a href="#"> <i class="fa fa-user text-red"></i>
											You changed your username
									</a></li>
								</ul>
							</li>
							<li class="footer"><a href="#">View all</a></li>
						</ul></li>
					<!-- Tasks: style can be found in dropdown.less -->
					<li class="dropdown tasks-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
					</a>
						<ul class="dropdown-menu">
							<li class="header">You have 9 tasks</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li>
										<!-- Task item --> <a href="#">
											<h3>
												Design some buttons <small class="pull-right">20%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-aqua"
													style="width: 20%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">20% Complete</span>
												</div>
											</div>
									</a>
									</li>
									<!-- end task item -->
									<li>
										<!-- Task item --> <a href="#">
											<h3>
												Create a nice theme <small class="pull-right">40%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green"
													style="width: 40%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">40% Complete</span>
												</div>
											</div>
									</a>
									</li>
									<!-- end task item -->
									<li>
										<!-- Task item --> <a href="#">
											<h3>
												Some task I need to do <small class="pull-right">60%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-red"
													style="width: 60%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">60% Complete</span>
												</div>
											</div>
									</a>
									</li>
									<!-- end task item -->
									<li>
										<!-- Task item --> <a href="#">
											<h3>
												Make beautiful transitions <small class="pull-right">80%</small>
											</h3>
											<div class="progress xs">
												<div class="progress-bar progress-bar-yellow"
													style="width: 80%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">80% Complete</span>
												</div>
											</div>
									</a>
									</li>
									<!-- end task item -->
								</ul>
							</li>
							<li class="footer"><a href="#">View all tasks</a></li>
						</ul></li>
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
									${sessionScope.user.user_name} - 
									<c:choose>
										<c:when test="${sessionScope.user.job eq 'storemanager'}">
										Store Manager
										</c:when>
										<c:when test="${sessionScope.user.job eq 'cvsmanager'}">
										CVS Manager
										</c:when>
										<c:otherwise>
										Site Manager
										</c:otherwise>
									</c:choose>
									<small>Member since
										${sessionScope.user.enroll_date}</small>
								</p></li>
							<!-- Menu Body -->
							<li class="user-body">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">Profile</a>
								</div>
								<div class="pull-right">
									<a href="signout.do" class="btn btn-default btn-flat">Sign
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
						<li><a href="#"><i class="fa fa-home"></i>${sessionScope.user.store_name}</a></li>
						<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
								<span>Store Product Management</span> <i class="fa fa-angle-left pull-right"></i></a>
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
						<li><a href="#"><i class="fa fa-question-circle"></i>	Service Center</a></li>
					</c:when>
					<c:when test="${sessionScope.user.job eq 'cvsmanager'}">
						<li><a href="#"><i class="fa fa-dashboard"></i> Dash
								Board</a></li>
						<li><a href="#"><i class="fa fa-home"></i> Store
								Management</a></li>
						<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
								<span>CVS Product Management</span> <i class="fa fa-angle-left pull-right"></i></a>
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
						<li><a href="#"><i class="fa fa-gift"></i> Evevnt
								Management</a></li>
						<li><a href="#"><i class="fa fa-question-circle"></i>
								Service Center</a></li>
					</c:when>
					<c:otherwise>//sitemanager
					<li><a href="#"><i class="fa fa-dashboard"></i> Dash Board</a></li>
						<li><a href="#"><i class="fa fa-users"></i> User
								Management</a></li>
						<li><a href="#"><i class="fa fa-list-alt"></i> Community
								Management</a></li>
						<li><a href="#"><i class="fa fa-question-circle"></i>
								Service Center Management </a></li>
					</c:otherwise>
				</c:choose>
			<li><a href="#"><i class="fa fa-book"></i> Documentation</a></li>
			<li class="header">LABELS</li>
			<li><a href="#"><i class="fa fa-circle-o text-danger"></i>
					Important</a></li>
			<li><a href="#"><i class="fa fa-circle-o text-warning"></i>
					Warning</a></li>
			<li><a href="#"><i class="fa fa-circle-o text-info"></i>
					Information</a></li>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>