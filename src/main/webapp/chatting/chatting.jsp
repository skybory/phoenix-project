<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;
int userAccount = 0;
int userIdx = 0;

if (udto != null) {
	userId = udto.getUserId();
	userName = udto.getUserName();
	userIdx = udto.getUserIdx();
	userAccount = udto.getUserAccount();
}
%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<style type="text/css">
.container {
	max-width: 1170px;
	margin: auto;
}

img {
	max-width: 100%;
}

.inbox_people {
	background: #f8f8f8 none repeat scroll 0 0;
	float: left;
	overflow: hidden;
	width: 40%;
	border-right: 1px solid #c4c4c4;
}

.inbox_msg {
	border: 1px solid #c4c4c4;
	clear: both;
	overflow: hidden;
	border-radius: 20px; /* Add border-radius for rounded corners */
}

.top_spac {
	margin: 20px 0 0;
}

.recent_heading {
	float: left;
	width: 40%;
}

.sent_msg {
	float: right;
	max-width: 46%; /* 최대 너비 설정 */
	margin: 0 10px 0 0; /* Adjust margin as needed */
	overflow: hidden; /* 넘치는 내용을 숨김 */
}

.sent_msg p {
	background: #ff8c00; /* 당근색 */
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 10px 15px; /* Adjust padding as needed */
	display: inline-block; /* 텍스트 내용에 맞게 크기를 설정하기 위해 인라인 블록으로 설정 */
	border-radius: 20px; /* Add border-radius for rounded corners */
	max-width: calc(100% - 30px); /* 최대 너비 설정 */
	word-wrap: break-word; /* 긴 단어를 줄 바꿈하여 표시 */
}

.srch_bar {
	display: inline-block;
	text-align: right;
	width: 60%;
}

.headind_srch {
	padding: 10px 29px 10px 20px;
	overflow: hidden;
	border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
	color: #05728f;
	font-size: 21px;
	margin: auto;
}

.srch_bar input {
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 2px 0 4px 6px;
	background: none;
}

.srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto
}

.chat_img {
	float: left;
	width: 11%;
}

.chat_ib {
	float: left;
	padding: 0 0 0 10px;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
	width: 100%;
}

.chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
	width: 100%;
}

.inbox_chat {
	height: 550px;
	overflow-y: scroll;
	width: 100%;
}

.active_chat {
	background: #ebebeb;
}

.incoming_msg_img {
	display: inline-block;
	width: 6%;
}

.received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
}

.received_withd_msg p {
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 20px;
	/* Increase the border-radius for a more rounded look */
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 10px 15px; /* Adjust padding as needed */
	width: 100%;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.received_withd_msg {
	width: 57%;
}

.mesgs {
	float: left;
	padding: 30px 15px 0 25px;
	width: 60%;
}

.sent_msg p {
	background: #ff8c00 none repeat scroll 0 0;
	border-radius: 20px;
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.outgoing_msg {
	overflow: hidden;
	margin: 26px 0 26px;
}

.sent_msg {
	float: right;
	width: 46%;
	text-align: right;
}

.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}

.type_msg {
	border-top: 1px solid #c4c4c4;
	position: relative;
}

.msg_send_btn {
	background: #ff8c00 none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}

.messaging {
	padding: 0 0 50px 0;
}

.msg_history {
	height: 516px;
	overflow-y: auto;
	flex-direction: column-reverse;
}

.lemon-bg {
	background-color: #E5D85C;
}

.navbar {
	background-color: #343a40; /* 배경색 설정 */
}

.navbar-brand {
	font-size: 1.5rem; /* 로고 텍스트 크기 설정 */
}

.navbar-toggler-icon {
	color: white; /* 햄버거 아이콘 색상 설정 */
}

.navbar-nav .nav-link {
	color: white; /* 네비게이션 링크 텍스트 색상 설정 */
}

/* 로그인/회원가입 링크 스타일 */
.navbar-nav .nav-item:not(:last-child) .nav-link {
	margin-right: 15px; /* 네비게이션 링크 간격 설정 */
}

/* 사용자 인사 메시지 스타일 */
#userGreeting {
	font-weight: bold; /* 굵게 설정 */
	color: #FF5733; /* 글자 색상 설정 */
}

#userGreetingLi {
	margin-left: 20px; /* 왼쪽 여백 설정 */
}

#lemonLogo {
	width: 50px; /* 원하는 너비로 조정 */
	height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
}
</style>



</head>



