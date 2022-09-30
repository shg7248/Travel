<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/accomDetail.css">
<article>
	<div class="accom">
		<h2 class="accom__name">${accom.name }</h2>
		<p class="accom__address">${accom.sido }&nbsp;${accom.sigungu }&nbsp;${accom.etcAddr }</p>
		<p class="accom__time">${accom.startTime }시 체크인 ~ ${accom.endTime }시 체크아웃 (시간은 각 객실마다 똑같이 적용 됩니다)</p>
		<hr>
		<div class="accom__content">
			<div class="accom__images">
				<img class="accom__image" src="${contextPath }/resources/images/accom/${accom.image }"/>
			</div>
			<div class="accom__info">
				<h2 class="accom__mainPoint">매력 포인트</h2>
				<p class="accom__detail-info">${accom.info }</p>
			</div>
		</div>
	</div>
</article>
<article>
	<div class="tab">
	    <ul class="tab__list">
	        <li class="tab__item"><a href="javascript:return false;" class="tab__link tab__link--1 <c:if test="${onum eq null }">on</c:if>">객실목록</a></li>
	        <li class="tab__item"><a href="javascript:return false;" class="tab__link tab__link--2 <c:if test="${onum ne null }">on</c:if>">리뷰</a></li>
	        <li class="tab__item"><a href="javascript:return false;" class="tab__link tab__link--3">지도</a></li>
	    </ul>
	    <div class="tab__content <c:if test="${onum eq null }">on</c:if>">
			<div class="room">
				<div class="room__list">
			        <c:forEach var="room" items="${lists }">
			        	<div class="room__item" style="background: url('${contextPath}/resources/images/room/${room.image }') center no-repeat;">
							<p class="room__name">${room.name }</p>
							<p class="room__price"><fmt:formatNumber value="${room.price }"></fmt:formatNumber>원</p>
							<div class="room__btns">
								<c:if test="${room.orders > 0 }">
									<a class="room-res__btn room-res__btn--no">예약불가</a>
								</c:if>
								<c:if test="${room.orders == 0 }">
									<a class="room-res__btn room-res__btn-yes" href="${contextPath }/shop/order.shop?rnum=${room.rnum }&startDate=${start }&endDate=${end }">예약하기</a>
								</c:if>
							</div>
			        	</div>
			        	<div class="room__detailInfo">
			        		<h3 style="font-size: 16px; font-weight: bold; margin-bottom: 5px;">객실 정보</h3>
							${room.info }
			        	</div>
					</c:forEach>
				</div>
			</div>
	    </div>
	    <div class="tab__content <c:if test="${onum ne null }">on</c:if>">
	    	<div class="reply">
		    	<c:if test="${onum ne null}">
	    			<div class="reply__form">
				    	<form method="post" name="replyForm" enctype="multipart/form-data">
				    		<div class="reply__rating-list">
					    		<input type="hidden" name="onum" value="${onum }"/>
					    		<input type="hidden" name="anum" value="${accom.anum }"/>
						        <input type="radio" name="rating" id="1" value="1">
					    		<label for="1">★☆☆☆☆</label>
						        <input type="radio" name="rating" id="2" value="2">
						        <label for="2">★★☆☆☆</label>
						        <input type="radio" name="rating" id="3" value="3">
						        <label for="3">★★★☆☆</label>
						        <input type="radio" name="rating" id="4" value="4">
						        <label for="4">★★★★☆</label>
						        <input type="radio" name="rating" id="5" value="5" checked>
						        <label for="5">★★★★★</label>
				    		</div>
					        <textarea class="reply__textarea" rows="" cols="" style="width: 100%; height: 100px;" name="content"></textarea>
					        <input class="reply__file" type="file" name="upload"/>
					        <input class="reply__submit" type="button" value="등록" onclick="replySubmit()"/>
				    	</form>
	    			</div>
		    	</c:if>
		   		<a class="reply__order reply__order-asc" onclick="replyOrder(0)">오래된순</a>
		   		<a class="reply__order reply__order-desc" onclick="replyOrder(1)">최신순</a>
	    	</div>
	    </div>
	    <div class="tab__content">
			<div id="map"></div>
	    </div>
	</div>
