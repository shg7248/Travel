<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<style>
	.search-wrap {
		display: grid;
		grid-template-columns: repeat(16, 1fr);
		column-gap: 10px;
	}
	
	.search-wrap__options {
		grid-column: 1 / 5;
	}
	
	.search-wrap__result {
		grid-column: 5 / 17;
	}
	.region__title {
		font-size: 16px;
		font-weight: bold;
	}
	.search-wrap__region {
		padding: 20px;
		text-align: center;
	}
	.region__list {
		width: 100%;
		height: 40px;
		border-radius: 10px;
		border: 1px solid rgb(209, 209, 209);
		text-align: center;
	}
	.region__list--sigungu {
		margin-top: 10px;
	}
	.search-wrap__submit {
		padding: 20px;
	}
	.search-wrap__btn {
		width: 100%;
		height: 40px;
		background: #ff6060;
		border-radius: 10px;
		border: none;
		color: white;
		font-weight: bold;
	}
</style>

<section class="section">
	<div class="search-wrap">
		<article class="article search-wrap__options">
			<form method="post" name="searchForm">
				<div class="search-wrap__region">
					<div class="region">
						<p class="region__title">지역</p> 
						<select class="region__list region__list--sido" name="sido" onchange="changeSido()">
							<c:forEach var="resion" items="${rLists }">
								<option class="region__item" value="${resion.rcode }">${resion.sido }</option>
							</c:forEach>
						</select>
						<select class="region__list region__list--sigungu" name="sigungu" onchange="addrDeps2Changed()">
							<option class="region__item" value="0">시/군/구</option>
							<option class="region__item" value="000">전체</option>
						</select>
					</div>
				</div>
				<div class="search-wrap__submit">
					<input class="search-wrap__btn" type="submit" value="검색" />
				</div>
				<div class="search-wrap__price">
					<p class="region__title">가격</p> 
					<input class="search-wrap__price" type="text" name="price" value="${searchBean.price }"/>
				</div>
				인원 <input type="text" name="count" value="${searchBean.count }"/>
				<br>
				기간 <input type="button" value="기간 선택" onclick="displayCal()"/>
				${start } ~ ${end }
				<br>
				<div class="calendar"></div>
				<input type="hidden" name="start" value="${start }">
				<input type="hidden" name="end" value="${end }">
				<input type="hidden" name="sort" value="${searchBean.sort }">
				<br>
				공용시설
				<br>
				<c:forEach var="fac" items="${facLists }">
					<c:if test="${fac.fgroup eq 'F1' }">
						<input type="checkbox" name="fac" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>${fac.name }
					</c:if>
				</c:forEach>
				<br>
				객실 내 시설
				<br>
				<c:forEach var="fac" items="${facLists }">
					<c:if test="${fac.fgroup eq 'F2' }">
						<input type="checkbox" name="fac" value="${fac.fnum }" <c:if test="${fn:contains(searchBean.fac, fac.fnum) }">checked</c:if>>${fac.name }
					</c:if>
				</c:forEach>
				<br>
			</form>
		</article>
		<article class="article search-wrap__result">
			<a href="javascript:sort('HIT')">추천 높은순</a>
			<a href="javascript:sort('HIGHPRICE')" class="order">가격 높은순</a>
			<a href="javascript:sort('LOWPRICE')">가격 낮은순</a>
			<c:if test="${empty sLists }">
				<h2>찾으시는 정보가 존재하지 않습니다.</h2>
			</c:if>
			<c:if test="${!empty sLists }">
				<c:forEach var="search" items="${sLists }">
					<div class="testDiv">
						<a href="${contextPath }/shop/detail.shop?anum=${search.anum }&start=${start }&end=${end }">${search.name }</a><br>
						${search.region }<br>
						${search.price }원<br>
						${search.image }
					</div>
				</c:forEach>
			</c:if>
		</article>
	</div>
</section>

<script>

	window.onload = function() {
		
		// DOM의 렌더링이 끝나면 form에 현재 경로로 action값을 넣어준다.
		const pathname = window.location.pathname;
		searchForm.action = pathname;
		
		// 달력 생성
		const start = ${start};
		const end = ${end};
		const cal = new Calendar({start: start, end: end});
		
		// 지역 체크박스
		if(/\d+\/\d+(?=.shop)/.test(pathname)) {
			const sido = pathname.match(/\d{2}(?=\d{3}.shop)/)[0];
			Array.from(searchForm.sido.children, (e)=> {
				if(e.value === sido) {
					e.selected = true;
				}
			});
		}
		else {
			searchForm.sido.options[0].selected = true;
		}
		
		changeSido();
	}

	function displayCal() {
		const cal = document.querySelector('.calendar');
		cal.classList.toggle('on');
	}
	
	// 
	function sort(sort) {
		const ele = document.querySelector('input[name="sort"]');
		ele.value = sort;
		ele.parentElement.submit();
	}
	
	// sido 선택하면
	function changeSido() {

		const sido = searchForm.sido.value;
		const sigungu = searchForm.sigungu;
		
		const pathname = window.location.pathname;
		
		const obj = {rcode : sido};
		const data = {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(obj)
		};
		
		fetch('${contextPath}/getSIGUNGU.shop', data)
		.then((res)=> res.json())
		.then((result)=> {
			sigungu.options.length = 2;
			result.forEach((e, i) => {
				sigungu.options[i + 2] = new Option(e.sigungu, e.rcode);
			});
		})
		.then(()=> {
			
			// 2dept 체크처리
			// fetch의 비동기 방식으로 인해서 2dept가 만들어진 이후 선택되야 한다.
			if(/\d+\/\d+(?=.shop)/.test(pathname)) {
				const oldSido = pathname.match(/(\d{2})\d+\.shop/)[1];
				Array.from(searchForm.sigungu.children, (e)=> {
					const sigungu = pathname.match(/\d{3}(?=\.shop)/)[0];	
					if(sido + e.value === oldSido + sigungu) {
						e.selected = true;
					}
					else {
						e.selected = false;
					}
				});	
			}
		});
	}
	
	function addrDeps2Changed() {
		
		const sido = searchForm.sido.value;
		const sigungu = searchForm.sigungu.value;
		
		if(sigungu.value === 0)
			return;
		
		const pathname = window.location.pathname;
		
		const url = pathname.match(/\/\w+\/\w+\/\w+\//)[0];
		const fac = pathname.match(/\/\w+\/\w+\/\w+\/(\d+)/)[1];
		
		const rcode = sido.concat(sigungu).padEnd(5, 0);
		
		searchForm.action = url + fac + "/" + rcode + ".shop";
		searchForm.submit();
	}
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>