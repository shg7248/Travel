<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<script src="${contextPath }/resources/js/calendar.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<style>
	.testDiv {
		width: 400px;
		height: 200px;
		border: 1px solid black;
	}
	
	form {
		border: 1px solid black;
	}
</style>

<!-- 
	지역을 바꾸면 전부 초기화되면서 새로고침이 되고 다른 요소로 인해서 절대 바뀌지 않는다.
	기간을 선택하면 지역은 그대로고 다른것들은 전부 초기화 된다.
 -->

${path }
<form method="post" name="searchForm">
	지역 
	<select name="sido" onchange="changeSido()">
		<c:forEach var="resion" items="${rLists }">
			<option value="${resion.rcode }">${resion.sido }</option>
		</c:forEach>
	</select>
	<select name="sigungu" onchange="addrDeps2Changed()">
		<option value="">시/군/구</option>
	</select>
	<br><br><br><br><br><br>

	<input type="submit" value="검색" />
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
			<input type="checkbox" name="fac1" value="${fac.fnum }"<c:if test="${fn:contains(searchBean.fac1, fac.fnum) }">checked</c:if>>${fac.name }
		</c:if>
	</c:forEach>
	<br>
	객실 내 시설
	<br>
	<c:forEach var="fac" items="${facLists }">
		<c:if test="${fac.fgroup eq 'F2' }">
			<input type="checkbox" name="fac2" value="${fac.fnum }" <c:if test="${fn:contains(searchBean.fac2, fac.fnum) }">checked</c:if>>${fac.name }
		</c:if>
	</c:forEach>
	<br>
	인원 <input type="text" name="count" value="${searchBean.count }"/>
	<br>
	가격 <input type="text" name="price" value="${searchBean.price }"/>
	<br>
</form>
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
			${search.addr }<br>
			${search.price }원<br>
			${search.image }
		</div>
	</c:forEach>
</c:if>
<script>

	window.onload = function() {
		
		// DOM의 렌더링이 끝나면 form에 현재 경로로 action값을 넣어준다.
		const pathname = window.location.pathname;
		searchForm.action = pathname;
		
		const start = ${start};
		const end = ${end};
		const cal = new Calendar({start: start, end: end});
		
		const rcode = searchForm.sido.value;
		const sigungu = searchForm.sigungu;
		
		// 지역 체크박스
		if(/\d+\/\d+(?=.shop)/.test(pathname)) {
			const si = pathname.match(/\d{2}(?=\d{3}.shop)/)[0];
			Array.from(searchForm.sido.children, (e)=> {
				if(e.value === si) {
					e.selected = true;
				}
			});
			changeSido();
		}
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
	
	// 주소 2deps 업데이트
	function changeSido() {
		const rcode = searchForm.sido.value;
		const sigungu = searchForm.sigungu;
		
		const pathname = window.location.pathname;
		
		const obj = {rcode : rcode};
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
			sigungu.options.length = 1;
			result.forEach((e, i) => {
				sigungu.options[i + 1] = new Option(e.sigungu, e.rcode);
			});
		})
		.then(()=> {
			
			// fetch의 비동기 방식으로 인해서 2dept가 만들어진 이후 선택되야 한다.
			if(/\d+\/\d+(?=.shop)/.test(pathname)) {
				
				Array.from(searchForm.sigungu.children, (e)=> {
					const sigungu = pathname.match(/\d{3}(?=\.shop)/)[0];			
					if(e.value === sigungu) {
						e.selected = true;
					}
				});	
			}
		});
	}
	
	function addrDeps2Changed() {
		
		const sido = searchForm.sido.value;
		const sigungu = searchForm.sigungu.value;
		const pathname = window.location.pathname;
		
		const url = pathname.match(/\/\w+\/\w+\/\w+\//)[0];
		const fac = pathname.match(/\/\w+\/\w+\/\w+\/(\d+)/)[1];
		
		searchForm.action = url + fac + "/" + sido.concat(sigungu) + ".shop";
		searchForm.submit();
	}
</script>