

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
 			document.getElementById('submitButton').disabled = false;			// 제출 버튼 활성화
		}
	}).open();
	 
}
// 제출 버튼 활성화

// 이게 1번(제출완료 활성화)
// 입력값 확인

// 제출 버튼 활성화


// 얘는 '변경완료'' 눌렀을때 실행하고 (2)
function combineAddress() {
	var address = document.getElementById("address").value;
	var extraAddress = document.getElementById("extraAddress").value;
	var detailAddress = document.getElementById("detailAddress").value;
	var userAddress = address + ' ' + extraAddress + ' ' + detailAddress.trim();
	document.getElementById("userAddress").value = userAddress;
	alert(userAddress);		// 실행 성공.(지금주소찍힘)
	var oldUserAddress = document.getElementById('oldUserAddress').value;
	var userAddress = document.getElementById('userAddress').value;
	alert(oldUserAddress);	//null 찍힘
	alert(userAddress);		//입력주소 찍힘
	
	
	 document.getElementById('oldAddress2').innerText = "이전 주소: " + oldUserAddress;
    document.getElementById('currentAddress2').innerText = "현재 주소: " + userAddress;
	
	 document.getElementById("changesModal").document.getElementById("userAddress").value = userAddress;
	$('#changesModal').modal('show');
//	 document.getElementById("changesModal").document.getElementById("userAddress").value = userAddress;
	document.getElementById("addressForm").addEventListener("submit", function(event) {
  // 기본 동작인 화면 이동을 막음
  event.preventDefault();
  alert("가로채기성공")
});
}

 

 


// 폼 제출 함수
function sendit(event) {
	// 전체주소
	event.preventDefault();
	alert("이것도 안될수도있어");
	var userAddress = document.getElementById('userAddress').value.trim();
 
	 
				document.getElementById("changesModal").document.getElementById("userAddress").value = userAddress;

		alert("이거 실행되나...");
//		document.getElementById("changesModal").document.getElementById("userAddress").value = userAddress;
		document.addressForm.submit();
		document.getElementById('addressForm').action = '/user/UserupdateAddressAction.us';
	
	} 

 
 
 