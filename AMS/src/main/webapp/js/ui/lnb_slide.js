// JavaScript Document
$(document).ready(function(){
//LNB 슬라이드
$('.lnbMenu > li > a').removeClass("selected");

	$('.lnbMenu > li > a').click(function(){
		if( $(this).next().is(':hidden') ) {			
			$('.lnbMenu > li > a').removeClass('active').next().slideUp("fast");
			$(this).toggleClass('active').next().slideDown("fast");
			$('.lnbMenu > li > ul > li > a').removeClass('active').next().slideUp("fast");
		}else{
			$(this).removeClass('active').next().slideUp("");
			$('.lnbMenu > li > ul > li > a').removeClass('active').next().slideUp("fast");
		}
		return false;
	});

  

});