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

<div id="content" class="bottom-border-shadow">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Main Text -->
			<div class="col-md-6">
				<h2>페이지 여기 모아놨따.</h2>
				<a href="splist.do">지점상품</a><br> <a href="cvsstorelist.do">지점1</a><br>
				<a href="selectServiceList.do">고객센터1</a><br> <a
					href="insertService.do">고객센터2</a><br> <a
					href="detailService.do">고객센터3</a><br>
				<a href="cvsproductlist.do">편의점상품1</a><br> <a
					href="cvsproductwriteview.do">편의점상품2</a><br> <a
					href="cvsproductmodifyview.do">편의점상품3</a><br> <a
					href="gifticonPage.do">기프티콘</a><br> <a href="favoriteList.do">관심목록</a><br>
				<a href="favoritePage.do">관심목록 페이지</a><br> <a
					href="cvseventlist.do">편의점관리자:이벤트</a><br> <a
					href="cvseventwriteview.do">편의점관리자:이벤트</a><br> <a
					href="cvseventmodifyview.do">편의점관리자:이벤트</a><br> <a
					href="/everycvs/page/storemain.do?sno=22497453">지점메인이동하기</a><br>
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
					<script type="text/javascript">
					</script>
					<c:forEach var="et3" items="${evetop3}" varStatus="status">
						<c:if test="${status.first}">
							<div class="item active">
						</c:if>
						<c:if test="${!status.first}">
							<div class="item">
						</c:if>
						<img src="/everycvs/resources/user/img/slideshow/slide1.jpg">
						<div class="carousel-caption"
										style="background-color: rgba(255, 255, 255, 0.5);">
										<b>${et3.brand_name }&nbsp;&nbsp;</b>${et3.title } <br>
									</div>
				</div>
				</c:forEach>
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
								<c:forEach var="pt3" items="${poptop3}" varStatus="status">
									<c:if test="${status.first}">
										<div class="item active">
									</c:if>
									<c:if test="${!status.first}">
										<div class="item">
									</c:if>
									<img alt="${pt3.product_name }"
										src="/everycvs/resources/user/img/frontpage/image6.jpg">
									<div class="carousel-caption"
										style="background-color: rgba(255, 255, 255, 0.5);">
										<b>${pt3.brand_name }&nbsp;&nbsp;</b>${pt3.product_name } <br>
										<fmt:formatNumber value="${pt3.price }" type="currency"
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
			</div>
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
				<div class="col-md-12">
					<h2>
						<span class="fa-search">CVS Search</span>
					</h2>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-12">
					<div class="btn-group" role="group">
						<button id="cvsAll" type="button" class="btn btn-default btn-lg"
							onclick="setStoreList(0);">전체</button>
						<button id="cvsGS" type="button" class="btn btn-info btn-lg"
							onclick="setStoreList(1);">GS25</button>
						<button id="cvsCU" type="button" class="btn btn-success btn-lg"
							onclick="setStoreList(2);">CU</button>
						<button id="cvs7E" type="button" class="btn btn-warning btn-lg"
							onclick="setStoreList(3);">7ELEVEN</button>
					</div>
				</div>
				<div class="col-md-6 col-md-offset-2 col-sm-6 col-xs-12">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">주소검색</span> <input
							id="address" type="text" class="form-control input-lg"
							placeholder="Search for..."> <span
							class="input-group-btn">
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
			<div id="map" style='height: 500px'>

				<br> <br>
			</div>
			<div class="col-md-12">
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
<script type="text/javascript">
	var map = new naver.maps.Map("map");
	var brand_no = 0;
	var markers = [];
	var infoWindows = [];
	var markerBuffer;
	var markerCurrent;
	var uMarkerBuffer;
	var uMarkerCurrent;

	function searchAddressToCoordinate(address) {
		naver.maps.Service.geocode({
			address : address
		}, function(status, response) {
			if (status === naver.maps.Service.Status.ERROR) {
				return alert('검색어가 올바르지 않습니다.');
			}
			var item = response.result.items[0], point = new naver.maps.Point(
					item.point.x, item.point.y);
			map.setCenter(point);
			onLoadStore(map, brand_no);
		});
	}

	function initGeocoder() {//이벤트등록
		map.setOptions({
			center : new naver.maps.LatLng(37.4990056, 127.0328696),
			scaleControl : true,
			logoControl : false,
			mapDataControl : false,
			zoomControl : false,
			minZoom : 12,
			maxZoom : 13,
			zoom : 12,
			mapTypeControl : false
		});

		$('#address').on('keydown', function(e) {
			var keyCode = e.which;

			if (keyCode === 13) { // Enter Key
				searchAddressToCoordinate($('#address').val());
			}
		});

		$('#submit').on('click', function(e) {
			e.preventDefault();

			searchAddressToCoordinate($('#address').val());
		});
		$('#init').on('click', function(e) {
			onLoadGeolocation();
			//map.setCenter(new naver.maps.LatLng(37.4990056, 127.0328696));
			setStoreList(brand_no);
		});
		naver.maps.Event.addListener(map, 'zoom_changed', function() {
			setStoreList(brand_no);
		});

		naver.maps.Event.addListener(map, 'dragend', function() {
			setStoreList(brand_no);
		});
	}

	function onNearestStore(map, brand_no) {
		this.markerBuffer = this.markerCurrent;
		this.uMarkerBuffer = this.uMarkerCurrent;
		var mapCenter = map.getCenter();
		var lat = mapCenter.lat();
		var lng = mapCenter.lng();
		var queryString = {
			"brand_no" : brand_no,
			"lat" : lat,
			"lng" : lng
		};
		//console.log(mapCenter);
		uMarkerCurrent = new naver.maps.Marker({
			map : map,
			position : mapCenter,
			title : '나의 위치',
			zIndex : 100,
			icon : {
				url : '/everycvs/resources/user/img/markers/marker_u.png',
				size : new naver.maps.Size(44, 44),
				origin : new naver.maps.Point(0, 0),
				anchor : new naver.maps.Point(22, 44)
			}
		});
		$
				.ajax({
					url : 'ajax/neareststore.do',
					data : queryString,
					dataType : "json",
					type : 'post',
					success : function(data) {
						var store = data.store;
						if (store.brand_no == 1) {
							markerCurrent = new naver.maps.Marker(
									{
										map : map,
										position : new naver.maps.LatLng(
												store.lat, store.lng),
										title : store.store_name,
										zIndex : 100,
										icon : {
											url : '/everycvs/resources/user/img/markers/marker_g.png',
											size : new naver.maps.Size(44, 44),
											origin : new naver.maps.Point(0, 0),
											anchor : new naver.maps.Point(22,
													44)
										}
									});
						} else if (store.brand_no == 2) {
							markerCurrent = new naver.maps.Marker(
									{
										map : map,
										position : new naver.maps.LatLng(
												store.lat, store.lng),
										title : store.store_name,
										zIndex : 100,
										icon : {
											url : '/everycvs/resources/user/img/markers/marker_c.png',
											size : new naver.maps.Size(44, 44),
											origin : new naver.maps.Point(0, 0),
											anchor : new naver.maps.Point(22,
													44)
										}
									});
						} else {
							markerCurrent = new naver.maps.Marker(
									{
										map : map,
										position : new naver.maps.LatLng(
												store.lat, store.lng),
										title : store.store_name,
										zIndex : 100,
										icon : {
											url : '/everycvs/resources/user/img/markers/marker_7.png',
											size : new naver.maps.Size(39, 41),
											origin : new naver.maps.Point(0, 0),
											anchor : new naver.maps.Point(19,
													41)
										}
									});
						}
						//console.log(markerCurrent);
						var contentString = [
								'<div style="padding:20px;">',
								'<h3><b>' + store.brand_name + '</b>&nbsp;'
										+ store.store_name + '</h3>',
								'<p>' + store.road_address + '<br><br>',
								'<a href="/everycvs/page/storemain.do?sno='
										+ store.store_no + '">지점 페이지로 이동</a>',
								'</p>', '</div>' ].join('');
						var infoWindow = new naver.maps.InfoWindow({
							anchorSkew : true,
							content : contentString
						});
						naver.maps.Event.addListener(markerCurrent, 'click',
								function() {
									if (infoWindow.getMap()) {
										infoWindow.close();
									} else {
										infoWindow.open(map, markerCurrent);
									}
								});
						infoWindow.open(map, markerCurrent);
						if (markerBuffer != null) {
							markerBuffer.setMap(null);
						}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
		if (uMarkerBuffer != null) {
			uMarkerBuffer.setMap(null);
		}
	}

	function onLoadStore(map, brand_no) {
		var mapBounds = map.getBounds();
		var minLat = mapBounds.minY();
		var maxLat = mapBounds.maxY();
		var minLng = mapBounds.minX();
		var maxLng = mapBounds.maxX();
		var queryString = {
			"brand_no" : brand_no,
			"minLat" : minLat,
			"maxLat" : maxLat,
			"minLng" : minLng,
			"maxLng" : maxLng
		};
		$
				.ajax({
					url : 'ajax/brandmap.do',
					data : queryString,
					type : 'post',
					dataType : "json",
					success : function(data) {
						var jsonStr = JSON.stringify(data);
						var json = JSON.parse(jsonStr);
						for ( var i in json.storelist) {
							var marker;
							var storelist = json.storelist[i];
							if (storelist.brand_no == 1) {
								marker = new naver.maps.Marker(
										{
											map : map,
											position : new naver.maps.LatLng(
													storelist.lat,
													storelist.lng),
											title : storelist.store_name,
											zIndex : 100,
											icon : {
												url : '/everycvs/resources/user/img/markers/marker_g.png',
												size : new naver.maps.Size(44,
														44),
												origin : new naver.maps.Point(
														0, 0),
												anchor : new naver.maps.Point(
														22, 44)
											}
										});
							} else if (storelist.brand_no == 2) {
								marker = new naver.maps.Marker(
										{
											map : map,
											position : new naver.maps.LatLng(
													storelist.lat,
													storelist.lng),
											title : storelist.store_name,
											zIndex : 100,
											icon : {
												url : '/everycvs/resources/user/img/markers/marker_c.png',
												size : new naver.maps.Size(44,
														44),
												origin : new naver.maps.Point(
														0, 0),
												anchor : new naver.maps.Point(
														22, 44)
											}
										});
							} else {
								marker = new naver.maps.Marker(
										{
											map : map,
											position : new naver.maps.LatLng(
													storelist.lat,
													storelist.lng),
											title : storelist.store_name,
											zIndex : 100,
											icon : {
												url : '/everycvs/resources/user/img/markers/marker_7.png',
												size : new naver.maps.Size(39,
														41),
												origin : new naver.maps.Point(
														0, 0),
												anchor : new naver.maps.Point(
														19, 41)
											}
										});
							}
							//console.log(marker);
							var contentString = [
									'<div style="padding:20px;">',
									'<h3><b>' + storelist.brand_name
											+ '</b>&nbsp;'
											+ storelist.store_name + '</h3>',
									'<p>' + storelist.road_address + '<br><br>',
									'<a href="/everycvs/page/storemain.do?sno='
											+ storelist.store_no
											+ '">지점 페이지로 이동</a>', '</p>',
									'</div>' ].join('');
							var infoWindow = new naver.maps.InfoWindow({
								anchorSkew : true,
								content : contentString
							});
							markers.push(marker);
							infoWindows.push(infoWindow);
						}
						for (var i = 0, ii = markers.length; i < ii; i++) {
							naver.maps.Event.addListener(markers[i], 'click',
									getClickHandler(i));
						}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
		onNearestStore(map, brand_no);
	}
	function getClickHandler(seq) {
		return function(e) {
			var marker = markers[seq], infoWindow = infoWindows[seq];

			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker);
			}
		}
	}

	function setStoreList(bno) {//이벤트 발생시 맵 속성을 초기화 하는 함수
		//console.clear();
		//console.log(markers);
		//현재 브랜드번호와 다르다면
		if (this.brand_no != bno) {
			this.brand_no = bno;
		}

		var mapBounds = this.map.getBounds();
		for (var i = 0, ii = this.markers.length; i < ii; i++) {
			this.markers[i].setMap(null);
		}
		this.markers = [];
		this.infoWindows = [];
		onLoadStore(map, bno);
	}

	function onSuccessGeolocation(position) {
		var location = new naver.maps.LatLng(position.coords.latitude,
				position.coords.longitude);

		map.setCenter(location);
		map.setZoom(12);
	}

	function onErrorGeolocation() {
		var center = map.getCenter();
		var infoWindow = new naver.maps.InfoWindow({
			anchorSkew : true
		});
		infowindow
				.setContent('<div style="padding:20px;">'
						+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
						+ "latitude: " + center.lat() + "<br />longitude: "
						+ center.lng() + '</div>');

		infowindow.open(map, center);
	}

	function onLoadGeolocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(onSuccessGeolocation,
					onErrorGeolocation);
		} else {
			var center = map.getCenter();

			infowindow
					.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'
							+ "latitude: "
							+ center.lat()
							+ "<br />longitude: "
							+ center.lng() + '</div>');
			infowindow.open(map, center);
		}

	}
	$(window).on("load", function() {
		initGeocoder();
		onLoadStore(map, 0);
	});
</script>

<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->