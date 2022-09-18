(function() {
	
	navigator.geolocation.getCurrentPosition(geoSucess, geoError);
	
	function geoSucess(position) {
		
		const cookie = document.cookie;
		
		const lat = position.coords.latitude;
		
		const lng = position.coords.longitude;
		
		console.log(lat, lng);
	}
	
	function geoError() {
		alert('주변검색을 사용하기 위해서는 위치 액세스를 허용하셔야 합니다.');
	}
	
	
}());