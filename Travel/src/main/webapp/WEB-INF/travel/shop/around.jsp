<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<style>
	input[type='text'] {
		width: 100%;
		height: 40px;
		border-radius: 5px;
		border: 1px solid #d1d1d1;
		padding-left: 20px;			
	}
	.title {
		text-align: left;
		font-size: 16px;
	}
	.cate-nav__list {
		display: flex;
	}
	.cate-nev__item {
		margin-right: 20px;
		font-weight: bold;
	}
	.search__item {
		padding: 20px;
	}
	.search-grid {
		display: grid;
		grid-template-columns: repeat(16, 1fr);
		column-gap: 10px;		
	}
	.search-grid__search {
		grid-column: 1 / 5;
	}
	.search-grid__result {
		grid-column: 5 / 17;
	}
	
	/* region */
	.region__name {
		font-weight: bold;
		font-size: 20px;
		text-align: center;
		color: #666666;
	}
	
	/* submit-btn */
	.search__submit {
		width: 100%;
		height: 40px;
		background: #ff6060;
		border-radius: 10px;
		border: none;
		color: white;
		font-weight: bold;	
	}
	
	/* calendar */
	.s-calendar__btn {
		width: 100%;
		height: 40px;
		border-radius: 10px;
		border: 1px solid #ff6060;	
	}
	.calendar {
		overflow: hidden;
	    height: 0px;
	    margin-top: 10px;
	    transition: all ease-in 0.3s;
	}
	.calendar.on {
		height: 270px;
	}
	
	/* count */
	.count__text {
		width: 50% !important;
	}
	.count__btn {
		width: 23%;
		height: 40px;
		border-radius: 5px;
		border: 1px solid #d1d1d1;
		background: #ff6060;
		color: white;
		font-weight: bold;
	}
	
	/* fac */
	.facility__list {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		row-gap: 10px;
	}
	
	/* result */
	.search-wrap__sort {
		padding: 20px;
		text-align: right;
	}
	.sort__link {
		font-size: 11px;
		margin-left: 20px;
		color: black;
	}
	.result__room {
		position: relative;
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		align-items: flex-end;
		padding: 20px;
		height: 250px;
		cursor: pointer;
		margin-bottom: 10px;
		transition: all .2s;
	}
	
	.result__room:hover {
		background-size: 120% 120%!important;
	}
	.result__room::before {
		content: '';
		opacity: 0.5;
		position: absolute;
		top: 0px;
		bottom: 0px;
		right: 0px;
		left: 0px;
		background-color: #000;
	}
	.room__info {
		color: white;
		font-weight: bold;
		font-size: 1.4em;
		z-index: 999;
	}
	
	/* modal */
	.map-modal {
		position: fixed;		
		width: 100vw;
		height: 100vh;
		left: 0px;
		top: 0px;
		z-index: 999;
		visibility: hidden;
	}
	.map-modal.on {
		visibility: visible;
	}
	.map-modal::before {
		content: '';
		position: absolute;
		width: 100vw;
		height: 100vh;
		left: 0px;
		top: 0px;
		background: black;
		opacity: .7;
	}
	#map {
		position: absolute;
		width: 700px;
		height: 500px;
		left: 50%;
		top: 50%;
		transform: translateX(-50%) translateY(-50%); 		
	}
</style>
<section class="section">
	<nav class="cate-nav">
		<ul class="cate-nav__list">
			<li class="cate-nev__item"><a href="${contextPath }/shop/around/1.shop">모텔</a></li>
			<li class="cate-nev__item"><a href="${contextPath }/shop/around/2.shop">호텔</a></li>
			<li class="cate-nev__item"><a href="${contextPath }/shop/around/3.shop">펜션</a></li>
		</ul>
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
							<h2 class="title count__title">인원</h2>
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
							<h2 class="title facility__title">공용시설</h2>
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
								<li><input type="radio" name="around" value="30" <c:if test="${searchBean.around eq '30'}">checked</c:if>>30Km</li>
								<li><input type="radio" name="around" value="40" <c:if test="${searchBean.around eq '40'}">checked</c:if>>40Km</li>
								<li><input type="radio" name="around" value="50" <c:if test="${searchBean.around eq '50'}">checked</c:if>>50Km</li>
								<li><input type="radio" name="around" value="60" <c:if test="${searchBean.around eq '60'}">checked</c:if>>60Km</li>
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
				<a onclick="showMap()">지도</a>
			</div>
			<div class="result__rooms">
				<c:if test="${empty sLists }">
					<h2>찾으시는 정보가 존재하지 않습니다.</h2>
				</c:if>
				<c:if test="${!empty sLists }">
					<c:forEach var="search" items="${sLists }">
						<div class="result__room" style="background: center/100% 100% no-repeat url('${contextPath}/resources/images/${search.image }');" onclick='location.href="${contextPath }/shop/detail.shop?anum=${search.anum }&start=${start }&end=${end }"'>
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
	function showMap() {
		const modal = document.querySelector('.map-modal');
		map-modal.classList.toggle('on');
	}

	// 인원수
	function calccount(number) {
		const count__text = document.querySelector('.count__text');
		if(Number(count__text.value) + Number(number) < 1) {
			return;
		}
		count__text.value = Number(count__text.value) + Number(number);
	}

	var container = document.getElementById('map'),
	map = new kakao.maps.Map(container, { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
	    level : 3 // 지도의 확대 레벨 
	});
	
	var geocoder = new kakao.maps.services.Geocoder();
	
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
</script>
<script src="${contextPath }/resources/js/shop/shop.js"></script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>