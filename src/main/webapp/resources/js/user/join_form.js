window.onload = () => {
	const passwordInput = document.getElementById("userPassword");
	const confirmInput = document.getElementById("userPasswordConfirm");

	// 1. 비밀번호 복잡도 검사
	if (passwordInput) {
		passwordInput.onblur = function () {
			const pwd = this.value;
			const result = document.getElementById("checkPasswdResult");

			const pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%])[A-Za-z\d!@#$%]{8,16}$/;
			if (!pattern.test(pwd)) {
				result.innerText = "영문자, 숫자, 특수문자(!@#$%) 조합 8 ~ 16글자 필수!";
				result.style.color = "red";
			} else {
				if (pwd.length >= 12) {
					result.innerText = "안전";
					result.style.color = "green";
				} else if (pwd.length >= 10) {
					result.innerText = "보통";
					result.style.color = "orange";
				} else {
					result.innerText = "위험";
					result.style.color = "red";
				}
			}
		};
	}

	// 2. 비밀번호 확인
	if (confirmInput) {
		confirmInput.onblur = function () {
			const pwd = passwordInput?.value || "";
			const pwd2 = this.value;
			const result = document.getElementById("checkPasswd2Result");

			if (pwd === pwd2) {
				result.innerText = "비밀번호 확인 완료!";
				result.style.color = "green";
			} else {
				result.innerText = "비밀번호 다름!";
				result.style.color = "red";
			}
		};
	}

	// 3. 주소 검색 API
	const btn = document.getElementById("btnSearchAddress");
	if (btn) {
		btn.onclick = function () {
			new daum.Postcode({
				oncomplete: function (data) {
					const address = data.buildingName
						? '${data.address} (${data.buildingName})'
						: data.address;

					document.getElementById("userPostcode").value = data.zonecode;
					document.getElementById("userAddress1").value = address;
					document.getElementById("userAddress2").focus();
				}
			}).open();
		};
	}
};

// 이메일 검증
function confirmEmailAuth() {
	const resultSpan = document.getElementById("email-auth-result");
	resultSpan.innerText = "인증이 완료되었습니다!";
	resultSpan.style.color = "green";
}
