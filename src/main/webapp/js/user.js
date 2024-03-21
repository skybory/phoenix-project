var agreementCheckbox = document.getElementById('agreement');

document.addEventListener('DOMContentLoaded', function() {
 
	var submitButton = document.getElementById("submitButton");
	submitButton.disabled = true;
	document.getElementById("agreement").addEventListener("change", function() {
		submitButton.disabled = !this.checked;
	});
});

 function validcheck() {


	let frm = document.joinForm;
	let userId = frm.userId;
	let userPw = frm.userPw;
	let userPw_re = frm.userPw_re;
	let userName = frm.userName;
	let phoneNumber = frm.userPhoneNumber;
	let userAddress = frm.address;
	let gender = frm.userGender;
	let userEmail = frm.userEmail;
	let userAge = frm.userAge;

	if (userId.value == "") {
		alert("아이디를 입력하세요!");
		userId.focus();
		return false;
	}

	if (userId.value.length <= 4 || userId.value.length >= 16) {
		alert("아이디는 5자리 이상, 16자리 미만으로 작성");
		userId.focus();
		return false;
	}

	if (userPw.value == "") {
		alert("비밀번호를 입력하세요!");
		userPw.focus();
		return false;
	}

	if (userPw.value.length < 8 || userPw.value.length >= 15) {
		alert("비밀번호는 8자리 이상으로 입력하세요, 15자리 미만으로 입력하세요!");
		userPw.focus();
		return false;
	}

	if (userPw.value != userPw_re.value) { // 수정: 비밀번호 확인 추가 및 비교
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다!");
		userPw_re.focus();
		return false;
	}

	if (userName.value == "") {
		alert("이름을 입력하세요!");
		userName.focus();
		return false;
	}

	if (userAge.value == "") {
		alert("나이를 입력하세요!");
		userAge.focus();
		return false;
	}

	if (gender.value == "") {
		alert("성별을 입력하세요!");
		gender.focus();
		return false;
	}

	if (phoneNumber.value == "") {
		alert("전화번호를 입력하세요!");
		phoneNumber.focus();
		return false;
	}


	if (userEmail.value == "") {
		alert("이메일을 입력하세요!");
		userEmail.focus();
		return false;
	}

	if (userAddress.value == "") {
		alert("주소를 입력하세요!");
		userAddress.focus();
		return false;
	}
}

// 체크박스 클릭 이벤트 처리
agreementCheckbox.addEventListener('click', function() {
	if (agreementCheckbox.checked) {
		if (validcheck() == false) {
			agreementCheckbox.checked = false;
		} else {
			alert('개인정보 수집 및 이용에 동의하셨습니다.');
		}
	} else {
		alert('개인정보 수집 및 이용에 동의를 철회하셨습니다.');
	}
});
 

function previewImages(event) {
	document.querySelector("#image_container").innerHTML = "";

	for (var image of event.target.files) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			img.onload = function() {
				var canvas = document.createElement('canvas');
				var ctx = canvas.getContext('2d');
				var MAX_SIZE = 200;
				var width = img.width;
				var height = img.height;

				if (width > height) {
					if (width > MAX_SIZE) {
						height *= MAX_SIZE / width;
						width = MAX_SIZE;
					}
				} else {
					if (height > MAX_SIZE) {
						width *= MAX_SIZE / height;
						height = MAX_SIZE;
					}
				}

				canvas.width = width;
				canvas.height = height;
				ctx.drawImage(img, 0, 0, width, height);

				var newImgContainer = document.createElement("div");
				var newImg = document.createElement("img");
				newImg.src = canvas.toDataURL();

				var deleteButton = document.createElement("button");
				deleteButton.textContent = "x";
				deleteButton.onclick = function() {
					var container = this.parentElement;
					container.remove();
					var imageURL = this.previousElementSibling.src;
					URL.revokeObjectURL(imageURL);
				};

				newImgContainer.appendChild(newImg);
				newImgContainer.appendChild(deleteButton);

				document.querySelector("#image_container").appendChild(newImgContainer);
			}
		};

		reader.readAsDataURL(image);
	}
}
function checkId(userId) {
	if (userId == "") {
		alert("아이디를 입력해주세요");
		return false;
	} else {
		// jQuery ajax
		$.ajax({
			type: 'post', 	// 타입작성(get, post)
			url: '/user/idcheck.jsp',
			data: { "userId": userId },
			async: true,		// 비동기화여부(비동기 : true)
			success: function(result) { // 성공시 콜백함수
				if (result.trim() == "ok") {
					document.getElementById("check").innerHTML = "사용할 수 있는 아이디입니다.";
				} else {
					document.getElementById("check").innerHTML = "중복된 아이디입니다.";
				}
			},
			error: function(result, status, error) {		// 실패시 콜백함수
				console.log(error);
			}
		});


	}
}

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
}
function sendit() {
	let frm = document.joinForm;
	combineAddress();
	frm.submit();
	}
