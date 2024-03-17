<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
}
</style>



</head>



<body>



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
								<input type="text" class="search-bar" placeholder="Search"
									name="userid" id="userid"> <input type="text"
									class="search-bar" placeholder="Search" name="toid" id="toid">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
						
						
						
			
						
					</div>
				</div>

				<div class="mesgs">
					<div class="msg_history">
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img >
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
							</div>
						</div>

					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" id="contents"
								placeholder="Type a message" name="contents" />
							<button class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane-o" aria-hidden="true" onclick="submit()"><img
									src="send.png"> </i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input id="max" type="hidden" name="max" />
		<input id="roomseq" type="hidden" name="roomseq" />


	</form>



</body>
<script type="text/javascript">
	window.onload = function(){
		chattingList();	
//		getInfinite();
	}
	
	function getInfinite() {
	    setTimeout(function() {
	        clearInterval(intervalId); // 30초 후에 setInterval을 중지합니다.
	    }, 30000);

	    var intervalId = setInterval(function() {
	        send();
	    }, 3000);
	}
	
	
</script>



<script type="text/javascript" src="/chatting/chat_js.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</html>