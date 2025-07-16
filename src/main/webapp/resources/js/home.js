/**
 * 
 */

/**  Opens sub-navigation on hover  마우스를 올리면 하위 탐색이 열립니다. */
window.onload = () => {
	const flexItem2 = document.getElementById('flex-item2');
	const subNav = document.getElementById('sub-nav');
	
	flexItem2.addEventListener('mouseenter', () => {
	    subNav.style.display = 'flex';
	});
	subNav.addEventListener('mouseenter', () => {
	    subNav.style.display = 'flex';
	});
	subNav.addEventListener('mouseleave', () => {
	    subNav.style.display = 'none';
	});
	
	function logout() {
		// confirm() 함수 활용하여 "로그아웃하시겠습니까?" 질문을 통해
		// 확인 버튼 클릭 시 "MemberLogout" 페이지로 이동 처리
		if(confirm("로그아웃하시겠습니까?")) {
			location.href = "/member/logout";
		}
	}
	
	$(function() {
		let timer;
 		let count = 600;
//		let count = 10;
		
			function updateCountdown() {
				let minutes = Math.floor(count / 60);
				let seconds = count % 60;
				let displayCount = 
					(minutes < 10 ? "0" + minutes : minutes) + ":"
					+ (seconds < 10 ? "0" + seconds : seconds);
				$("#countdow").text(displayCount);
				if(count > 0) {
					count--;
					
				}
				else {
					
					clearInterval(timer);
				}
			
			}
		timer = setInterval(updateCoundown, 1000);
		updateCountdown();
	});
}
