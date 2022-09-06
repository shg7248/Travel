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
    
    var positions = [
        {
            content: '<div>카카오</div>', 
            latlng: new kakao.maps.LatLng(33.450705, 126.570677)
        },
        {
            content: '<div>생태연못</div>', 
            latlng: new kakao.maps.LatLng(33.450936, 126.569477)
        },
        {
            content: '<div>텃밭</div>', 
            latlng: new kakao.maps.LatLng(33.450879, 126.569940)
        },
        {
            content: '<div>근린공원</div>',
            latlng: new kakao.maps.LatLng(33.451393, 126.570738)
        }
    ];
    
    
    

/* 	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); */

	
	/* 
		위도 1도당 111.19492664455873km
		
		1km = 0.008993216059187306도
		
		https://www.sqler.com/board_SQLQA/546533
		https://shiningknowledge.tistory.com/135
		https://pnot.tistory.com/8
	*/
</script>
</html>