<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<img
					src="${pageContext.request.contextPath}/picture/lemon_logo5.png"
					alt="Logo" class="img-fluid" id="lemonLogo"> <a
					class="navbar-brand"
					href="${pageContext.request.contextPath}/index.jsp">레몬 마켓</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/About.bo">소개</a></li>
						<%
						if (udto == null) {
						%>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo"
							onclick="showAlert()">카테고리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo"
							onclick="showAlert()">중고거래</a></li>

						<!--         로그인이 안되어있을때 나오는 값 -->
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Join.bo"">회원가입</a></li>

						<%
						} else {
						%>

						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Product.bo">중고거래</a></li>
						<!--     로그인이 되어있을 때 나오는 값 -->
						<li class="nav-item"><a class="nav-link" href="/board/Map.bo">내
								동네 바꾸기</a></li>
						<!-- 		이거쓸꺼면 마이페이지 바로뒤에 붙여야함 -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="userGreeting" href=""
							role="button" data-bs-toggle="dropdown" aria-expanded="false"><%=userName%>님(<%=userId%>)
								안녕하세요</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="/board/MyPage.bo">마이페이지</a></li>
								<li><a class="dropdown-item" href="/board/MyPage.bo">잔액 :
										<%=userAccount%>원
								</a></li>
							</ul></li>
						<li class="nav-item dropdown">
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
							</ul>
						</li>


						<li class="nav-item"><a class="nav-link" id="userGreeting"
							href="/user/UserLogoutAction.us" onclick = "showLog()">로그아웃</a></li>

						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>

	<form class="container" method="post" name="joinForm">
		<h3 class=" text-center">Messaging</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">

							<h4>Recent</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat"></div>
				</div>

				<div class="mesgs">
					<div class="msg_history">
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img>
							</div>
							<div class="received_msg">
								<div class="received_withd_msg"></div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg"></div>
						</div>

					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" id="contents"
								placeholder="Type a message" name="contents" />
							<button class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane-o" aria-hidden="true"
									onclick="submit()"><img src="send.png"> </i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input id="max" type="hidden" name="max"  /> 
		<input id="roomseq"	type="hidden" name="roomseq" />


	</form>



</body>








<script type="text/javascript">
	window.onload = function(){
		var productId = "${pdto.userId}";
		var productIdx = ${pdto.productIdx};
		var useridx = <%=userIdx%>;
		var userId = "<%=userId%>";
		console.log(useridx);
		chattingList(useridx,productIdx,productId,userId);	
//		getInfinite();
	}
	
	function getInfinite() {
	    setTimeout(function() {
	        clearInterval(intervalId); // 30초 후에 setInterval을 중지합니다.
	    }, 300000);

	    var intervalId = setInterval(function() {
	        send();
	    }, 5000);
	}
	
	
	
	
	
	
	
	

	function chattingList(useridx,productIdx,productId,userId) {
		// 전송 버튼을 누를 때 
		//	var fromid = $("#userid").val();
		//	var toid = $("#toid").val();
		//	var contents = $("#contents").val();

		var userIdx = useridx;//수정해라 하드코딩
		var prIdx = productIdx;
		var pr_userId = productId;
		var userId = userId
		alert(userIdx);
		$.ajax({
			type: "POST",
			url: "/chatting/getRoomList.chat",
			data: {
				"userIdx": userIdx,
				"prIdx" : prIdx,
				"pr_userId" : pr_userId,
				"userId" : userId
			},
			success: function(result) {
				for (let i = 0; i < result.length; i++) {
					let ajaxresult = JSON.parse(JSON.stringify(result[i]));

					//					$(".received_msg").append( "<div class = 'received_withd_msg'>"
					//					+ajaxresult.chatId+"</div>");

					$("#max").val(ajaxresult.max); // * 수정이 필요할지도 *

					$(".inbox_chat").append('<a href = "#" onclick = "sendit('+ ajaxresult.roomseq +')" />' +
						'<div class="chat_list">' +
						'<div class="chat_people">' +
						'<div class="chat_img">' +
						'<img src="https://ptetutorials.com/images/user-profile.png"alt="sunil">' +
						'</div>' +
						'<div class="chat_ib">' +

						'<h5>' +
						ajaxresult.toId + ' <span class="chat_date">' + ajaxresult.roomDate + '</span>' +
						'</h5>' +
						'<p>' + ajaxresult.contents + '</p>' +
						//여기 조인해서 최근채팅하나
						'</div>' +
						'</div>' +
						'</div>' +
						'</a>')

				}
			},
			error: function(result) {
				console.log(result);
			}

		});
		$("#contents").val('');

	}





	function sendit(roomseq) {
		// 전송 버튼을 누를 때 
		//	var fromid = $("#userid").val();
		//	var toid = $("#toid").val();
		//	var contents = $("#contents").val();
//		var fromid = 'tbdud98';
//		var toid = 'ahyun';
//		var contents = '살려조';
		$(".msg_history").empty();
		$.ajax({
			type: "POST",
			url: "/chatting/getList.chat",
			data: {

				"roomIdx": roomseq
			},
			success: function(result) {
				for (let i = 0; i < result.length; i++) {
					let ajaxresult = JSON.parse(JSON.stringify(result[i]));

// 					$("#max").val(ajaxresult.max);
//					$("#roomseq").val(roomseq);
					//					$(".received_msg").append( "<div class = 'received_withd_msg'>"
					//					+ajaxresult.chatId+"</div>");
					if ("<%=userId%>" != ajaxresult.fromId) {

						$(".msg_history").append('<div class="incoming_msg">' +
							'<div class="incoming_msg_img">' +
							'<img src="https://ptetutorials.com/images/user-profile.png"alt="sunil">' +
							'</div>' +
							'<div class="received_msg" style =" padding:15px" >' +
							'<div class="received_withd_msg">' +
							'<span class="time_date">' + ajaxresult.fromId + '</span>' +
							'<p id = "plz">' + ajaxresult.contents + '</p>' +
							'<span class="time_date">' + ajaxresult.chatTime + '</span>' +
							'</div>' +
							'</div>' +
							'</div>');
					} else {
						$(".msg_history").append('<div class="outgoing_msg">' +
							'<div class="sent_msg">' +
							'<span class="time_date">' + ajaxresult.fromId + '</span>' +
							'<p id = "shit" style =" padding:10px" >' + ajaxresult.contents + '</p>' +
							'<span class="time_date">' + ajaxresult.chatTime + '</span>' +
							'</div>' +
							'</div>')
					}

					//					$(".outgoing_msg").append( "<div class='sent_msg'>"+
					//									'<p id = "shit">'+ajaxresult.contents+'</p>'+
					//							"</div>" );
					ajaxresult.contents = '';
					$("#max").val(ajaxresult.max);
					//					$("#chatList").append( ajaxresult.contents + " " + ajaxresult.toid );

				}
				$("#roomseq").val(roomseq);
				

			},
			error: function(result) {
				console.log(result);
			}

		});
		$("#contents").val('');
		


	}
	function submit() {
		// 전송 버튼을 누를 때 
		//	var fromid = $("#userid").val();
		//	var toid = $("#toid").val();
		//	var contents = $("#contents").val();
		var roomseq = $("#roomseq").val();
//		var fromid = 'tbdud98';
//		var toid = 'ahyun';
		var contents = $("#contents").val();

		$.ajax({
			type: "POST",
			url: "/chatting/write.chat",
			data: {
				"roomIdx": roomseq,
				"contents" : contents,
				"userId" : "<%=userId%>"
			},
			success: function(result) {
				if(result == ""){
					return false;
				}
				let ajaxresult = JSON.parse(JSON.stringify(result));
			},
			error: function(result) {
				console.log(result);
			}

		});
		$("#contents").val('');
// 		send();
		getInfinite();
		
		



	}




	function send() {
		var max = $("#max").val();

		var roomseq = $("#roomseq").val()

		$.ajax({
			type: "POST",
			url: "/chatting/getNewChat.chat",
			data: {

				"max": max,
				"roomIdx": roomseq
			},
			success: function(result) {
				if (result == "") {
					return false;
				}
				for (let i = 0; i < result.length; i++) {
					let ajaxresult = JSON.parse(JSON.stringify(result[i]));

					//					$(".received_msg").append( "<div class = 'received_withd_msg'>"
					//					+ajaxresult.chatId+"</div>");
					$("#max").val(ajaxresult.max);
					if ("<%=userId%>" != ajaxresult.fromId) {

						$(".msg_history").append('<div class="incoming_msg">' +
							'<div class="incoming_msg_img">' +
							'<img src="https://ptetutorials.com/images/user-profile.png"alt="sunil">' +
							'</div>' +
							'<div class="received_msg" style =" padding:15px" >' +
							'<div class="received_withd_msg">' +
							'<span class="time_date">' + ajaxresult.fromId + '</span>' +
							'<p id = "plz">' + ajaxresult.contents + '</p>' +
							'<span class="time_date">' + ajaxresult.chatTime + '</span>' +
							'</div>' +
							'</div>' +
							'</div>');
					} else {
						$(".msg_history").append('<div class="outgoing_msg">' +
							'<div class="sent_msg">' +
							'<span class="time_date" >' + ajaxresult.fromId + '</span>' +
							'<p id = "shit">' + ajaxresult.contents + '</p>' +
							'<span class="time_date">' + ajaxresult.chatTime + '</span>' +
							'</div>' +
							'</div>')
					}

					//					$(".outgoing_msg").append( "<div class='sent_msg'>"+
					//									'<p id = "shit">'+ajaxresult.contents+'</p>'+
					//							"</div>" );
					ajaxresult.contents = '';

				}
			
			},
			error: function(result) {
				console.log(result);
			}

		});
//		updateMaxValue(newMaxValue);
	}

	
</script>






<script type="text/javascript" src="/chatting/chat_js.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</html>