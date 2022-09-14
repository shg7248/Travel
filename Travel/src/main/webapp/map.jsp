<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7aa66b36bac14d52a5dbbdb09a9f4b5a&libraries=services,clusterer,drawing"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<input type="button" value="해당 경로로 이동" onclick="setCenter()">
</body>
<script>

	// 지도 생성
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
        level : 3 // 지도의 확대 레벨 
    });
    
    // 마크
    // var markerPosition  = new kakao.maps.LatLng(37.556490249006615, 126.94520635682696); 

    // 마커를 담을 배열
    var markers = [];
    
 	// 마커를 생성
/* 	var marker = new kakao.maps.Marker({
	    position: markerPosition
	}); */
 	
 	// 장소 검색 객체
	var ps = new kakao.maps.services.Places(); 
 	ps.keywordSearch("서울특별시 마포구 대흥동 12-20", (data, status, pagination) => {
 		console.log(status);
 		console.log(data[0].y);
 		console.log(data[0].x);
 	});
	
	// 마커가 지도 위에 표시되도록 설정
	// marker.setMap(map);
	
/* 	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	  	addMarker(mouseEvent.latLng);
		
		// 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
 
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    

	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    console.log(message);
	}); */
	
	function addMarker(position) {
		
		console.log(position.getLat() + "/" + position.getLng());
		
		var marker = new kakao.maps.Marker({
			position: position
		});
		
		marker.setMap(map);
		
		// markers.push(marker);
	}
	
	function setCenter() {
		var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
		map.setCenter(moveLatLon);
	}

	
/* 
		위도 1도당 111.19492664455873km
		
		1km = 0.008993216059187306도
		
		https://www.sqler.com/board_SQLQA/546533
		https://shiningknowledge.tistory.com/135
		https://pnot.tistory.com/8
		
		CREATE OR REPLACE FUNCTION RADIANS(VNUM VARCHAR2)
		RETURN VARCHAR2
		AS
		  RENUM VARCHAR2(50);
		BEGIN
		SELECT ASIN(1) * 2 / 180 * VNUM INTO RENUM FROM DUAL;
		RETURN RENUM;
		END;
		
		SELECT *,
		(6371*ACOS(COS(RADIANS('대상 위도값'))
	    	*COS(RADIANS('위도 컬럼'))
	        *COS(radians('경도 컬럼')-RADIANS('대상 경도값'))
	        +SIN(RADIANS('대상 위도값'))*SIN(RADIANS('위도 컬럼'))))
		AS DISTANCE
		FROM DUAL;
 */
 
	new daum.Postcode({
	    oncomplete: function(data) {
	        const p = Promise.resolve(data);
	        p.then((data) => {
	        	var ps = new kakao.maps.services.Places();
	        	ps.keywordSearch(data.address, (data, status, pagination) => {
	         		var moveLatLon = new kakao.maps.LatLng(data[0].y, data[0].x);
	         		map.setCenter(moveLatLon);
	         		
	         		const position = new kakao.maps.LatLng(data[0].y, data[0].x);
	         		addMarker(position)
	         	});
	        });
	    }
	}).open();
</script>
</html>