</article>
<script type="text/javascript">
	var container = document.getElementById('map'),
	map = new kakao.maps.Map(container, { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.556490249006615, 126.94520635682696), // 지도의 중심좌표 
	    level : 3 // 지도의 확대 레벨 
	});
	

	let defaults = {
		pageNumber: 1,
		pageSize: 5,
		order: 1, // 0: asc / 1: desc
		addPageNumber: function() {
			this.pageNumber += 1;
		}
	};
	function reply() {
		const reply = document.querySelector('.reply');
		fetch("${contextPath}/getReply.shop", {
			method: 'post',
			headers: {
				'Content-Type': "application/json"
			},
			body: JSON.stringify({
				anum: '${accom.anum}',
				start: (defaults.pageNumber - 1) * defaults.pageSize + 1,
				end: defaults.pageNumber * defaults.pageSize,
				order: defaults.order
			})
		})
		.then((data)=> data.json())
		.then((data)=> {
			defaults.addPageNumber();
			
			// 더보기가 있으면 지운다
			const addInfo = document.querySelector('.reply__info--addInfo');
			if(addInfo) {
				document.querySelector('.reply__info--addInfo').remove();
			}
			
			const reply__list = document.createElement('div');
			reply__list.classList.add('reply__list');
			let reply__item = ``;
			if(data.totalCount == 0) {
				
			}
			else {
				
				
				
				data.lists.forEach((obj, i)=> {
					reply__item += `<div class="reply__item">`;
					reply__item += `<div class="reply__info--content">`;
					reply__item += '<p>'+ obj.content +'</p>';
					if(obj.image) {
						reply__item += '<img class="reply__image" src="/travel/resources/images/reply/' + obj.image + '"/>';
					}
					reply__item += `</div>`;
					reply__item += `<div class="reply__info--writer">`;
					reply__item += `<span>` + obj.reg_date + `</span>`;
					reply__item += `<span>`+ obj.rname +`</span>`;
					reply__item += `<span>` + obj.email + `</span>`;
					reply__item += `<span><img class="reply__starImage" src='/travel/resources/images/star/` + obj.rating + `.png'/></span>`;
					
					<c:if test="${sessionScope.userInfo.email eq 'admin' }">
						reply__item += '<span class="reply__remove" onclick="deleteReply(\'' + obj.rvnum +'\')">삭제</span>';
					</c:if>
					reply__item += `</div></div>`
					
					if(obj.reply !== null) {
						reply__item += `<div class="reply__accom-item">`;
						reply__item += `<div class="reply__info--content">`;
						reply__item += obj.reply
						reply__item += `</div>`;
						reply__item += `<div class="reply__info--writer">`;
						reply__item += `<span>사장님</span>`;
						reply__item += `</div></div>`						
					}
				});
				reply__list.innerHTML = reply__item;
				reply.append(reply__list);
				const item__length = document.querySelectorAll('.reply__item');
				const makeAddInfo = document.createElement('div');
				makeAddInfo.classList.add('reply__info--addInfo');
				makeAddInfo.setAttribute('onclick', 'reply()');
				makeAddInfo.innerHTML = "더보기";
				if(data.totalCount !== item__length.length) {
					reply.append(makeAddInfo);
				}
			}
		});
	}
	reply();
	function replyOrder(order) {
		const r = document.querySelectorAll('.reply__list');
		r.forEach((elem)=> {
			elem.remove();
		})
		defaults = {...defaults, pageNumber: 1, order: order};
		reply();
	}
	function replySubmit() {
		const form = replyForm;
		
		if(form.content.value.length == 0) {
			alert("내용을 입력 하세요");
			form.content.focus();
			return;
		}
		
		const formData = new FormData(form);
		fetch("${contextPath}/insertReply.shop", {
			method: 'post',
			body: formData
		})
		.then(()=> {
			const r = document.querySelectorAll('.reply__list');
			r.forEach((elem)=> {
				elem.remove();
			})
			defaults = {...defaults, pageNumber: 1};
			
			document.querySelector('.reply__form').style.display = "none";
			
			reply(window); 
		}); 
	}
	
	function deleteReply(rvnum) {
		fetch("${contextPath}/deleteReply.shop", {
			method: 'post',
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			},
			body: JSON.stringify({rvnum: rvnum})
		})
		.then(()=> {
			const r = document.querySelectorAll('.reply__list');
			r.forEach((elem)=> {
				elem.remove();
			});
			defaults = {...defaults, pageNumber: 1};
			reply(window);
		});
	}
	(function() {
	    const link = document.querySelectorAll('.tab__link');
	    const con = document.querySelectorAll('.tab__content')
	    
	    link.forEach((ele, i)=> {
	        ele.addEventListener('click', (e) =>{
	
	            document.querySelector('.tab__link.on').classList.toggle('on');
	            document.querySelector('.tab__content.on').classList.toggle('on');
	            
	            con[i].classList.toggle('on')
	            e.target.classList.toggle('on');
	            
	            
	            // 카카오 맵
		    	container.style.width = '100%';
		    	container.style.height = '400px';
	            map.relayout();
	            
		       	let moveLatLon = new kakao.maps.LatLng('${accom.latitude }', '${accom.longitude }');
		    	map.setCenter(moveLatLon);
		    	addMarker(moveLatLon);
		    	 
		    	function addMarker(position) {
		    		var marker = new kakao.maps.Marker({
		    			position: position
		    		});
		    		marker.setMap(map);
		    	}
	        });
	    });
	}());
</script>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>