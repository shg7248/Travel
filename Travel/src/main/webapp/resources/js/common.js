const cookieManager = (function() {
	let 	defaults = {
				expires: 1
			};

	function dateToMillisec(plusDate) {
		return 1000 * 60 * 60 * 24 * plusDate;
	}
	
	function plusDate(plusDate) {
        const now = new Date();
		now.setTime(now.getTime() + dateToMillisec(plusDate));
        return now;
	}
	
	function setCookie(optionArray) {
		
		optionArray.map((elem)=> {
			document.cookie = elem.key + '=' + elem.value + "; path=/; expires=" + plusDate(elem.expires).toUTCString();	
		});
	}
	
	function getCookieValue(key) {
		return document.cookie.match(key + '=([^;]*)')[1];
	}
	
	return {
        set: setCookie,
        get: getCookieValue
    }
}());

(function() {

	navigator.geolocation.getCurrentPosition(geoSucess, geoError, { enableHighAccuracy: true, maximumAge: 30000, timeout: 27000 });
	
	function geoSucess(position) {
		
		const lat = position.coords.latitude;
		
		const lng = position.coords.longitude;
		
		cookieManager.set([
			{key: 'lat', value: lat, expires: 999},
			{key: 'lng', value: lng, expires: 999},
		])
	}
	
	function geoError() {
		console.log('주변검색을 사용하기 위해서는 위치 액세스를 허용하셔야 합니다.');
	}
}());