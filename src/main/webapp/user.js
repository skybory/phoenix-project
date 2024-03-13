/**
 *  회원가입 validation 체크
 */
function sendit() {
	// 아이디 빈값체크	-> alert 아이디를 입렵하세요!
	// 아이디 길이체크	-> alert 아이디는 5자리 이상, 16자리 미만으로 작성
	// 비밀번호 빈값체크	-> alert 비밀번호를 입력하세요!
	// 비밀번호 자리체크	-> alert 비밀번호는 8자리 이상으로 입력하세요!
	// 비밀번호=비밀번호확인-> alert 비밀번호와 비밀번호확인이 일치하지 않습니다!
	// 이름 빈값체크		-> alert 이름을 입력하세요!
	// 휴대폰번호 빈값체크	-> alert 휴대폰번호를 입력하세요!
	// 주소체크		-> alert 주소를 입력하세요!
	// 성별체크		-> alert 성별을 입력하세요!
	// 이메일체크		-> alert 이메일을 입력하세요!
	// 나이체크		-> alert 나이를 입력하세요!
	// submit();

	let frm = document.joinForm;
	let userId = frm.userId;
	let userPw = frm.userPw;
	let userPw_re = frm.userPw_re;
	let userName = frm.userName;
	let phoneNumber = frm.phoneNumber;
	let userAddress = frm.userAddress;
	let gender = frm.gender;
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



	

	
	
	
	
	frm.submit();
}

/*
	   로그인 validation check
 */
function loginit() {
	// 아이디 빈값처리
	// 패스워드 빈값처리
	let frm = document.frm;
	let userid = frm.userid;
	let userpw = frm.userpw;

	if (userid.value == "") {
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}

	if (userpw.value == "") {
		alert("패스워드를 입력하세요!");
		userpw.focus();
		return false;
	}

	frm.submit();
}

function checkId(userId){
	if( userId == "" ){
		alert("아이디를 입력해주세요");
		return false;
	} else {
		// jQuery ajax
		$.ajax({
			type	: 'post', 	// 타입작성(get, post)
			url		: 'idcheck.jsp',
			data	: { "userId" : userId },
			async	: true,		// 비동기화여부(비동기 : true)
			success : function(result){ // 성공시 콜백함수
				if (result.trim() == "ok"){
					document.getElementById("text").innerHTML = "사용할 수 있는 아이디입니다.";
				} else {
					document.getElementById("text").innerHTML = "중복된 아이디입니다.";
				}
			},
			error	: function(result, status, error){		// 실패시 콜백함수
				console.log(error);
			}
		});
		
		
	}
}


