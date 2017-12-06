<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- === BEGIN HEADER === -->
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<!-- Title -->
<title>MyPage</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- Favicon -->
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="./resources/user/css/bootstrap.css"
	rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="./resources/user/css/animate.css"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/user/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/user/css/nexus.css"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/user/css/responsive.css"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/user/css/custom.css"
	rel="stylesheet">
<!-- Google Fonts-->
<link
	href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300"
	rel="stylesheet" type="text/css">

<!-- modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="body-bg">
		<!-- Phone/Email -->
		<div id="pre-header" class="background-gray-lighter">
			<div class="container no-padding">
				<div class="row hidden-xs">
					<div class="col-sm-6 padding-vert-5">
						<strong>Phone:</strong>&nbsp;1-800-123-4567
					</div>
					<div class="col-sm-6 text-right padding-vert-5">
						<strong>Email:</strong>&nbsp;info@joomla51.com
					</div>
				</div>
			</div>
		</div>
		<!-- End Phone/Email -->
		<!-- Header -->
		<div id="header">
			<div class="container">
				<div class="row">
					<!-- Logo -->
					<div class="logo">
						<a href="index.html" title=""> <img
							src="./resources/user/img/logo.png" alt="Logo" />
						</a>
					</div>
					<!-- End Logo -->
				</div>
			</div>
		</div>
		<!-- End Header -->
		<!-- Top Menu -->
		<div id="hornav" class="bottom-border-shadow">
			<div class="container no-padding border-bottom">
				<div class="row">
					<div class="col-md-8 no-padding">
						<div class="visible-lg">
							<ul id="hornavmenu" class="nav navbar-nav">
								<li><a href="index.html" class="fa-home ">Home</a></li>
								<li><span class="fa-gears active">Features</span>
									<ul>
										<li class="parent"><span>Typography</span>
											<ul>
												<li><a href="features-typo-basic.html">Basic
														Typography</a></li>
												<li><a href="features-typo-blockquotes.html">Blockquotes</a>
												</li>
											</ul></li>
										<li class="parent"><span>Components</span>
											<ul>
												<li><a href="features-labels.html">Labels</a></li>
												<li><a href="features-progress-bars.html">Progress
														Bars</a></li>
												<li><a href="features-panels.html">Panels</a></li>
												<li><a href="features-pagination.html">Pagination</a></li>
											</ul></li>
										<li class="parent"><span>Icons</span>
											<ul>
												<li><a href="features-icons.html">Icons General</a></li>
												<li><a href="features-icons-social.html">Social
														Icons</a></li>
												<li><a href="features-icons-font-awesome.html">Font
														Awesome</a></li>
												<li><a href="features-icons-glyphicons.html">Glyphicons</a>
												</li>
											</ul></li>
										<li><a href="features-testimonials.html">Testimonials</a>
										</li>
										<li><a href="features-accordions-tabs.html">Accordions
												& Tabs</a></li>
										<li><a href="features-buttons.html">Buttons</a></li>
										<li><a href="features-carousels.html">Carousels</a></li>
										<li><a href="features-grid.html">Grid System</a></li>
										<li><a href="features-animate-on-scroll.html">Animate
												On Scroll</a></li>
									</ul></li>
								<li><span class="fa-copy ">Pages</span>
									<ul>
										<li><a href="pages-about-us.html">About Us</a></li>
										<li><a href="pages-services.html">Services</a></li>
										<li><a href="pages-faq.html">F.A.Q.</a></li>
										<li><a href="pages-about-me.html">About Me</a></li>
										<li><a href="pages-full-width.html">Full Width</a></li>
										<li><a href="pages-left-sidebar.html">Left Sidebar</a></li>
										<li><a href="pages-right-sidebar.html">Right Sidebar</a>
										</li>
										<li><a href="pages-login.html">Login</a></li>
										<li><a href="pages-sign-up.html">Sign-Up</a></li>
										<li><a href="pages-404.html">404 Error Page</a></li>
									</ul></li>
								<li><span class="fa-th ">Portfolio</span>
									<ul>
										<li><a href="portfolio-2-column.html">2 Column</a></li>
										<li><a href="portfolio-3-column.html">3 Column</a></li>
										<li><a href="portfolio-4-column.html">4 Column</a></li>
										<li><a href="portfolio-6-column.html">6 Column</a></li>
									</ul></li>
								<li><span class="fa-font ">Blog</span>
									<ul>
										<li><a href="blog-list.html">Blog</a></li>
										<li><a href="blog-single.html">Blog Single Item</a></li>
									</ul></li>
								<li><a href="contact.html" class="fa-comment ">Contact</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 no-padding">
						<ul class="social-icons pull-right">
							<li class="social-rss"><a href="#" target="_blank"
								title="RSS"></a></li>
							<li class="social-twitter"><a href="#" target="_blank"
								title="Twitter"></a></li>
							<li class="social-facebook"><a href="#" target="_blank"
								title="Facebook"></a></li>
							<li class="social-googleplus"><a href="#" target="_blank"
								title="Google+"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Top Menu -->
		<!-- === END HEADER === -->

		<!-- === 본문내용 === -->
		<div id="content">
			<div class="container background-white">
				<div class="row margin-vert-40">
					<!-- Begin Sidebar Menu -->
					<div class="col-md-3">
						<ul class="list-group sidebar-nav" id="sidebar-nav">
							<!-- 기프티콘 보관함 -->
							<li class="list-group-item list-toggle"><a
								data-toggle="collapse" data-parent="#sidebar-nav"
								href="#collapse-typography">기프티콘 보관함</a></li>

							<!-- 관심목록 -->
							<li class="list-group-item list-toggle"><a
								class="accordion-toggle" href="#collapse-components"
								data-toggle="collapse">관심목록</a></li>

							<!-- 회원탈퇴 -->
							<li class="list-group-item list-toggle"><a
								data-toggle="collapse" data-parent="#sidebar-nav"
								href="#collapse-icons">회원탈퇴</a></li>
						</ul>
					</div>
					<!-- End Sidebar Menu -->
					<div class="col-md-9">

						<div class="row margin-top-20">
							<div class="col-md-6">

								<!-- 나의 잔고 영역 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">나의 잔고</h3>
									</div>

									<div class="panel-body" align="right">
										<b style="font-size: 20pt;">
										<fmt:formatNumber value="${sessionScope.user.cash}" pattern="#,###"/>원
										</b>
										<button class="btn btn-primary" id="myBtn">충전하기</button>

										<!-- Modal -->
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content" align="left">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">충전하기</h4>
													</div>
													
													<div class="modal-body">
														<p>- 1000원이하의 금액은 충전 할 수 없습니다.</p>
														<p>- 이미 충전한 금액에 대해서는 환불이 불가능합니다.</p><br>
														
														<form id="increPointForm" action="/userIncreMoney.do"> 
														<input type="text" name="increNum">
														<button class="btn btn-primary" type="submit">충 전</button>
														</form>
														
													</div>
													
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">완료</button>
													</div>
												</div>

											</div>
										</div>

										<br> <br>
										<button class="btn btn-primary" id="purchaseDetailsBtn">거래내역</button>
										
										<!-- Modal -->
										<div class="modal fade" id="myModal2" role="dialog">
											<div class="modal-dialog modal-lg">

												<!-- Modal content-->
												<div class="modal-content" align="left">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">거래내역</h4>
														
													</div>
													
													<div class="modal-body">	
														<table border="1" style="text-align: center;">
															<tr style="font-size: 10pt;">
															<th>구매번호</th><th>사용자번호</th><th>지점상품번호</th>
															<th>지점번호</th><th>지점명</th><th>상품번호</th>
															<th>상품명</th><th>상품수량</th><th>합 계</th>
															<th>사용포인트</th><th>적립포인트</th><th>구매날짜</th>
															</tr>
															
														<c:forEach items="${list }" var="list">
														    <tr><td>${list.purchase_no }</td>
														    <td>${list.user_no }</td>
														    <td>${list.store_product_no }</td>
														    <td>${list.store_no }</td>
														    <td>${list.store_name }</td>
														    <td>${list.product_no }</td>
														    <td>${list.product_name }</td>
														    <td>${list.purchase_quantity }</td>
														    <td>${list.calculated_price }</td>
														    <td>${list.using_point }</td>
														    <td>${list.accumulate_point }p</td>
														    <td>${list.purchase_date }</td>
														    </tr>

														</c:forEach>
														</table>
													</div>
													
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">완료</button>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-6">
								<!-- 내가 쓴글 보기 영역 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">내가 쓴글 보기</h3>
									</div>
									<div class="panel-body">
										<a href="#" style="margin-right: 50px; font-size: 15pt;">
											게시글()</a>  
											<a href="#" style="margin-right: 50px; font-size: 15pt;">
											댓글()</a>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<!-- 포인트 현황 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">포인트 현황</h3>
									</div>
									<div class="panel-body" align="right" style="font-size: 20pt;">
										${sessionScope.user.point} point</div>
								</div>
							</div>
						</div>

						<hr>

						<div class="row">
							<!-- 자주구매 목록 -->
							<div class="col-md-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">자주 구매한 목록</h3>
									</div>
									<div class="panel-body" align="right" style="font-size: 15pt;">
										상품 리스트 영역</div>
								</div>
							</div>


							<!-- 관심목록 -->
							<div class="col-md-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">관심 목록</h3>
									</div>
									<div class="panel-body" align="right" style="font-size: 15pt;">
										<table border="1" style="text-align: center; font-size:10pt">
											<tr style="font-size: 10pt;">
											<th>상호명</th>
											<th>지점명</th>
											<th>상품명</th>
											<th>첨부파일변경명</th>
											<th>최소유통기한</th>
											</tr>
										
									<c:forEach items="${flist }" var="flist">
									    <tr>
										<td>${flist.brand_name }</td>
										<td>${flist.store_name }</td>
										<td>${flist.product_name }</td>
										<td>${flist.stored_file_name }</td>
										<td>${flist.min_expiration_hour }</td>
										</tr> 
									
									</c:forEach>
									
									</table>
										
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- === END CONTENT === -->
			<!-- === BEGIN FOOTER === -->
			<div id="base">
				<div class="container bottom-border padding-vert-30">
					<div class="row">
						<!-- Disclaimer -->
						<div class="col-md-4">
							<h3 class="class margin-bottom-10">Disclaimer</h3>
							<p>All stock images on this template demo are for
								presentation purposes only, intended to represent a live site
								and are not included with the template or in any of the Joomla51
								club membership plans.</p>
							<p>
								Most of the images used here are available from <a
									href="http://www.shutterstock.com/" target="_blank">shutterstock.com</a>.
								Links are provided if you wish to purchase them from their
								copyright owners.
							</p>
						</div>
						<!-- End Disclaimer -->
						<!-- Contact Details -->
						<div class="col-md-4 margin-bottom-20">
							<h3 class="margin-bottom-10">Contact Details</h3>
							<p>
								<span class="fa-phone">Telephone:</span>1-800-123-4567 <br>
								<span class="fa-envelope">Email:</span> <a
									href="mailto:info@example.com">info@example.com</a> <br> <span
									class="fa-link">Website:</span> <a
									href="http://www.example.com">www.example.com</a>
							</p>
							<p>
								The Dunes, Top Road, <br>Strandhill, <br>Co. Sligo, <br>Ireland
							</p>
						</div>
						<!-- End Contact Details -->
						<!-- Sample Menu -->
						<div class="col-md-4 margin-bottom-20">
							<h3 class="margin-bottom-10">Sample Menu</h3>
							<ul class="menu">
								<li><a class="fa-tasks" href="#">Placerat facer possim</a></li>
								<li><a class="fa-users" href="#">Quam nunc putamus</a></li>
								<li><a class="fa-signal" href="#">Velit esse molestie</a></li>
								<li><a class="fa-coffee" href="#">Nam liber tempor</a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<!-- End Sample Menu -->
					</div>
				</div>
			</div>
			<!-- Footer -->
			<div id="footer" class="background-grey">
				<div class="container">
					<div class="row">
						<!-- Footer Menu -->
						<div id="footermenu" class="col-md-8">
							<ul class="list-unstyled list-inline">
								<li><a href="#" target="_blank">Sample Link</a></li>
								<li><a href="#" target="_blank">Sample Link</a></li>
								<li><a href="#" target="_blank">Sample Link</a></li>
								<li><a href="#" target="_blank">Sample Link</a></li>
							</ul>
						</div>
						<!-- End Footer Menu -->
						<!-- Copyright -->
						<div id="copyright" class="col-md-4">
							<p class="pull-right">(c) 2014 Your Copyright Info</p>
						</div>
						<!-- End Copyright -->
					</div>
				</div>
			</div>
			<!-- End Footer -->
			<!-- JS -->

	<script>
			//충전하기 모달
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
				
			});
		});
		
			//거래내역 모달
		$(document).ready(function() {
			$("#purchaseDetailsBtn").click(function() {
				$("#myModal2").modal();
			});
		});
		
		
	</script>
			<script type="text/javascript" src="./resources/user/js/jquery.min.js"
				type="text/javascript"></script>
			<script type="text/javascript"
				src="./resources/user/js/bootstrap.min.js" type="text/javascript"></script>
			<script type="text/javascript" src="./resources/user/js/scripts.js"></script>
			<!-- Isotope - Portfolio Sorting -->
			<script type="text/javascript"
				src="./resources/user/js/jquery.isotope.js" type="text/javascript"></script>
			<!-- Mobile Menu - Slicknav -->
			<script type="text/javascript"
				src="./resources/user/js/jquery.slicknav.js" type="text/javascript"></script>
			<!-- Animate on Scroll-->
			<script type="text/javascript"
				src="./resources/user/js/jquery.visible.js" charset="utf-8"></script>
			<!-- Sticky Div -->
			<script type="text/javascript"
				src="./resources/user/js/jquery.sticky.js" charset="utf-8"></script>
			<!-- Slimbox2-->
			<script type="text/javascript" src="./resources/user/js/slimbox2.js"
				charset="utf-8"></script>
			<!-- Modernizr -->
			<script src="./resources/user/js/modernizr.custom.js"
				type="text/javascript"></script>
			<!-- End JS -->
</body>
</html>
<!-- === END FOOTER === -->
