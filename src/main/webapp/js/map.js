
// 내용값을 바꾸는 함수
function changeContent() {
	var myAddress = getAddress();

	// 동적으로 내용 변경
	var dynamicContent = document.getElementById("dynamicContent");

	// 주소값이 null인 경우
	if (myAddress === null) {
		dynamicContent.textContent = '위치를 설정하시겠어요?';
	} else {
		// 주소값이 존재하는 경우
		dynamicContent.textContent = '내 주소: ' + myAddress;
	}
}


// 여기서 
// 가상의 함수: 실제로는 사용자의 주소값을 가져오는 로직으로 대체해야 합니다.
//function getAddress() {
//	// 여기에서 실제로 주소값을 가져오는 로직을 구현
//	// 예시로 null을 반환하도록 함
//	return null;
//}
//
//
//
//var mapContainer = document.getElementById('map'), // 지도를 표시할 div
//	mapOption = {
//		center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
//		level: 5 // 지도의 확대 레벨
//	};
//
////지도를 미리 생성
//var map = new daum.maps.Map(mapContainer, mapOption);
////주소-좌표 변환 객체를 생성
//var geocoder = new daum.maps.services.Geocoder();
////마커를 미리 생성
//var marker = new daum.maps.Marker({
//	position: new daum.maps.LatLng(37.537187, 127.005476),
//	map: map
//});




// 주소 표시하기
function markAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = data.address; // 최종 주소 변수

			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("sample5_address").value = addr;
			// 주소로 상세 정보를 검색
			geocoder.addressSearch(data.address, function(results, status) {
				// 정상적으로 검색이 완료됐으면
				if (status === daum.maps.services.Status.OK) {

					var result = results[0]; //첫번째 결과의 값을 활용

					// 해당 주소에 대한 좌표를 받아서
					var coords = new daum.maps.LatLng(result.y, result.x);
					// 지도를 보여준다.
					mapContainer.style.display = "block";
					map.relayout();
					// 지도 중심을 변경한다.
					map.setCenter(coords);
					// 마커를 결과값으로 받은 위치로 옮긴다.
					marker.setPosition(coords)
				}
			});
		}
	}).open();
}


// 주소찾기 코드
// 주소를 입력하면 서울시 동작구 흑석로 5길 13, 상세주소 ? 로 가져오는 코드
function searchAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}


			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();

		}
	}).open();
}

function combineAddress() {
	var address = document.getElementById("address").value;
	var extraAddress = document.getElementById("extraAddress").value;
	var detailAddress = document.getElementById("detailAddress").value;
	var userAddress = address + ' ' + extraAddress + ' ' + detailAddress.trim();
	document.getElementById("userAddress").value = userAddress;
	alert("저장되었습니다");
}


function checkAddress() {
	var detailAddress = document.getElementById('detailAddress').value.trim();
	var submitButton = document.getElementById('submitButton');
	if (detailAddress === '') {
		submitButton.disabled = true;
	} else {
		submitButton.disabled = false;
	}
}

document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('detailAddress').addEventListener('input', checkAddress);
	document.getElementById("address").readOnly = false;
	document.getElementById("extraAddress").readOnly = false;
});



//// 주소비교하기       
//function checkChanges() {
//	// 세션에서 이전 사용자 주소 가져오기
//	var oldUserAddress = '<%= userAddress %>';
//
//	// 화면에서 사용자 입력 주소 가져오기
//	var userAddress = document.getElementById('userAddress').value;
//
//	// 이전 주소와 현재 주소 비교
//	if (oldUserAddress !== userAddress) {
//		// 변경된 내용이 있을 경우 모달 창 띄우기
//		$('#changesModal').modal('show');
//	}
//}

