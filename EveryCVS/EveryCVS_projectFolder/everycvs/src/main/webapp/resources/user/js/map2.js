/*메인화면 지도 자바스크립트*/
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
				return swal('검색어 오류','검색어가 올바르지 않습니다.','error');
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