<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/comp/header.jsp" %>
		<form method="post" action="${contextPath }/comp/accom/insert.comp" enctype="multipart/form-data" name="accomForm">
		<input type="hidden" name="latitude" value="">
		<input type="hidden" name="longitude" value="">
		<input type="hidden" name="rcode" value="">
		<table class="accom-insert__form">
			<tr>
				<th>사업자 등록번호</th>
				<td>
					<input type="text" name="cnum" value="${sessionScope.loginInfo.cnum }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>숙박지 종류</th>
				<td>
					<select name="canum">
						<option value="">종류를 선택하세요</option>
						<c:forEach var="cate" items="${caLists }">
							<option value="${cate.canum }">${cate.caname }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>숙박지 이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>숙박지 주소</th>
				<td>
					<p class="msg--import">※ 주소 입력 버튼을 눌러 숙박지를 선택하면 자동으로 입력됩니다.</p>
					<input type="button" value="주소 입력" onclick="findAddress()"><br><br>
					우편번호<br><input type="text" name="zip" readonly="readonly"><br>
					시/도<br><input type="text" name="sido" readonly="readonly"><br>
					시/군/구<br><input type="text" name="sigungu" readonly="readonly"><br>
					상세주소<br><input type="text" name="etcAddr" readonly="readonly"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2"><div id="map" style="width:500px;height:400px;"></div></td>
			</tr>
			<tr>
				<th>숙박지 주변 편의시설</th>
				<td>
					<c:forEach var="fac" items="${fLists }">
						<c:if test="${fac.fgroup eq 'F1' }">
							<input type="checkbox" name="fac1" value="${fac.fnum }">${fac.name }
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>객실 편의시설</th>
				<td>
					<c:forEach var="fac" items="${fLists }">
						<c:if test="${fac.fgroup eq 'F2' }">
							<input type="checkbox" name="fac2" value="${fac.fnum }">${fac.name }
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>입실시간</th>
				<td>
					<input type="text" name="startTime">
					<p class="msg--import">※ 01 ~ 24까지의 숫자만 입력이 가능합니다.</p>
				</td>
			</tr>
			<tr>
				<th>퇴실시간</th>
				<td>
					<input type="text" name="endTime">
					<p class="msg--import">※ 01 ~ 24까지의 숫자만 입력이 가능합니다.</p>
				</td>
			</tr>
			<tr>
				<th>숙박지 이미지</th>
				<td>
					<input type="file" name="upload">
				</td>
			</tr>
			<tr>
				<th>숙박지 정보</th>
				<td>
					<textarea rows="20" cols="20" name="info" id="ir1" class="ir1"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록" onclick='return submitAccom()'>
				</td>
			</tr>
		</table>
		</form>
	</section>
</main>
<script>

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		sSkinURI : "${contextPath}/resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			fOnBeforeUnload : function() {}
		}
	});

	var container = document.getElementById('map'),
	map = new kakao.maps.Map(container, { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
	    level : 3 // 지도의 확대 레벨 
	});
	
	 map.setDraggable(false);
	 map.setZoomable(false);
	
	container.style.width = '100%';
	container.style.height = '200px';
	map.relayout();

	var geocoder = new kakao.maps.services.Geocoder();

	const markers = [];
	
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
</script>
<script type="text/javascript" src="${contextPath }/resources/js/comp/auth.js"></script>