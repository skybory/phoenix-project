/**
 * 
 */

// 세션에 저장된 값 얻어오기 get
//function gi() {
//	$.ajax({
//		type: 'POST',
//		url: '/product/ViewInterest.pr',// 이거 바꾸고
//		//프론트컨트롤러에 보내는 url
//		data: {
//			"proId": productId, //세션에서 받아온 id값이 오른쪽에
//			"interestCount": interestCount
//		},
//		success: function(result) {
//
//			let ajaxresult = JSON.parse(JSON.stringify(result));
//			// 				             $("#max").val(ajaxresult.max);
//			$("#max").val(ajaxresult.inter);
//			//결과
//
//
//		},
//		error: function(result) {
//			console.log(result);
//		}
//	});


//}

// 세션에 값 저장하기 set

function toggleInterest() {
	let isIncreased = false;
//	let interestCount = session.setAttribute("productInterestCount", productInterestCouont );
//	let productId = session.setAttribute("productId", productId);
	// 세션에서 값 받아오기 태연님께 모르는거 물어보기
let productInterestCount = 34; 
let productId = 102;
let interest = 1;
//	if (!isIncreased) {
//		interestCount++; // 관심 수 증가
//		isIncreased = true;

//		$.ajax({
//			type: 'POST',
//			url: '/product/DecreaseInterest.pr',
//			//프론트컨트롤러에 보내는 url
//			data: {
//				"productId": productId, //세션에서 받아온 id값이 오른쪽에
//				"interestCount": interestCount
//			},
//			success: function(result) {
//				let ajaxresult = JSON.parse(JSON.stringify(result));
//				// 				             $("#max").val(ajaxresult.max);
//				$("#plu").val(ajaxresult.inter);
//
//			},
//			error: function(result) {
//				console.log(result);
//			}
//
//		});
//	} else {
//		if (productInterestCount > 0) {
//			productInterestCount--; // 관심 수 감소
//		}
//		isIncreased = false;

		$.ajax({
			type: 'POST',
			url: '/product/DecreaseInterest.pr?productId=154',
			data: {
				"productId": productId,
				"productInterestCount": productInterestCount,
				"interest" : interest
			},
			success: function(result) {

				let ajaxresult = JSON.parse(JSON.stringify(result));
				// 				             $("#max").val(ajaxresult.max);
				$("#interest").val(ajaxresult.interest);

			},
			error: function(result) {
				console.log(result);
			}
		}

		);
	}

//}