//function sendit() {
//	var detailAddress = document.getElementById('detailAddress').value.trim();
//	if (detailAddress === '') {
//		alert('상세주소를 입력해주세요.');
//		return false;
//	}
//	let frm = document.getElementById('addressForm');
//	combineAddress();
//	frm.submit();
//	return true;
//}
//
//// 변경 완료 버튼 클릭 시 호출되는 함수
//function sendit() {
//	// 변경사항 확인 여부 체크
//	if (document.getElementById('confirmChanges').checked) {
//		// 변경사항 확인되었으면 폼 제출
//		document.getElementById('addressForm').submit();
//	} else {
//		// 변경사항 확인되지 않았으면 알림 출력
//		alert('변경사항을 확인해주세요.');
//	}
//}
//// 체크박스 클릭 이벤트 처리
//var confirmChangesCheckBox = document.getElementById('confirmChanges');
//confirmChangesCheckBox.addEventListener('click', function() {
//	if (confirmChangesCheckBox.checked) {
//		if (validcheck() == false) {
//			confirmChangesCheckBox.checked = false;
//		}
//		else {
//			alert('주소를 변경합니다');
//			checkChanges();
//			alert('변경사항을 확인하셨습니다.');
//		}
//	}else {
//			// 변경사항 확인 버튼이 체크되어 있지 않을 때의 동작
//			alert('변경사항 확인을 철회하셨습니다.');
//		}
//	});
// 주소 비교 함수
function checkChanges() {
	// 세션에서 이전 사용자 주소 가져오기
	var oldUserAddress = document.getElementById('oldUserAddress').value;

	// 화면에서 사용자 입력 주소 가져오기
	var userAddress = document.getElementById('userAddress').value;

	// 이전 주소와 현재 주소 비교
	if (oldUserAddress !== userAddress) {
		document.getElementById('oldAddress').innerText = "이전 주소: " + oldUserAddress;
		document.getElementById('currentAddress').innerText = "현재 주소: " + userAddress;

		// 변경된 내용이 있을 경우 모달 창 띄우기
		$('#changesModal').modal('show');
	}
}

// 폼 제출 함수
function sendit() {
	// 상세주소를 가져옴
	var detailAddress = document.getElementById('detailAddress').value.trim();

	// 상세주소가 비어 있는지 확인
	if (detailAddress === '') {
		alert('상세주소를 입력해주세요.');
		return false;
	}

	// 변경사항 확인 여부 체크
	if (document.getElementById('confirmChanges').checked) {
		// 변경사항 확인되었으면 폼 제출
		document.getElementById('addressForm').submit();
	} else {
		// 변경사항 확인되지 않았으면 알림 출력
		alert('변경사항을 확인해주세요.');
	}
}

function validcheck() {
	var userAddress = document.getElementById('userAddress').value.trim();
	if (userAddress === '') {
		return false;
	} else {
		return true;
	}
}


// 체크박스 클릭 이벤트 처리
var confirmChangesCheckBox = document.getElementById('confirmChanges');
confirmChangesCheckBox.addEventListener('click', function() {
	combineAddress();
	if (confirmChangesCheckBox.checked) {
		// 변경사항 확인 버튼이 체크되었을 때
		if (validcheck() === false) {
			// 유효성 검사 실패 시 체크 해제
			confirmChangesCheckBox.checked = false;
		} else {
			// 유효성 검사 통과 시 변경사항 확인 알림 출력 및 주소 비교
			//            alert('주소를 변경합니다');
			checkChanges();
			//            alert('변경사항을 확인하셨습니다.');
		}
	} else {
		// 변경사항 확인 버튼이 체크되어 있지 않을 때의 동작
		alert('변경사항 확인을 철회하셨습니다.');
	}
});
function checkChange() {

}
//agreementCheckbox.addEventListener('click', function() {
//	if (agreementCheckbox.checked) {
//		if (validcheck() == false) {
//			agreementCheckbox.checked = false;
//		} else {
//			alert('개인정보 수집 및 이용에 동의하셨습니다.');
//		}
//	} else {
//		alert('개인정보 수집 및 이용에 동의를 철회하셨습니다.');
//	}
//});