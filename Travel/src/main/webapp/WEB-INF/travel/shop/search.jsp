<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/common.jsp" %>  
<%@ include file="/resources/js/calendar.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/calendar.css">
<style>
	.testDiv {
		width: 400px;
		height: 200px;
		border: 1px solid black;
	}
</style>

<!-- 
	지역을 바꾸면 전부 초기화되면서 새로고침이 되고 다른 요소로 인해서 절대 바뀌지 않는다.
	기간을 선택하면 지역은 그대로고 다른것들은 전부 초기화 된다.
 -->

${path }
<form method="post" name="searchForm">
	<input type="submit" value="검색" />
	<br>
	지역 
	<select name="sido" onchange="changeSido()">
		<c:forEach var="resion" items="${rLists }">
			<option value="${resion.rcode }">${resion.sido }</option>
		</c:forEach>
	</select>
	<select name="sigungu" onchange="addrDeps2Changed()"></select>
	<br>
	기간 <input type="button" value="기간 선택" onclick="displayCal()"/>
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
<c:forEach var="search" items="${sLists }">
	<div class="testDiv">
		<a href="${contextPath }/shop/detail.shop?anum=${search.anum }&start=${start }&end=${end }">${search.name }</a><br>
		${search.addr }<br>
		${search.price }원<br>
		${search.image }
	</div>
</c:forEach>
<script>

	window.onload = function() {
		
		// DOM의 렌더링이 끝나면 form에 현재 경로로 action값을 넣어준다.
		const pathname = window.location.pathname;
		searchForm.action = pathname;
		
		// sido에 맞는 sigungu를 출력한다.
		changeSido();
	}

	function displayCal() {
		const cal = document.querySelector('.calendar');
		cal.classList.toggle('on');
	}

	const start = ${start};
	const end = ${end};
	const cal = new Calendar({start: start, end: end});
	
	function sort(sort) {
		const ele = document.querySelector('input[name="sort"]');
		ele.value = sort;
		ele.parentElement.submit();
	}
	
	function changeSido() {
		const rcode = searchForm.sido.value;
		const sigungu = searchForm.sigungu;
		
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
			sigungu.innerHTML = "";
			result.forEach((e, i) => {
				sigungu.options[i] = new Option(e.sigungu, e.rcode);
			});
		});
		
	}
	
	function addrDeps2Changed() {
		
		const sido = searchForm.sido.value;
		const sigungu = searchForm.sigungu.value;
		
		
		
		const url = '${path}'.match(/\/\w+\/\w+/)[0];
		const fac = "${path}".match(/\/\w+\/\w+\/(\d+)/)[1];
		
		searchForm.action = '${contextPath}' + url + "/" + fac + "/" + sido.concat(sigungu) + ".shop";
		searchForm.submit();
	}
</script>