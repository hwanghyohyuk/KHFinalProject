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
					<h2>
						<span class="fa-gift">Event</span>
					</h2>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 text-right">
					<a href="/everycvs/eventList.do">more</a>
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
				<a href="splist.do">지점상품</a><br> <a href="cvsstorelist.do">지점1</a><br>
				<a href="selectServiceList.do">고객센터1</a><br> <a
					href="insertService.do">고객센터2</a><br> <a
					href="cvsproductlist.do">편의점상품1</a><br> <a
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
				<div class="col-md-4">
					<div class="btn-group" role="group">
						<button id="cvsAll" type="button" class="btn btn-default"
							onclick="onLoadStore(map,0)">전체</button>
						<button id="cvsGS" type="button" class="btn btn-info"
							onclick="onLoadStore(map,1)">GS25</button>
						<button id="cvsCU" type="button" class="btn btn-success"
							onclick="onLoadStore(map,2)">CU</button>
						<button id="cvs7E" type="button" class="btn btn-warning"
							onclick="onLoadStore(map,3)">7ELEVEN</button>
					</div>
				</div>
				<div class="col-md-4 col-md-offset-4 ">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">주소검색</span> <input
							id="address" type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
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
				<script type="text/javascript">
					var map = new naver.maps.Map("map");
					var brand_no=0;
					var markers = [];
					var infoWindows =[];

					map.setCursor('pointer');
					function searchAddressToCoordinate(address) {
						naver.maps.Service
								.geocode(
										{
											address : address
										},
										function(status, response) {
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
						});
						naver.maps.Event.addListener(map, 'zoom_changed',
								function() {
									// updateMarkers(map, markers);
									onLoadStore(map, brand_no);
								});

						naver.maps.Event.addListener(map, 'dragend',
								function() {
									//  updateMarkers(map, markers);
									onLoadStore(map, brand_no);
								});
					}

					function getClickHandler(seq) {
					    return function(e) {
					        var marker = markers[seq],
					            infoWindow = infoWindows[seq];

					        if (infoWindow.getMap()) {
					            infoWindow.close();
					        } else {
					            infoWindow.open(map, marker);
					        }
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
						$.ajax({
							url : 'ajax/brandmap.do',
							data : queryString,
							type : 'post',
							dataType : "json",
							success : function(data) {
								var jsonStr = JSON.stringify(data);
								var json = JSON.parse(jsonStr);
								var stores = "";
								for (var i in json.storelist) {
									stores += json.storelist[i] + "\n";
								var marker;
								
								if(json.storelist[i].brand_no == 1){
								marker = new naver.maps.Marker({
							        map: map,
							        position: new naver.maps.LatLng(json.storelist[i].lat,json.storelist[i].lng),
							        title: json.storelist[i].store_name,
							        zIndex: 100,
							        icon: {
							        	url:'/everycvs/resources/user/img/markers/marker_g.png',
							        	size: new naver.maps.Size(44, 44),
										origin: new naver.maps.Point(0, 0),
										anchor: new naver.maps.Point(22, 44)
							        }});
								}else if(json.storelist[i].brand_no == 2){
									marker = new naver.maps.Marker({
							        map: map,
							        position: new naver.maps.LatLng(json.storelist[i].lat,json.storelist[i].lng),
							        title: json.storelist[i].store_name,
							        zIndex: 100,
							        icon: {
							        	url:'/everycvs/resources/user/img/markers/marker_c.png',
						        		 size: new naver.maps.Size(44, 44),
								            origin: new naver.maps.Point(0, 0),
								            anchor: new naver.maps.Point(22, 44)
							        }});
								}else{
									marker = new naver.maps.Marker({
								        map: map,
								        position: new naver.maps.LatLng(json.storelist[i].lat,json.storelist[i].lng),
								        title: json.storelist[i].store_name,
								        zIndex: 100,
								        icon: {
								        	url:'/everycvs/resources/user/img/markers/marker_7.png',
							        		 size: new naver.maps.Size(39, 41),
									            origin: new naver.maps.Point(0, 0),
									            anchor: new naver.maps.Point(19, 41)
									}});
								}
								 console.log(marker);
						var contentString = [
					        '<div style="padding:10px auto">',
					        '<h3><b>'+json.storelist[i].brand_name+'</b>'+json.storelist[i].store_name+'</h3>',
					        '<p>'+json.storelist[i].road_address+'<br><br>',
					        '<a href="/everycvs/page/storemain.do?sno='+json.storelist[i].store_no+'">지점 페이지로 이동</a>',
					        '</p>',
					        '</div>'
					    ].join('');
					    var infoWindow = new naver.maps.InfoWindow({
							anchorSkew : true,
							content : contentString
						});
					    naver.maps.Event.addListener(marker, "click", function(e) {
						    if (infoWindow.getMap()) {
						    	infoWindow.close();
						    } else {
						    	infoWindow.open(map, marker);
						    }
						});
					    
					    markers.push(marker);
					    infoWindows.push(infoWindow);
					    
							}		
								for (var i=0, ii=markers.length; i<ii; i++) {
								    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
								}
								},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);
							}
						});

					}
					

					

					function onSuccessGeolocation(position) {
						var location = new naver.maps.LatLng(
								position.coords.latitude,
								position.coords.longitude);

						var mapBounds = map.getBounds();
						 var infoWindow = new naver.maps.InfoWindow({
								anchorSkew : true
							});
						infoWindow
								.setContent('<div style="padding:20px;">'
										+ '<h5 style="margin-bottom:5px;color:#f00;">현재 보는 화면의 각 꼭지점의 좌표</h5>'
										+ '<br />현재위치 : ' + location
										+ '<br />NW : ' + mapBounds.maxY()
										+ ',' + mapBounds.minX()
										+ '<br />NE : ' + mapBounds.maxY()
										+ ',' + mapBounds.maxX()
										+ '<br />SW : ' + mapBounds.minY()
										+ ',' + mapBounds.minX()
										+ '<br />SE : ' + mapBounds.minY()
										+ ',' + mapBounds.maxX() + '</div>');

						map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
						map.setZoom(12); // 지도의 줌 레벨을 변경합니다.
						infoWindow.open(map, location);
					}

					function onErrorGeolocation() {
						var center = map.getCenter();
						 var infoWindow = new naver.maps.InfoWindow({
								anchorSkew : true
							});
						infoWindow.setContent('<div style="padding:20px;">'
										+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
										+ "latitude: " + center.lat()
										+ "<br />longitude: " + center.lng()
										+ '</div>');

						infoWindow.open(map, center);
					}

					function onLoadGeolocation() {
						if (navigator.geolocation) {
							navigator.geolocation.getCurrentPosition(
									onSuccessGeolocation, onErrorGeolocation);
						} else {
							var center = map.getCenter();

							infoWindow
									.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'
											+ "latitude: "
											+ center.lat()
											+ "<br />longitude: "
											+ center.lng() + '</div>');
							infoWindow.open(map, center);
						}

					}
					$(window).on("load", function() {
						initGeocoder();
						onLoadStore(map, 0);
						//onLoadGeolocation();					
					});
				</script>
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