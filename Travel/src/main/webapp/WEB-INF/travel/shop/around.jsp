<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<link rel="stylesheet" href="${contextPath }/resources/css/search2.css">
<section class="section">
	<nav class="cate-nav">
		<ul class="cate-nav__list">
			<c:forEach var="item" items="${cLists }">
				<li class="cate-nev__item"><a href="${contextPath }${item.url }">${item.caname }</a></li>
			</c:forEach>
		</ul>
		<a onclick="showMap()" style="position: absolute; right: 0; top: 0;"><img src="${contextPath }/resources/images/map.png"></a>
	</nav>
	<hr>
	<div class="search-grid">
		<article class="search-grid__search">
			<form method="post" name="searchForm">
				<input type="hidden" name="start" value="${start }"> 			<!-- 시작일 -->
				<input type="hidden" name="end" value="${end }"> 				<!-- 마지막일 -->
				<input type="hidden" name="sort" value="${searchBean.sort }"> 	<!-- 정렬 -->
				<div class="search">
					<div class="search__item search__region">
						<div class="region">
							<h2 class="title region__title">중심지역</h2>
							<p class="region__name"></p>
						</div>
					</div>
					<div class="search__item search__submit-wrap">
						<input class="search__submit" type="submit" value="검색" />
					</div>
					<div class="search__item search__s-calendar">
						<div class="s-calendar">
							<fmt:parseDate var="parsedStartDate" value="${start }" pattern="yyyyMMdd"/>
							<fmt:formatDate var="startDate" value="${parsedStartDate }" pattern="MM월 dd일"/>
							<fmt:parseDate var="parsedEndDate" value="${end }" pattern="yyyyMMdd"/>
							<fmt:formatDate var="endDate" value="${parsedEndDate }" pattern="MM월 dd일"/>
							
							<h2 class="title s-calendar__title">기간 선택</h2>
							<input class="s-calendar__btn" type="button" value="${startDate } ~ ${endDate }" onclick="displayCal()"/>
							<div class="calendar"></div>
						</div>
					</div>
					<div class="search__item search__price">
						<div class="price">
							<h2 class="title region__title">최대가격</h2>
							<input class="price__text" type="text" name="price" value="${searchBean.price }"/>
						</div>
					</div>
					<div class="search__item search__count">
						<div class="count">
							<h2 class="title count__title">최대인원</h2>
							<input class="count__btn count__btn--minus" type="button" value="-" onclick="calccount(-1)">
							<input class="count__text" type="text" name="count" value="${searchBean.count }" readonly="readonly"/>
							<input class="count__btn count__btn--plus" type="button" value="+" onclick="calccount(1)">
						</div>
					</div>
					<div class="search__item search__facility">
						<div class="facility">
							<h2 class="title facility__title">공용시설</h2>
							<div class="facility__list">
								<c:forEach var="fac" items="${facLists }">
									<c:if test="${fac.fgroup eq 'F1' }">
										<div>
											<input class="facility__item" type="checkbox" name="fac" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>&nbsp;${fac.name }
										</div>
									</c:if>
								</c:forEach>
							</div>							
						</div>
					</div>
					<div class="search__item search__facility">
						<div class="facility">
							<h2 class="title facility__title">객실 내 시설</h2>
							<div class="facility__list">
							<c:forEach var="fac" items="${facLists }">
								<c:if test="${fac.fgroup eq 'F2' }">
									<div>
										<input class="facility__item" type="checkbox" name="fac" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>&nbsp;${fac.name }
									</div>
								</c:if>
							</c:forEach>	
							</div>						
						</div>
					</div>
					<div class="search__item search__around">
						<div class="around">
							<h2 class="title around__title">범위</h2>
							<ul>
								<li><input class="around__radio" type="radio" name="around" value="30" <c:if test="${searchBean.around eq '30'}">checked</c:if>>30Km</li>
								<li><input class="around__radio" type="radio" name="around" value="40" <c:if test="${searchBean.around eq '40'}">checked</c:if>>40Km</li>
								<li><input class="around__radio" type="radio" name="around" value="50" <c:if test="${searchBean.around eq '50'}">checked</c:if>>50Km</li>
								<li><input class="around__radio" type="radio" name="around" value="60" <c:if test="${searchBean.around eq '60'}">checked</c:if>>60Km</li>
							</ul>
						</div>
					</div>
				</div>
			</form>
		</article>
		<article class="search-grid__result">
			<div class="search-wrap__sort">
				<a class="sort__link sort__link--hit" href="javascript:sort('HIT')">별점 높은순</a>
				<a class="sort__link sort__link--heghPrice" href="javascript:sort('HIGHPRICE')" class="order">가격 높은순</a>
				<a class="sort__link sort__link--lowPrice" href="javascript:sort('LOWPRICE')">가격 낮은순</a>
			</div>
			<div class="result__rooms">
				<c:if test="${empty sLists }">
					<h2 align="center">찾으시는 정보가 존재하지 않습니다.</h2>
				</c:if>
				<c:if test="${!empty sLists }">
					<c:forEach var="search" items="${sLists }">
						<div class="result__room" style="background: center/100% 100% no-repeat url('${contextPath}/resources/images/accom/${search.image }');" onclick='location.href="${contextPath }/shop/detail.shop?anum=${search.anum }&start=${start }&end=${end }"'>
							<span class="room__info room__info--average">★&nbsp;${search.average }</span>
							<span class="room__info room__info--name">${search.name }</span>
							<span class="room__info room__info--region">${search.region }</span>
							<span class="room__info room__info--price"><fmt:formatNumber value="${search.price }" />원</span>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</article>
	</div>
	
