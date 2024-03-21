function previewImages(event) {
	var fileList = event.target.files;
	var imageContainer = document.getElementById('image-preview');

	imageContainer.innerHTML = '';

	for (var i = 0; i < fileList.length; i++) {
		var file = fileList[i];
		var img = document.createElement('img');
		img.classList.add('preview-image');
		img.file = file;
		img.style.width = '150px';
		img.style.height = 'auto';
		imageContainer.appendChild(img);

		var reader = new FileReader();
		reader.onload = (function(aImg) {
			return function(e) {
				aImg.src = e.target.result;
			};
		})(img);

		reader.readAsDataURL(file);
	}
}

function toggleInterest() {
	let isIncreased = false;
 
	let productInterestCount = 34;
	let productId = 102;
	let interest = 1;
 
	$.ajax({
		type: 'POST',
		url: '/product/DecreaseInterest.pr?productId=154',
		data: {
			"productId": productId,
			"productInterestCount": productInterestCount,
			"interest": interest
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

document.getElementById("productDealType").addEventListener("change", function() {
    var dealType = this.value; // 선택한 거래 방식

    // 거래 방식이 "나눔하기"인 경우
    if (dealType === "share") {
        document.getElementById("productPrice").value = "0"; // 가격 입력 필드에 0 설정
        document.getElementById("productPrice").disabled = true; // 가격 입력 필드 비활성화
    } else {
        document.getElementById("productPrice").value = ""; // 가격 입력 필드 비우기
        document.getElementById("productPrice").disabled = false; // 가격 입력 필드 활성화
    }
});

function addInterest() {
	var interestCountElement = document.getElementById("interestCount");
	var currentCount = parseInt(interestCountElement.innerText);
	var newCount = currentCount + 1;
	interestCountElement.innerText = newCount;
}

// 구매하기 버튼 클릭 이벤트 핸들러
document.getElementById('purchaseBtn').addEventListener('click', function() {
	$('#purchaseModal').modal('show');
});

// 구매 확인 버튼 클릭 이벤트 핸들러
document.querySelector('.modal-footer .btn-secondary').addEventListener('click', function() {
	// 모달 닫기
	$('#purchaseModal').modal('hide');
});
document.getElementById("confirmPurchaseBtn").addEventListener("click", function() {
	// "구매" 버튼을 클릭했을 때 실행될 코드
	var productIdx = document.getElementById('productIdx').value;
	var url = "/user/PurchaseProductAction.us?productIdx=" + productIdx;
	window.location.href = url;
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

function sendit() {
	joinForm.submit();
}
 function shortenAddress() {
    var addressElement = document.getElementById('productLocation');
    if (addressElement.innerText.length > 5) {
        addressElement.innerText = addressElement.innerText.substring(0, 5) + '...';
    }
}

window.addEventListener('load', function() {
    shortenAddress();
});
