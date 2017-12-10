<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Yk2Lfzy1bcb3JZ5T1AJt&submodules=geocoder"></script>
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
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
<div id="event"></div>
<div id="icons" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<br> <br>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<h2 >
						<span class="fa-gift">Event</span>
					</h2>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 text-right">
					<a href="#">more</a>
				</div>
			</div>
			<!-- Icons -->
			<div
				class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-10 col-xs-offset-1 text-center">
				<div id="carousel-event-1" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-event-1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-event-1" data-slide-to="1"></li>
						<li data-target="#carousel-event-1" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img alt="image6"
								src="/everycvs/resources/user/img/frontpage/image6.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image5"
								src="/everycvs/resources/user/img/frontpage/image5.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image4"
								src="/everycvs/resources/user/img/frontpage/image4.jpg">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-event-1"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-event-1"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div
				class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-10 col-xs-offset-1 text-center">
				<div id="carousel-event-2" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-event-2" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-event-2" data-slide-to="1"></li>
						<li data-target="#carousel-event-2" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img alt="image6"
								src="/everycvs/resources/user/img/frontpage/image6.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image5"
								src="/everycvs/resources/user/img/frontpage/image5.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image4"
								src="/everycvs/resources/user/img/frontpage/image4.jpg">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-event-2"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-event-2"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div
				class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-10 col-xs-offset-1 text-center">
				<div id="carousel-event-3" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-event-3" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-event-3" data-slide-to="1"></li>
						<li data-target="#carousel-event-3" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img alt="image6"
								src="/everycvs/resources/user/img/frontpage/image6.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image5"
								src="/everycvs/resources/user/img/frontpage/image5.jpg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img alt="image4"
								src="/everycvs/resources/user/img/frontpage/image4.jpg">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-event-3"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-event-3"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- End Icons -->
			<div class="col-md-12">
				<br> <br>
			</div>
		</div>
	</div>
</div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<div class="row margin-vert-30">

				<div class="col-md-4 col-md-offset-3 hidden-xs hidden-sm">
					<br> <br> <img
						src="/everycvs/resources/user/img/main/arrowlr.png">
				</div>
				<div class="row margin-vert-30"></div>
				<div class="row margin-vert-30">
					<div
						class="col-md-5 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
						<div class="col-md-12 col-xs-12">
							<h2 style="line-height: 1.5em;">
								실시간<br>인기 상품 리스트
							</h2>
						</div>
						<div class="col-md-11 col-md-offset-1 col-sm-12  col-xs-12 ">
							<h4 style="line-height: 2.2em;">
								편의점 3사의 모든 상품이 대상인 <br>실시간 인기 상품 리스트입니다.
							</h4>
						</div>
					</div>
					<div
						class="col-md-4 col-md-offset-1 col-sm-5 col-sm-offset-6 col-xs-10 col-xs-offset-1">
						<div id="carousel-popprd-1" class="carousel slide"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-popprd-1" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="1"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img alt="image6"
										src="/everycvs/resources/user/img/frontpage/image6.jpg">
									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img alt="image5"
										src="/everycvs/resources/user/img/frontpage/image5.jpg">
									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img alt="image4"
										src="/everycvs/resources/user/img/frontpage/image4.jpg">
									<div class="carousel-caption"></div>
								</div>
							</div>

							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-popprd-1"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#carousel-popprd-1"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Main Text -->
			<div class="col-md-6">
				<h2>페이지 여기 모아놨따.</h2>
				<a href="test.do">지점상품1</a><br> 
				<a href="test2.do">지점상품2</a><br> 
				<a href="test3.do">지점상품3</a><br> 
				<a href="test4.do">지점상품4</a><br> 
				<a href="splist.do">지점상품5</a><br> 
				<a href="cvsstorelist.do">지점1</a><br> 
				<a href="selectServiceList.do">고객센터1</a><br> 
				<a href="insertService.do">고객센터2</a><br> 
				<a href="cvsproductlist.do">편의점상품1</a><br> 
				<a href="cvsproductwriteview.do">편의점상품2</a><br> 
				<a href="cvsproductmodifyview.do">편의점상품3</a><br> 
				<a href="gifticonPage.do">기프티콘</a><br> 
				<a href="favoriteList.do">관심목록</a><br>
				<a href="favoritePage.do">관심목록 페이지</a><br> 
				<a href="cvseventlist.do">편의점관리자:이벤트</a><br> 
				<a href="cvseventwriteview.do">편의점관리자:이벤트</a><br> 
				<a href="cvseventmodifyview.do">편의점관리자:이벤트</a><br>
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
<div id="cvssearch"></div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<div class="row">
				<br> <br>
				<div class="col-md-4">
					<h2>
						<span class="fa-search">CVS Search</span>
					</h2>
				</div>
				<div class="col-md-4 col-md-offset-4">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">주소검색</span> 
						<input id="address" type="text" class="form-control" placeholder="Search for..."> 
						<span class="input-group-btn">
							<button id="submit" class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
						<div class="input-group pull-right">
							<button id="init" type="button" class="btn btn-default">
								<span class="glyphicon glyphicon-map-marker"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id="map" style='height: 500px'>
				<script type="text/javascript"
					src="/everycvs/resources/user/js/map.js"></script>
				<br> <br>
			</div>
			<div class="col-md-12">
				<br> <br>
			</div>
		</div>
	</div>
</div>
<div id="help"></div>
<!-- Portfolio -->
<div id="portfolio" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<br> <br>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<h2>
						<span class="fa-question-circle">Help</span>
					</h2>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 text-right">
					<a href="#">more</a>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<!-- //Portfolio Item// -->
				<!-- Portfolio Item -->
				<div class="col-md-4 col-sm-6 col-xs-12">
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
				</div>
				<br> <br>
			</div>
		</div>
	</div>
</div>
<!-- End Portfolio -->
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->