</section>
<div class="map-modal">
	<div id="map"></div>
</div>
<script>
	// 모달
	const modal = document.querySelector('.map-modal');
	function showMap() {
		modal.classList.toggle('on');
	}
	modal.addEventListener('click', function(e) {
		if(e.target == modal) modal.classList.toggle('on');
	});
	
	
	// 카카오맵
	(function() {
		
		const container = document.getElementById('map'),
		map = new kakao.maps.Map(container, { // 지도를 표시할 div
		    center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
		    level : 8 // 지도의 확대 레벨 
		});
		
		// 카카오맵 주소 좌표 변환 툴
		const geocoder = new kakao.maps.services.Geocoder();
		
		// 카카오맵 범위 재설정
		const bounds = new kakao.maps.LatLngBounds();
		
		const mapinfo = [];
		
		mapinfo.push({
			name: "내위치",
			lat: cookieManager.get('lat'),
			lng: cookieManager.get('lng'),
			imageSrc: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', 
			imageSize: new kakao.maps.Size(24, 35),
			imageOption: {offset: new kakao.maps.Point(12, 69)},
		})
		
		map.setCenter(new kakao.maps.LatLng(cookieManager.get('lat'), cookieManager.get('lng')));
		
		<c:forEach var="search" items="${sLists }" varStatus="s">
			mapinfo.push({
				name: "${search.name }",
				lat: "${search.lat }",
				lng: "${search.lng}",
				imageSrc: 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png',
				imageSize: new kakao.maps.Size(24, 35),
				imageOption: {offset: new kakao.maps.Point(12, 69)}
			});
		</c:forEach>
		
		for(let i = 0; i < mapinfo.length; i++) {
			
			const position = new kakao.maps.LatLng(mapinfo[i].lat, mapinfo[i].lng);
			const markerImage = new kakao.maps.MarkerImage(mapinfo[i].imageSrc, mapinfo[i].imageSize, mapinfo[i].imageOption)
			
			const marker = new kakao.maps.Marker({
				map: map,
				position: position,
				image: markerImage,
			});
			
			const infowindow = new kakao.maps.InfoWindow({
		        content: mapinfo[i].name 
		    });
			
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			
		 	// LatLngBounds 객체에 좌표를 추가합니다
			/* bounds.extend(position); */
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
	
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		/* map.setBounds(bounds); */
		
		searchDetailAddrFromCoords(function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				const region = document.querySelector('.region__name');
				region.append( result[0].address.address_name.match(/[^\s]+\s[^\s]+/)[0]);
			}
		});
		
		function searchDetailAddrFromCoords(callback) {
		    latLng((lat, lng)=> {
			    geocoder.coord2Address(lng, lat, callback);
		    });
		}
	}());

</script>
<script src="${contextPath }/resources/js/shop/shop.js"></script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>