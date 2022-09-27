var container = document.getElementById('map'),
map = new kakao.maps.Map(container, { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
    level : 3 // 지도의 확대 레벨 
});

const markers = [];

 map.setDraggable(false);
 map.setZoomable(false);
 
 let moveLatLon = new kakao.maps.LatLng('${ab.latitude }', '${ab.longitude }');
 map.setCenter(moveLatLon);
 addMarker(moveLatLon);

container.style.width = '100%';
container.style.height = '200px';
map.relayout();

var geocoder = new kakao.maps.services.Geocoder();
map.setCenter(moveLatLon);


// 수정에선 분리
//
function findAddress() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        let promise = Promise.resolve(data);
	        promise.then((data) => {
	        	
	        	accomForm.zip.value = data.zonecode;
	        	accomForm.sido.value = data.sido;
	        	accomForm.sigungu.value = data.sigungu;
	        	accomForm.etcAddr.value = data.roadAddress.substr(data.sido.concat(data.sigungu).length + 2);
	        	accomForm.rcode.value = data.bcode;
	        	
	        	geocoder.addressSearch(data.address, (result, status) => {
	        		
	        		let promise = Promise.resolve(result);
	        		promise.then((data3) => {
	        			
	        			accomForm.latitude.value = data3[0].y;
	        			accomForm.longitude.value = data3[0].x;
	        			
	        			let moveLatLon = new kakao.maps.LatLng(data3[0].y, data3[0].x);
	        			
	        			map.setCenter(moveLatLon);
	        			addMarker(moveLatLon);
	        		});
	        	});
	        })
	    }
	}).open();
}

function addMarker(position) {
	
	var marker = new kakao.maps.Marker({
		position: position
	});
	
	if(markers.length === 1) 
		markers.pop().setMap(null);
		
	markers.push(marker);
	marker.setMap(map);
}