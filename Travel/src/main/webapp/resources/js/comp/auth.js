function submitAccom() {
		
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		
	if(accomForm.canum.value.length == 0) {
		alert("카테고리를 선택해 주세요");
		return false;
	}
	
	if(accomForm.name.value.length == 0) {
		alert("숙박지 이름을 입력해 주세요.");
		accomForm.name.focus();
		return false;
	}
	
	if(accomForm.zip.value.length == 0) {
		alert("주소를 입력해 주세요.");
		return false;
	}
	
	if(!/^(0[1-9]|1[0-9]|2[0-4])$/.test(accomForm.startTime.value)) {
		alert("입실시간을 정확히 입력해 주세요.");
		accomForm.startTime.focus();
		return false;
	}
	
	if(!/^(0[1-9]|1[0-9]|2[0-4])$/.test(accomForm.endTime.value)) {
		alert("퇴실시간을 정확히 입력해 주세요.");
		accomForm.endTime.focus();
		return false;
	}
	
	console.log(accomForm.upload.files);
	
	if(accomForm.upload.files.length == 0) {
		alert("이미지를 선택해 주세요.");
		return false;
	}
	
	console.log(accomForm.ir1.value);
	
	if(accomForm.ir1.value.length == 0 || accomForm.ir1.value === '<br>') {
		alert("숙박지 정보를 입력해 주세요.");
		return false;
	}
}

function submitRoom() {

	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	if(roomForm.name.value.length == 0) {
		alert("객실 이름을 입력하세요");
		roomForm.name.focus();
		return false;
	}
	
	if(roomForm.price.value.length == 0) {
		alert("가격을 입력 하세요");
		roomForm.price.focus();
		return false;
	}
	
	if(!/^\d+$/.test(roomForm.price.value)) {
		alert("가격은 숫자만 입력해야 합니다.");
		roomForm.price.focus();
		return false;
	}
	
	if(roomForm.max.value.length == 0) {
		alert("최대인원을 입력하세요");
		roomForm.max.focus();
		return false;
	}
	
	if(roomForm.upload.files.length == 0) {
		alert("이미지를 선택해 주세요.");
		return false;
	}
	
	if(roomForm.ir1.value.length == 0 || roomForm.ir1.value === '<br>') {
		alert("숙박지 정보를 입력해 주세요.");
		return false;
	}
}