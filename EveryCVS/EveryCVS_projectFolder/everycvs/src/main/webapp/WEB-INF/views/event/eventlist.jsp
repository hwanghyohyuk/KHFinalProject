<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet" type="text/css">
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container background-white">
				<div class="row margin-vert-30">
					<div class="col-md-12">
						<div id="category">
							<input type="button" class="category" value="진행중 이벤트"
								onClick="location.href='#"> <input type="button"
								class="category" value="종료된 이벤트" onClick="location.href='#">
							<input type="button" class="category" value="이벤트 당첨자"
								onClick="location.href='#">
						</div>
						<!-- Filter Buttons -->
						<div class="portfolio-filter-container margin-top-20">
							<ul class="portfolio-filter">
								<li class="portfolio-filter-label label label-primary">
									filter by:</li>
								<li><a href="#" class="portfolio-selected btn btn-default"
									data-filter="*">All</a></li>
								<li><a href="#" class="btn btn-default" data-filter=".GS25">GS25</a>
								</li>
								<li><a href="#" class="btn btn-default" data-filter=".CU">CU</a>
								</li>
								<li><a href="#" class="btn btn-default"
									data-filter=".7ELEVEN">7ELEVEN</a></li>
							</ul>
						</div>
						<!-- End Filter Buttons -->
					</div>
					<!--글 작성 버튼-->
					<div id=insert>
						<a href="eventInsert.do" class="category">글 등록</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 portfolio-group no-padding">
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 GS25">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image1.jpg" alt="image1">
										<figcaption>
											<h3 class="margin-top-20">GS 1+1 Event</h3>
											<span></span> <br> <span></span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 CU">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image2.jpg" alt="image2">
										<figcaption>
											<h3 class="margin-top-20">CU 행운을 잡아라!</h3>
											<span>잡혀줘라 ...</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 7ELEVEN">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image3.jpg" alt="image3">
										<figcaption>
											<h3 class="margin-top-20">7ELEVEN 화이팅!</h3>
											<span>에!!~~</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 GS25">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image4.jpg" alt="image4">
										<figcaption>
											<h3 class="margin-top-20">Nam liber tempor</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 CU">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image5.jpg" alt="image5">
										<figcaption>
											<h3 class="margin-top-20">Donec non urna</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 7ELEVEN">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image6.jpg" alt="image6">
										<figcaption>
											<h3 class="margin-top-20">Nullam consectetur</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 GS25">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image7.jpg" alt="image7">
										<figcaption>
											<h3 class="margin-top-20">Velit esse molestie</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 CU">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image8.jpg" alt="image8">
										<figcaption>
											<h3 class="margin-top-20">Quam nunc putamus</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 7ELEVEN">
							<div>
								<a href="#">
									<figure>
										<img src="/everycvs/resources/user/img/portfolio/image9.jpg" alt="image9">
										<figcaption>
											<h3 class="margin-top-20">Placerat facer possim</h3>
											<span>Sed ut perspiciatis unde omnis iste natus error
												sit voluptatem accusantium doloremque laudantium, totam rem
												aperiam.</span>
										</figcaption>
									</figure>
								</a>
							</div>
						</div>
						<!-- End Portfolio Item -->
					</div>
				</div>
				<!-- 페이지인 척 하는 새끼 -->
				<div class="text-center">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li class="active"><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>

	
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->