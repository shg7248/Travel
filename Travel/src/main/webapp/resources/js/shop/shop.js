(function() {
	// form에 현재 경로로 action값을 넣어준다.
	const pathname = window.location.pathname;
	searchForm.action = pathname;
	
	// 서버에서 넘어온 날짜를 이용해서 달력을 생성한다.
	const start = searchForm.start.value;
	const end = searchForm.end.value;
	const cal = new Calendar({start: start, end: end});
	
	// 지역 체크박스
	if(/\d+\/\d+(?=.shop)/.test(pathname)) {
		const sido = pathname.match(/\d{2}(?=\d{3}.shop)/)[0];
		Array.from(searchForm.sido.children, (elem)=> {
			if(elem.value === sido) {
				elem.selected = true;
			}
		});
	}
	else {
		searchForm.sido.options[0].selected = true;
	}
	
	changeSido();
}());	

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
	
	fetch('/travel/getSIGUNGU.shop', data)
	.then((res)=> res.json())
	.then((result)=> {
		sigungu.options.length = 2;
		result.forEach((e, i) => {
			sigungu.options[i + 2] = new Option(e.sigungu, e.rcode);
		});
	})
	.then(()=> {

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