/*
function rewardYN(pmseq){
	var pmseq = pmseq;
	if(pmseq = 4){
		$.ajax({
		url : '/kakaopay',
		type : 'POST',
		
		// 콜백함수 = /kakaopay가 끝까지 에러없이 성공하면 호출됨
		success : function(res){
			console.log('서버 응답 : ', res);
		},
		error : function(xhr, sts, err){
			console.error('AJAX 에러 : ', err);
		}
	});
	}
}
*/

/*
$(function(){
	$('#payment4').click(function(){
		$.ajax({
			url : '/kakaopay',
			dataType : 'json',
			
			success : function(res){
				alert(res);
			},
			error:function(err){
				alert(err);
			}
		});
	});
});
*/


$(document).ready(function(){
	
	// 멤버십 번호 입력 코드
	$('.onenumber').click(function(event){
		var buttonValue = $(this).val();
		// ㄴ 클릭한 버튼의 값을 가져오기
		var selectTel2 = $('input[name="tel2"]');
		// ㄴ 번호 입력 input 태그 선택
		var nowTel2Val = selectTel2.val();
		// ㄴ 현재 번호 입력 input 태그 값 가져오기
		selectTel2.val(nowTel2Val + buttonValue);
		// ㄴ 현재 번호 입력 input 태그 값에 클릭한 버튼 값을 문자열 연결 시킴
		
		$.ajax({
			type: 'POST',
			url: '/updateTel2',
			data: {tel2Value: selectTel2.val()},
			success: function(res){
				console.log("번호 전송 성공");
			},
			error: function(xht, sts, err){
				console.log("번호 전송 실패 : " + err);
			}
		});
		
		event.preventDefault();
		
		return false;
	});
});

// 번호 backspace 함수
$(document).ready(function(){
	// 멤버십 번호 backspace 코드
	$('#deleteNum').click(function(event){
		var selectTel2 = $('input[name="tel2"]');
		//	ㄴ 번호 입력 input 태그 선택
		var nowTel2Val = selectTel2.val();
		//	ㄴ 현재 번호 입력 input 태그 값 가져오기
		var deleteValue = nowTel2Val.slice(0, -1);
		//	ㄴ 현재 번호 입력 input 태그 값의 제일 끝 문자열 제거
		selectTel2.val(deleteValue);
		//	ㄴ 삭제된 새로운 번호 값으로 번호 입력 input 태그 값 설정
		
		$.ajax({
			type: 'POST',
			url:'/updateTel2',
			data: {tel2Value: selectTel2.val()},
			success: function(res){
				console.log("번호 삭제 성공");
			},
			error: function(xhr, sts, err){
				console.log("번호 삭제 실패 : " + err);
			}
		});
		
		event.preventDefault();
		
		return false;
	});
});



function gofindMember(){
	
	var selectTel2 = $('input[name="tel2"]');
	//	ㄴ 번호 입력 input 태그 선택
	var nowTel2Val = selectTel2.val();
	//	ㄴ 현재 번호 입력 input 태그 값 가져오기
	
	// console.log("tel2 값 : " + nowTel2Val);
	
	$.ajax({
		url : '/findMember',
		type : 'POST',
		data : {tel2Value : selectTel2.val()},
		success : function(res){
			console.log('서버로 전송 성공 : '+ res);
			var miniModal = document.getElementById("mshipMsg");
			miniModal.style.display = "flex";
		},
		error : function(xht, sts, err){
			console.log('서버로 전송 실패 : ' + err);
		}
	})
}



function goRetype(){
	var miniModal = document.getElementById("mshipMsg");
	miniModal.style.display = "none";
}