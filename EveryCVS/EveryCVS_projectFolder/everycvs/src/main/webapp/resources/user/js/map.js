var map = new naver.maps.Map("map");

var infoWindow = new naver.maps.InfoWindow({
	anchorSkew : true
});

map.setCursor('pointer');

// search by tm128 coordinate
function searchCoordinateToAddress(latlng) {
	var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

	infoWindow.close();

	naver.maps.Service.reverseGeocode({
		location : tm128,
		coordType : naver.maps.Service.CoordType.TM128
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('검색어가 올바르지 않습니다.');
		}

		var items = response.result.items, htmlAddresses = [];

		for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
			item = items[i];
			addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

			htmlAddresses.push((i + 1) + '. ' + addrType + ' ' + item.address);
			htmlAddresses.push('&nbsp&nbsp&nbsp -> ' + item.point.x + ','
					+ item.point.y);
		}

		infoWindow.setContent([
				'<div style="padding:10px;min-width:200px;line-height:150%;">',
				'<h4 style="margin-top:5px;">검색 좌표 : '
						+ response.result.userquery + '</h4><br />',
				htmlAddresses.join('<br />'), '</div>' ].join('\n'));

		infoWindow.open(map, latlng);
	});
}

// result by latlng coordinate
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

						var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
								: '[지번 주소]', point = new naver.maps.Point(
								item.point.x, item.point.y);

						infoWindow
								.setContent([
										'<div style="padding:10px;min-width:200px;line-height:150%;">',
										'<h4 style="margin-top:5px;">검색 주소 : '
												+ response.result.userquery
												+ '</h4><br />',
										addrType + ' ' + item.address
												+ '<br />',
										'&nbsp&nbsp&nbsp -> ' + point.x + ','
												+ point.y, '</div>' ]
										.join('\n'));

						map.setCenter(point);
						infoWindow.open(map, point);
					});
}

function initGeocoder() {
	map.setOptions({
		scaleControl : true,
		logoControl : false,
		mapDataControl : false,
		zoomControl : false,
		minZoom : 11,
		maxZoom: 12,
		zoom : 12,
		mapTypeControl : false
	});
	map.addListener('click', function(e) {
		searchCoordinateToAddress(e.coord);
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

}

function onSuccessGeolocation(position) {
	var location = new naver.maps.LatLng(position.coords.latitude,
			position.coords.longitude);

	map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
	map.setZoom(12); // 지도의 줌 레벨을 변경합니다.

	infoWindow.setContent('<div style="padding:20px;">' + 'latitude: '
			+ location.lat() + '<br />' + 'longitude: ' + location.lng()
			+ '</div>');

	infoWindow.open(map, location);
}

function onErrorGeolocation() {
	var center = map.getCenter();

	infoWindow
			.setContent('<div style="padding:20px;">'
					+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
					+ "latitude: " + center.lat() + "<br />longitude: "
					+ center.lng() + '</div>');

	infoWindow.open(map, center);
}

function onLoadGeolocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(onSuccessGeolocation,
				onErrorGeolocation);
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
	onLoadGeolocation();
	initGeocoder();
});