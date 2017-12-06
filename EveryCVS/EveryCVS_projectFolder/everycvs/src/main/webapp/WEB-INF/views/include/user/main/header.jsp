<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="body-bg">
	<!-- Header -->
	<div id="header">
		<div class="container">
			<div class="row">
				<!-- Logo -->
				<div class="logo">
					<a href="/everycvs/main/main.do" title=""> <img
						src="/everycvs/resources/user/img/logo.png" alt="Logo" />
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
							<li><a href="/everycvs/main/main.do" class="fa-home active">Home</a></li>
							<li><span class="fa-gears ">Features</span>
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
									<li><a href="/everycvs/mypage.do">purchaselist</a></li>
									<li><a href="pages-services.html">Services</a></li>
									<li><a href="pages-faq.html">F.A.Q.</a></li>
									<li><a href="pages-about-me.html">About Me</a></li>
									<li><a href="pages-full-width.html">Full Width</a></li>
									<li><a href="pages-left-sidebar.html">Left Sidebar</a></li>
									<li><a href="pages-right-sidebar.html">Right Sidebar</a></li>
									<c:if test="${ sessionScope.user == null }"> 
									<li><a href="/everycvs/sign/signin.do">Login</a></li>
									</c:if>
									<c:if test="${ sessionScope.user != null }"> 
									<li><a href="#">${sessionScope.user.user_name}</a></li>
									</c:if>
									<li><a href="/everycvs/signout.do">Logout</a></li>
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
							<li><a href="contact.html" class="fa-comment ">Contact</a></li>
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