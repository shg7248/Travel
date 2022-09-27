<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/search.css">
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<section class="section">
	<div class="search-wrap">
		<article class="article search-wrap__options">
			<form method="post" name="searchForm">
				<input type="hidden" name="start" value="${start }"> <!-- 시작일 -->
				<input type="hidden" name="end" value="${end }"> <!-- 마지막일 -->
				<input type="hidden" name="sort" value="${searchBean.sort }"> <!-- 정렬 -->
				<div class="search-wrap__region">
					<div class="region">
						<p class="region__title">지역</p> 
						<select class="region__list region__list--sido" name="sido" onchange="changeSido(1)">
							<option class="region__item" value="0">전지역</option>
							<c:forEach var="resion" items="${rLists }">
								<option class="region__item" value="${resion.rcode }">${resion.sido }</option>
							</c:forEach>
						</select>
						<select class="region__list region__list--sigungu" name="sigungu" onchange="addrDeps2Changed()">
							<option class="region__item" value="">전체</option>
						</select>
					</div>
				</div>
				<div class="search-wrap__submit">
					<input class="search-wrap__btn" type="submit" value="검색" />
				</div>
				<div class="search-wrap__calendar">
					
					<fmt:parseDate var="parsedStartDate" value="${start }" pattern="yyyyMMdd"/>
					<fmt:formatDate var="startDate" value="${parsedStartDate }" pattern="MM월 dd일"/>
					
					<fmt:parseDate var="parsedEndDate" value="${end }" pattern="yyyyMMdd"/>
					<fmt:formatDate var="endDate" value="${parsedEndDate }" pattern="MM월 dd일"/>					
					<p class="calendar__title title">기간 선택</p>
					<input class="calendar__show-btn" type="button" value="${startDate } ~ ${endDate }" onclick="displayCal()"/>
					<div class="calendar"></div>
				</div>
				<div class="search-wrap__price">
					<p class="price__title title">가격</p> 
					<input class="price__text" type="text" name="price" value="${searchBean.price }"/>
				</div>
				<div class="search-wrap__count">
					<p class="count__title title">인원</p>
					<input class="count__text" type="text" name="count" value="${searchBean.count }"/>
				</div>
				<div class="search-wrap__fac">
					<p class="fac__title title">공용시설</p>
					<div class="fac__select-wrap">
						<c:forEach var="fac" items="${facLists }">
							<c:if test="${fac.fgroup eq 'F1' }">
								<div>
									<input type="checkbox" name="fac" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>&nbsp;${fac.name }
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="search-wrap__fac">
					<p class="fac__title title">객실 내 시설</p>
					<div class="fac__select-wrap">
						<c:forEach var="fac" items="${facLists }">
							<c:if test="${fac.fgroup eq 'F2' }">
								<div>
									<input type="checkbox" name="fac" value="${fac.fnum }" <c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>&nbsp;${fac.name }
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</form>
		</article>
		<article class="article search-wrap__result">
			<div class="search-wrap__sort">
				<a class="sort__link sort__link--hit" href="javascript:sort('HIT')">별점 높은순</a>
				<a class="sort__link sort__link--heghPrice" href="javascript:sort('HIGHPRICE')" class="order">가격 높은순</a>
				<a class="sort__link sort__link--lowPrice" href="javascript:sort('LOWPRICE')">가격 낮은순</a>
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
<script src="${contextPath }/resources/js/shop/shop.js"></script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>