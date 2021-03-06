/*메인화면 지도 자바스크립트*/
	var map = new naver.maps.Map("map",{minZoom : 12,
		maxZoom : 12,
		zoom : 12});
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
			center : new naver.maps.LatLng(37.4990055, 127.0328696),
			scaleControl : true,
			logoControl : false,
			mapDataControl : false,
			zoomControl : false,
			minZoom : 12,
			maxZoom : 12,
			zoom : 12,
			mapTypeControl : false
		});
		setTabNo(1);
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
			setStoreList(brand_no);
		});
		naver.maps.Event.addListener(map, 'dragend', function() {
			setStoreList(brand_no);
		});
	}
	//지점번호
	var storeNo;
	//지점번호 setter
	function setStoreNo(storeNo){
		this.storeNo = storeNo;
	}
	//지점번호 getter
	function getStoreNo(){
		return this.storeNo;
	}
	//탭 번호
	var tabNo=1;
	//탭 번호 setter
	function setTabNo(tabNo){
		this.tabNo = tabNo;
	}
	//탭 번호 getter
	function getTabNo(){
		return this.tabNo;
	}
	function selectAjax(tabNo){
		setTabNo(tabNo);
		var storeNo=getStoreNo();
		if(tabNo==1||tabNo==2){
			storeProductInfo(storeNo,tabNo);
		}else if(tabNo==3){
			userFavoriteList(storeNo);
		}
	}
	//편의점 상품정보가져오기
	function storeProductInfo(storeNo,tabNo){
		$.ajax({
			url:'/everycvs/ajax/storeproductinfo.do',
			data:{"storeNo":storeNo,"tabNo":tabNo},
			type:'post',
			beforeSend:function(){
				if(tabNo==1){
					$('#viewLoading1').fadeOut(500);
				}else if(tabNo==2){
					$('#viewLoading2').fadeOut(500);
				}
			},
			success:function(data){
				if(data.length>0){
				var values='';
				for(var i in data){
					values+='<div class="col-lg-2 col-md-2 col-sm-4 col-lg-6 text-center">'
						+'<p><img src="/everycvs/resources/upload/'+data[i].stored_file_name+'" alt="No_Image" align="left"	style="margin-left: 5px;"><br>'
						+data[i].product_name+'</p></div>';
				}
				if(tabNo==1){
					$('#todays').html(values);
				}else if(tabNo==2){
					$('#expiration').html(values);
				}
				}else{
					var values='<b>등록된 상품이 없습니다.</b>';
					if(tabNo==1){
						$('#todays').html(values);
					}else if(tabNo==2){
						$('#expiration').html(values);
					}
				}
			},
			complete:function(){
				if(tabNo==1){
					$('#viewLoading1').fadeOut(500);
				}else if(tabNo==2){
					$('#viewLoading2').fadeOut(500);
				}
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	//관심상품가져오기
	function userFavoriteList(storeNo){
		$.ajax({
			url:'/everycvs/ajax/userfavoritelist.do',
			data:{"storeNo":storeNo},
			type:'post',
			async:false,
			beforeSend:function(){
				$('#viewLoading3').fadeIn(500);
			},
			success:function(data){
				if(data.length>0){
				var values='';
				for(var i in data){
					values+='<div class="col-lg-2 col-md-2 col-sm-4 col-lg-6 text-center">'
						+'<p><img src="/everycvs/resources/upload/'+data[i].stored_file_name+'" alt="No_Image" align="left"	style="margin-left: 5px;"><br>'
						+data[i].product_name+'</p></div>';
				}
				$('#favorite').html(values);
				}else{
					var values='<b>관심목록 등록된 상품이 현재 없습니다.</b>';
					$('#favorite').html(values);
				}
			},
			complete:function(){
				$('#viewLoading3').fadeOut(500);
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	
	//가장 가까운 편의점 찾기
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
		$.ajax({
					url : 'ajax/neareststore.do',
					data : queryString,
					type : 'post',
					async:false,
					success : function(data) {
						var store = data.store;
						setStoreNo(store.store_no);
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
						infoWindow.open(map, markerCurrent);
						naver.maps.Event.addListener(markerCurrent, 'click',
								function() {
									if (infoWindow.getMap()) {
										infoWindow.close();
									} else {
										infoWindow.open(map, markerCurrent);
									}
								});
						
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
		$.ajax({
					url : 'ajax/brandmap.do',
					data : queryString,
					async:false,
					type : 'post',
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
									getClickHandler(i,storelist.store_no));
						}
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
	}
	function getClickHandler(seq,store_no) {
		return function(e) {
			var marker = markers[seq], infoWindow = infoWindows[seq];

			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker);
				setStoreNo(store_no);
				selectAjax(getTabNo());
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
		onNearestStore(map, bno);
		selectAjax(getTabNo());
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
		setStoreList(brand_no);
	});