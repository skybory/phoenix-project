/**
 * 
 */
//function sendit(){
// 	let frm = document.joinForm;
// 	frm.submit();
// 	}
function chattingList() {
	// 전송 버튼을 누를 때 
	//	var fromid = $("#userid").val();
	//	var toid = $("#toid").val();
	//	var contents = $("#contents").val();

	var fromid = 'tbdud98';
	var prName = '과자';


	$.ajax({
		type: "POST",
		url: "/chatting/getRoomList.chat",
		data: {
			"userid": fromid,
			"contents": prName
		},
		success: function(result) {
			for (let i = 0; i < result.length; i++) {
				let ajaxresult = JSON.parse(JSON.stringify(result[i]));

				//					$(".received_msg").append( "<div class = 'received_withd_msg'>"
				//					+ajaxresult.chatId+"</div>");

				$("#max").val(ajaxresult.max);

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
	var fromid = 'tbdud98';
	var toid = 'ahyun';
	var contents = '살려조';
	$(".msg_history").empty();
	$.ajax({
		type: "POST",
		url: "/chatting/getList.chat",
		data: {
			"userid": fromid,
			"toid": toid,
			"contents": contents,
			"roomseq": roomseq
		},
		success: function(result) {
			for (let i = 0; i < result.length; i++) {
				let ajaxresult = JSON.parse(JSON.stringify(result[i]));

				$("#max").val(ajaxresult.max);
				//					$(".received_msg").append( "<div class = 'received_withd_msg'>"
				//					+ajaxresult.chatId+"</div>");
				if (fromid != ajaxresult.fromId) {

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
				//					$("#chatList").append( ajaxresult.contents + " " + ajaxresult.toid );

			}
			$("#roomseq").val(roomseq);

		},
		error: function(result) {
			console.log(result);
		}

	});
	$("#contents").val('');
		getInfinite();


}
function submit() {
	// 전송 버튼을 누를 때 
	//	var fromid = $("#userid").val();
	//	var toid = $("#toid").val();
	//	var contents = $("#contents").val();
	var roomseq = $("#roomseq").val();
	var fromid = 'tbdud98';
	var toid = 'ahyun';
	var contents = $("#contents").val();

	$.ajax({
		type: "POST",
		url: "/chatting/write.chat",
		data: {
			"roomseq": roomseq,
			"userid": fromid,
			"toid": toid,
			"contents": contents
		},
		success: function(result) {
			$("#max").val(ajaxresult.max);
		},
		error: function(result) {
			console.log(result);
		}

	});
	$("#contents").val('');



}




function send() {
	//	alert("test");
	//	var fromid = $("#userid").val();
	//	var toid = $("#toid").val();
	//	var contents = $("#contents").val();
	var max = $("#max").val();

	var fromid = 'tbdud98';
	var toid = 'ahyun';
	var contents = '살려조';
	var roomseq = $("#roomseq").val()

	console.log("제대로좀 나와봐..: " + max);



	$.ajax({
		type: "POST",
		url: "/chatting/getNewChat.chat",
		data: {

			"max": max,
			"userid": fromid,
			"toid": toid,
			"contents": contents,
			"roomseq": roomseq
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
				if (fromid != ajaxresult.fromId) {

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
//	updateMaxValue(newMaxValue);
}

function updateMaxValue(){
	 $("#max").val(newMaxValue);
}
