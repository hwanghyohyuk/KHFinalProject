<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/main/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="slideshow" class="bottom-border-shadow">
	<div class="container no-padding background-white bottom-border">
		<div class="row">
			<!-- Carousel Slideshow -->
			<div id="carousel-example" class="carousel slide"
				data-ride="carousel">
				<!-- Carousel Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example" data-slide-to="1"></li>
					<li data-target="#carousel-example" data-slide-to="2"></li>
				</ol>
				<div class="clearfix"></div>
				<!-- End Carousel Indicators -->
				<!-- Carousel Images -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="/everycvs/resources/user/img/slideshow/slide1.jpg">
					</div>
					<div class="item">
						<img src="/everycvs/resources/user/img/slideshow/slide2.jpg">
					</div>
					<div class="item">
						<img src="/everycvs/resources/user/img/slideshow/slide3.jpg">
					</div>
					<div class="item">
						<img src="/everycvs/resources/user/img/slideshow/slide4.jpg">
					</div>
				</div>
				<!-- End Carousel Images -->
				<!-- Carousel Controls -->
				<a class="left carousel-control" href="#carousel-example"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#carousel-example"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
				<!-- End Carousel Controls -->
			</div>
			<!-- End Carousel Slideshow -->
		</div>
	</div>
</div>
<div id="icons" class="bottom-border-shadow">
	<div class="container background-grey bottom-border">
		<div class="row padding-vert-60">
			<!-- Icons -->
			<div class="col-md-4 text-center">
				<i class="fa-cogs fa-4x color-primary animate fadeIn"></i>
				<h2 class="padding-top-10 animate fadeIn">Velit esse molestie</h2>
				<p class="animate fadeIn">Nam liber tempor cum soluta nobis
					eleifend option congue nihil imperdiet doming id quod mazim
					placerat facer.</p>
			</div>
			<div class="col-md-4 text-center">
				<i class="fa-cloud-download fa-4x color-primary animate fadeIn"></i>
				<h2 class="padding-top-10 animate fadeIn">Quam nunc putamus</h2>
				<p class="animate fadeIn">Nam liber tempor cum soluta nobis
					eleifend option congue nihil imperdiet doming id quod mazim
					placerat facer.</p>
			</div>
			<div class="col-md-4 text-center">
				<i class="fa-bar-chart fa-4x color-primary animate fadeIn"></i>
				<h2 class="padding-top-10 animate fadeIn">Placerat facer possim</h2>
				<p class="animate fadeIn">Nam liber tempor cum soluta nobis
					eleifend option congue nihil imperdiet doming id quod mazim
					placerat facer.</p>
			</div>
			<!-- End Icons -->
		</div>
	</div>
</div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Main Text -->
			<div class="col-md-6">
				<h2>Welcome to Habitat</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
					tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
					consequat.</p>
				<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
					velit esse molestie consequat, vel illum dolore eu feugiat nulla
					facilisis at vero eros et accumsan et iusto odio dignissim qui
					blandit praesent luptatum zzril delenit augue duis dolore te
					feugait nulla facilisi. Cras non sem sem, at eleifend mi. Nam liber
					tempor cum soluta nobis eleifend option congue nihil imperdiet
					doming id quod mazim placerat facer possim assum. Curabitur eget
					nisl a risus.</p>
			</div>
			<!-- End Main Text -->
			<div class="col-md-6">
				<h3 class="padding-vert-10">Key Features</h3>
				<p>Duis sit amet orci et lectus dictum auctor a nec enim. Donec
					suscipit fringilla elementum. Suspendisse nec justo ut felis ornare
					tincidunt vitae et lectus.</p>
				<ul class="tick animate fadeInRight">
					<li>Responsive Design</li>
					<li>Built with LESS</li>
					<li>Font Choosers</li>
					<li>Replaceable Background Image</li>
					<li>Custom Module Widths</li>
					<li>All Module Extensions Included</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio -->
<div id="portfolio" class="bottom-border-shadow">
	<div class="container bottom-border">
		<div class="row padding-top-40">
			<ul class="portfolio-group">
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeInLeft">
							<img alt="image1"
								src="/everycvs/resources/user/img/frontpage/image1.jpg">
							<figcaption>
								<h3>Velit esse molestie</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeIn">
							<img alt="image2"
								src="/everycvs/resources/user/img/frontpage/image2.jpg">
							<figcaption>
								<h3>Quam nunc putamus</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeInRight">
							<img alt="image3"
								src="/everycvs/resources/user/img/frontpage/image3.jpg">
							<figcaption>
								<h3>Placerat facer possim</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeInLeft">
							<img alt="image4"
								src="/everycvs/resources/user/img/frontpage/image4.jpg">
							<figcaption>
								<h3>Nam liber tempor</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeIn">
							<img alt="image5"
								src="/everycvs/resources/user/img/frontpage/image5.jpg">
							<figcaption>
								<h3>Donec non urna</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">
					<a href="#">
						<figure class="animate fadeInRight">
							<img alt="image6"
								src="/everycvs/resources/user/img/frontpage/image6.jpg">
							<figcaption>
								<h3>Nullam consectetur</h3>
								<span>Vel illum dolore eu feugiat nulla facilisis at vero
									eros et accumsan et iusto odio dignissim qui et everti tamquam
									suavitate mea.</span>
							</figcaption>
						</figure>
				</a>
				</li>
				<!-- //Portfolio Item// -->
			</ul>
		</div>
	</div>
</div>
<!-- End Portfolio -->
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/main/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->