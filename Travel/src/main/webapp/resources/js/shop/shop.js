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
		const sido = pathname.match(/[\d]{2}(?=\d*\.shop)/)[0]; 
		Array.from(searchForm.sido.children, (elem)=> {
			if(elem.value === sido) {
				elem.selected = true;
			}
		});
	}
	else {
		searchForm.sido.options[0].selected = true;
	}
	
	changeSido(0)
}());	

// sido 선택하면
function changeSido(c) {

	const 	sido = searchForm.sido.value,
			sigungu = searchForm.sigungu,
			pathname = window.location.pathname,
			url = pathname.match(/\/\w+\/\w+\/\w+/)[0], 
			cate = pathname.match(/\/\w+\/\w+\/\w+\/(\d+)/)[1];
			
	// c 가 0이면 페이지가 리로드 됬을 때, 1이면 selectbox를 선택했을 때 
	if(sido == 0 && c) {
		window.location.href = url + '/' + cate + '.shop';
	}
	
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
		sigungu.options.length = 1;
		result.forEach((e, i) => {
			sigungu.options[i + 1] = new Option(e.sigungu, e.rcode);
		});
	})
	.then(()=> {

		if(/\/\d\/\d{2}\d{3}\.shop/.test(pathname)) {
			const oldSido = pathname.match(/[\d]{2}(?=\d*\.shop)/)[0];
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
	
	const pathname = window.location.pathname;
	
	const url = pathname.match(/\/\w+\/\w+\/\w+\//)[0];
	const cate = pathname.match(/\/\w+\/\w+\/\w+\/(\d+)/)[1];
	
	const rcode = sido.concat(sigungu);
	
	searchForm.action = url + cate + "/" + rcode + '.shop';
	searchForm.submit();
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

// 인원수
function calccount(number) {
	const count__text = document.querySelector('.count__text');
	if(Number(count__text.value) + Number(number) < 1) {
		return;
	}
	count__text.value = Number(count__text.value) + Number(number);
}