<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7aa66b36bac14d52a5dbbdb09a9f4b5a&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
</body>
<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 5 // 지도의 확대 레벨 
    });
    
    var markerPosition  = new kakao.maps.LatLng(36.2683, 127.6358); 

    var markers = [];
    
 	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	  	addMarker(mouseEvent.latLng);
		
/* 		// 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
 
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    

	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    console.log(message); */
	});
	
	function addMarker(position) {
		
		console.log(position.getLat() + "/" + position.getLng());
		
		var marker = new kakao.maps.Marker({
			position: position
		});
		
		marker.setMap(map);
		
		markers.push(marker);
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
</script>
</html>



