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
			<div id="carousel-event" class="carousel slide"
				data-ride="carousel">
				<!-- Carousel Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-event" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-event" data-slide-to="1"></li>
					<li data-target="#carousel-event" data-slide-to="2"></li>
				</ol>
				<div class="clearfix"></div>
				<!-- End Carousel Indicators -->
				<!-- Carousel Images -->
				<div class="carousel-inner" style="height:500px;">
					<c:forEach var="et3" items="${data.evetop3}" varStatus="status">
						<c:if test="${status.first}">
							<div class="item item text-center active">
						</c:if>
						<c:if test="${!status.first}">
							<div class="item text-center">
						</c:if>
							<span>
							<img src="/everycvs/resources/user/img/event/event_${status.index}.PNG" style="height:500px;">
							<div class="carousel-caption" style="background-color: rgba(255, 255, 255, 0.5);">
								<b>${et3.brand_name }&nbsp;&nbsp;</b>${et3.title } <br>
							</div>
							</span>
						</div>
					</c:forEach>
				</div>
			<!-- End Carousel Images -->
			<!-- Carousel Controls -->
				<a class="left carousel-control" href="#carousel-event"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#carousel-event"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			<!-- End Carousel Controls -->
			</div>
		<!-- End Carousel Slideshow -->
		</div>
	</div>
</div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-top-60 margin-bottom-30">
			<div class="row">
				<div class="col-md-12">
					<h2>
						<span class="fa-gift">실시간 인기 상품</span>
					</h2>
				</div>
			</div>
			<div class="row  margin-top-30">
				<div class="col-md-4 col-sm-4 col-xs-12 margin-bottom-30">
					<div id="carousel-popprd-1" class="carousel slide" data-ride="carousel">
						<div class="col-md-12 text-center margin-bottom-20" style="height:50px;">
							<h2>
								<span><img alt="" src="/everycvs/resources/user/img/main/gs25-logo.gif"></span>
							</h2>
						</div>
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-popprd-1" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-popprd-1" data-slide-to="1"></li>
							<li data-target="#carousel-popprd-1" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height:210px;">
							<c:forEach var="gt3" items="${data.gstop3}" varStatus="status">
								<c:if test="${status.first}">
									<div class="item text-center active">
								</c:if>
								<c:if test="${!status.first}">
									<div class="item text-center">
								</c:if>
										<span><img alt="${gt3.product_name }" style="height:210px;" src="/everycvs/resources/upload/${gt3.stored_file_name}"></span>
										<div class="carousel-caption"
											style="background-color: rgba(255, 255, 255, 0.5);">
											<b>${gt3.product_name }</b> <br>
											<fmt:formatNumber value="${gt3.price }" type="currency"
												groupingUsed="true" />
										</div>
									</div>
							</c:forEach>
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
				<div class="col-md-4 col-sm-4 col-xs-12 margin-bottom-30">
					<div id="carousel-popprd-2" class="carousel slide" data-ride="carousel">
						<div class="col-md-12 text-center margin-bottom-20" style="height:50px;">
							<h2>
								<span><img alt="" src="/everycvs/resources/user/img/main/cu-logo.gif"></span>
							</h2>
						</div>
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-popprd-2" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-popprd-2" data-slide-to="1"></li>
							<li data-target="#carousel-popprd-2" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height:210px;">
							<c:forEach var="ct3" items="${data.cutop3}" varStatus="status">
								<c:if test="${status.first}">
									<div class="item text-center active">
								</c:if>
								<c:if test="${!status.first}">
									<div class="item text-center">
								</c:if>
										<span><img alt="${ct3.product_name }" style="height:210px;" src="/everycvs/resources/upload/${ct3.stored_file_name}"></span>
										<div class="carousel-caption"
											style="background-color: rgba(255, 255, 255, 0.5);">
											<b>${ct3.product_name }</b> <br>
											<fmt:formatNumber value="${ct3.price }" type="currency"
												groupingUsed="true" />
										</div>
									</div>
							</c:forEach>
						</div>
					<!-- Controls -->
						<a class="left carousel-control" href="#carousel-popprd-2"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#carousel-popprd-2"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12 margin-bottom-30">
					<div id="carousel-popprd-3" class="carousel slide" data-ride="carousel">
						<div class="col-md-12 text-center margin-bottom-20" style="height:50px;">
							<h2>
								<span ><img alt="" src="/everycvs/resources/user/img/main/seven-logo.png" ></span>
							</h2>
						</div>
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-popprd-3" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-popprd-3" data-slide-to="1"></li>
							<li data-target="#carousel-popprd-3" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height:210px;">
							<c:forEach var="st3" items="${data.svtop3}" varStatus="status">
								<c:if test="${status.first}">
									<div class="item text-center active">
								</c:if>
								<c:if test="${!status.first}">
									<div class="item text-center">
								</c:if>
										<span><img alt="${st3.product_name }" style="height:210px;" src="/everycvs/resources/upload/${st3.stored_file_name}"></span>
										<div class="carousel-caption"
											style="background-color: rgba(255, 255, 255, 0.5);">
											<b>${st3.product_name }</b> <br>
											<fmt:formatNumber value="${st3.price }" type="currency"
												groupingUsed="true" />
										</div>
									</div>
							</c:forEach>
						</div>
					<!-- Controls -->
						<a class="left carousel-control" href="#carousel-popprd-3" role="button" data-slide="prev"> 
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#carousel-popprd-3" role="button" data-slide="next"> 
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="cvssearch"></div>
<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-60">
			<div class="row">
				<div class="col-md-12">
					<h2>
						<span class="fa-search">CVS Search</span>
					</h2>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12 margin-top-30">
					<div class="btn-group" role="group">
						<button id="cvsAll" type="button" class="btn btn-default btn-lg"
							onclick="setStoreList(0);">전체</button>
						<button id="cvsGS" type="button" class="btn btn-blue btn-lg"
							onclick="setStoreList(1);">GS25</button>
						<button id="cvsCU" type="button" class="btn btn-green btn-lg"
							onclick="setStoreList(2);">CU</button>
						<button id="cvs7E" type="button" class="btn btn-red btn-lg"
							onclick="setStoreList(3);">7ELEVEN</button>
					</div>
				</div>
				<div class="col-md-6  col-sm-6 col-xs-12 margin-top-30">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">주소검색</span> 
						<input id="address" type="text" class="form-control input-lg" placeholder="Search for..."> 
						<span class="input-group-btn">
							<button id="submit" class="btn btn-default btn-lg" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
							<button id="init" type="button" class="btn btn-default btn-lg" data-toggle="tooltip" data-placement="top" title="나의 위치">
								<span class="glyphicon glyphicon-map-marker"></span>
							</button>
						</span>
					</div>
				</div>
			</div>
			<div class="margin-bottom-30" id="map" style='height: 500px'>
				<br> <br>
			</div>			
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript" src="/everycvs/resources/user/js/map.js"></script>
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->