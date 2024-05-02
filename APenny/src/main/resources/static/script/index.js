$(function(){
	$('.Banner').slick({
	  arrows: false,
	  dots: false,
	  infinite: true,
	  speed: 200,
	  slidesToShow: 1,
	  adaptiveHeight: true,
	  autoplay:true
	});
});


function deleteAllCart(){
	 $.ajax({
        url: "/deleteAllCart",
        type: "GET",
        success: function(res) {
            // 성공적으로 요청을 보낸 후 할 작업
            console.log("요청 성공");
            location.href = '/'
        },
        error: function(xhr, sts, err) {
            // 요청이 실패한 경우 처리
            console.error("요청 실패");
        }
    });
}




