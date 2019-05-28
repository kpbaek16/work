<%@ page pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var lastEvent = null;
		var slide = ".lnbMenu > li > ul";
		var alink = ".lnbMenu > li > a";

		function accordion() {
			if (this == lastEvent)
				return false;
			lastEvent = this;
			setTimeout(function() {
				lastEvent = null
			}, 200);

			if ($(this).attr('class') != 'active') {
				$(slide).slideUp();
				$(this).next(slide).slideDown();
				$(alink).removeClass('active');
				$(this).addClass('active');
			} else if ($(this).next(slide).is(':hidden')) {
				$(slide).slideUp();
				$(this).next(slide).slideDown();
			} else {
				$(this).next(slide).slideUp();
			}
		}
		$(alink).click(accordion).focus(accordion);
		$('.lnbMenu> li:last > a').addClass('active');
	});
</script>
<!-- //lnb-->

<!-- 메뉴활성화속성-->
<script>
	var $onMenu;
	$(document).ready(function(e) {
		$onMenu = $(".lnbMenu>li a");
		$onMenu.removeClass("selected");
		//$onMenu.bind("mouseover",onClick);
		$onMenu.bind("click", onClick);

		function onClick() {
			$onMenu.removeClass("selected");
			$(this).addClass("selected");
		}
	});
</script>
<script>
	var $onMenu;
	$(document).ready(function(e) {
		$onsubMenu = $(".lnbSub_list li a");
		$onsubMenu.removeClass("sub_selected");

		$onsubMenu.bind("click", onClick);
		//$onsubMenu.bind("mouseenter",onClick);

		function onClick() {
			$onsubMenu.removeClass("sub_selected");
			$(this).addClass("sub_selected");

		}
	});
</script>