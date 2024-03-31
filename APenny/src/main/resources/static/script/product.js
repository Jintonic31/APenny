function goCategory(pcseq){
	var pcseq = pcseq;
	var tabPcseq = document.getElementById("tabPcseq" + pcseq);
	var listPcseq = document.getElementById("listPcseq" + pcseq);
	
	// 선택된 탭 색 초기화
	var allTab = document.querySelectorAll('.ptab');
	allTab.forEach(function(tab){
		tab.style.backgroundColor = 'white';
		tab.style.color = 'black';
	});
	
	// 선택된 탭 색 지정
	tabPcseq.style.backgroundColor = 'royalblue';
	tabPcseq.style.color = 'white';
	
	// #1 사용자가 pcseq가 2인 tab을 선택했을 때 매개변수의 pcseq는 2로 설정됨

	// #2 선택된 상품 카테고리 리스트 display none으로 초기화
	var allList = document.querySelectorAll(".productList");
	// var onePcseqList = document.querySelectorAll("listPcseq" + pcseq);
	allList.forEach(function(list){
		list.style.display = 'none';
	});
	
	// #3 매개변수 pcseq가 2로 이미 설정되어있으므로 selectedList에는 pcseq가 2인 상품들만 선택되어짐
	var selectedList = document.querySelectorAll("#listPcseq"+pcseq)
	// #4 모든 pcseq가 2인 상품들을 한개씩 꺼내 list에 차례대로 저장해 반복문 실행
	selectedList.forEach(function(list){
		// #5 모든 pcseq가 2인 상품들을 차례로 display flex로 변경
		list.style.display = 'flex';
	});
		
	
}

/*
// 상품 디테일 modal open 함수
function openModal(pdetailUrl){
	
	// 모달로 띄울 객체(?) 가져오기
	var modal = document.getElementById('pdModal');
	
	// 가져온 객체에서 모달창에 들어갈 내용 가져오기
	var modalContent = modal.querySelector('.modal-content');
	
	// ajax를 통해 상품 디테일 페이지 가져오기
	var xhr = new XMLHttpRequest();
	// ㄴ XMLHttpRequest() : 새로고침 없이 서버로부터 데이터를 가져와 웹페이지에 출력 가능한 객체
	//		ㄴ 비동기식이기 때문에 서버의 응답을 받을때까지 기다리지 않고 다른 작업을 수행할 수 있다.
	
	xhr.onreadystatechange = function(){
	// ㄴ onreadystatechange : xhr 객체의 상태가 변경될 때마다 호출되는 콜백 함수를 지정
	//		ㄴ 비동기식인 xhr 객체가 다른 일을 하다가 응답이 도착했을 때 해당 응답을 처리하기 위해 콜백 함수를 등록하는 것
	//		ㄴ 이 속성은 상태가 'DONE'일 때 서버로부터 응답을 받았을 때 처리할 콜백 함수를 지정한다
		
		if(xhr.readyState === XMLHttpRequest.DONE){
		// ㄴ 서버로부터 응답을 모두 받았고 요청이 '완료'(성공여부 X) 되었다면
		// ㄴ readyState : xhr 객체의 현재 상태를 나타내는 값을 갖는 속성
		// ㄴ XMLHttpRequest.DONE : 모든 데이터가 수신되고 요청이 완료되었음을 의미하는 상수
		
			if(xhr.status === 200){
			// ㄴ 요청이 '성공'했다면
			// ㄴ 200 : 서버가 요청을 성공적으로 처리했음을 나타내는 HTTP 응답상태 코드
				modalContent.innerHTML = xhr.responseText;
				// ㄴ xhr 객체 안에 의 텍스트 형식의 데이터로 modalContent 내용을 변경(innerHTML)하라
				// ㄴ innerHTML : HTML 엘리먼트 내부 HTML 코드를 설정하거나 반환하는 속성
				// ㄴ responseText : xhr 객체가 받은 서버의 응답 내용을 나타내는 속성
				
				modal.style.display = 'block';
				
			}else{
				alert('시스템 에러. 관리자에게 문의하세요.');
			}
		}
	
	};
	xhr.open('GET', pdetailUrl, true);
	// ㄴ GET 방식으로 해당 Url에 접근
	xhr.send();
	// ㄴ ajax 요청 보냄
}
*/



function goCart(){
	document.pdetail.action ="cartInsert";
	document.pdetail.submit();
}





