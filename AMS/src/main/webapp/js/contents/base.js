
// JavaScript Document

$(document).ready(function(){

// layer_popup
	$("#sub_wrap .layer_open").each(function() {
		$(this).click(function() {
			//해당 레이어(ID) 노출
			$(".layer_popup").show();
			var layerBox = $(this).attr("href"); 
			$(layerBox).show(); 
			// layer_popup(화면 중앙정렬)
			var width_size = $(".layer_box").innerWidth()/2;
			$(".layer_box").css("margin-left",-width_size);
			$("body").css("overflow-y","hidden");
		});		

		// layer_popup(닫기버튼 실행)
		$(".layer_close").click(function() {
			$(".layer_box").hide();
			$(".layer_popup").hide();
			$("body").css("overflow-y","auto");
		});
		
		$(".layer_close2").click(function() {
			$(".layer_box").hide();
			$(".layer_popup").hide();
			$("body").css("overflow-y","auto");
		});
		$(".popnext").click(function() {
			$("#layer02").hide();		
		});	
		$(".popnext_je").click(function() {
			$("#layer01").hide();		
		});
		// layer_popup(화면 중앙정렬)
		var width_size = $(".layer_box").innerWidth()/2;
		$(".layer_box").css("margin-left",-width_size);
	});




// 시스템관리 토글버튼
	$(function(){
		$('#btn_minus').hide();
		$('#btn_plus').click(function(){
			$('.table_view').hide();
			$('.table_remove').hide();
			$('.cha_btn_sys').hide();
			$('.sys_btn_area').hide();
			$('#btn_plus').hide();
			$('#btn_minus').show();
			$('.btn_hide').hide();
		});	
		$('#btn_minus').click(function(){
			$('.sys_btn_area').hide();
			$('.cha_btn_sys').show();
			$('.table_view').show();
			$('#btn_plus').show();
			$('#btn_minus').hide();
			$('.btn_hide').show();
		});
	});
	
	$(function(){
		$('#btn_minus2').hide();
		$('#btn_plus2').click(function(){
			$('.sys_btn_area2').hide();
			$('.table_view2').hide();
			$('.table_remove2').hide();
			$('.cha_btn_sys2').hide();
			$('#btn_plus2').hide();
			$('#btn_minus2').show();
			$('.btn_hide2').hide();
		});	
		$('#btn_minus2').click(function(){
			$('.sys_btn_area2').hide();
			$('.cha_btn_sys2').show();
			$('.table_view2').show();
			$('#btn_plus2').show();
			$('#btn_minus2').hide();
			$('.btn_hide2').show();
		});
	});
	$(function(){
		$('#btn_minus3').hide();
		$('#btn_plus3').click(function(){
			$('.sys_btn_area3').hide();
			$('.table_view3').hide();
			$('.table_remove3').hide();
			$('.cha_btn_sys3').hide();
			$('#btn_plus3').hide();
			$('#btn_minus3').show();
			$('.btn_hide3').hide();
		});	
		$('#btn_minus3').click(function(){
			$('.sys_btn_area3').hide();
			$('.cha_btn_sys3').show();
			$('.table_view3').show();
			$('#btn_plus3').show();
			$('#btn_minus3').hide();
			$('.btn_hide3').show();
		});
	});
	$(function(){
		$('#btn_minus4').hide();
		$('#btn_plus4').click(function(){
			$('.sys_btn_area4').hide();
			$('.table_view4').hide();
			$('.table_remove4').hide();
			$('.cha_btn_sys4').hide();
			$('#btn_plus4').hide();
			$('#btn_minus4').show();
			$('.btn_hide4').hide();
		});	
		$('#btn_minus4').click(function(){
			$('.sys_btn_area4').hide();
			$('.cha_btn_sys4').show();
			$('.table_view4').show();
			$('#btn_plus4').show();
			$('#btn_minus4').hide();
			$('.btn_hide4').show();
		});
	});
	$(function(){
		$('#btn_minus5').hide();
		$('#btn_plus5').click(function(){
			$('.sys_btn_area5').hide();
			$('.table_view5').hide();
			$('.table_remove5').hide();
			$('.cha_btn_sys5').hide();
			$('#btn_plus5').hide();
			$('#btn_minus5').show();
			$('.btn_hide5').hide();
		});	
		$('#btn_minus5').click(function(){
			$('.sys_btn_area5').hide();
			$('.cha_btn_sys5').show();
			$('.table_view5').show();
			$('#btn_plus5').show();
			$('#btn_minus5').hide();
			$('.btn_hide5').show();
		});
	});
	
	$(function(){
		$('#btn_minus6').hide();
		$('#btn_plus6').click(function(){
			$('.sys_btn_area6').hide();
			$('.table_view6').hide();
			$('.table_remove6').hide();
			$('.cha_btn_sys6').hide();
			$('#btn_plus6').hide();
			$('#btn_minus6').show();
			$('.btn_hide6').hide();
		});	
		$('#btn_minus6').click(function(){
			$('.sys_btn_area6').hide();
			$('.cha_btn_sys6').show();
			$('.table_view6').show();
			$('#btn_plus6').show();
			$('#btn_minus6').hide();
			$('.btn_hide6').show();
		});
	});
	
	$(function(){
		$('#btn_minus7').hide();
		$('#btn_plus7').click(function(){
			$('.sys_btn_area7').hide();
			$('.table_view7').hide();
			$('.table_remove7').hide();
			$('.cha_btn_sys7').hide();
			$('#btn_plus7').hide();
			$('#btn_minus7').show();
			$('.btn_hide7').hide();
		});	
		$('#btn_minus7').click(function(){
			$('.sys_btn_area7').hide();
			$('.cha_btn_sys7').show();
			$('.table_view7').show();
			$('#btn_plus7').show();
			$('#btn_minus7').hide();
			$('.btn_hide7').show();
		});
	});
	
	$(function(){
		$('#btn_minus8').hide();
		$('#btn_plus8').click(function(){
			$('.sys_btn_area8').hide();
			$('.table_view8').hide();
			$('.table_remove8').hide();
			$('.cha_btn_sys8').hide();
			$('#btn_plus8').hide();
			$('#btn_minus8').show();
			$('.btn_hide8').hide();
		});	
		$('#btn_minus8').click(function(){
			$('.sys_btn_area8').hide();
			$('.cha_btn_sys8').show();
			$('.table_view8').show();
			$('#btn_plus8').show();
			$('#btn_minus8').hide();
			$('.btn_hide8').show();
		});
	});
	
	$(function(){
		$('#btn_minus9').hide();
		$('#btn_plus9').click(function(){
			$('.sys_btn_area9').hide();
			$('.table_view9').hide();
			$('.table_remove9').hide();
			$('.cha_btn_sys9').hide();
			$('#btn_plus9').hide();
			$('#btn_minus9').show();
			$('.btn_hide9').hide();
		});	
		$('#btn_minus9').click(function(){
			$('.sys_btn_area9').hide();
			$('.cha_btn_sys9').show();
			$('.table_view9').show();
			$('#btn_plus9').show();
			$('#btn_minus9').hide();
			$('.btn_hide9').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_1').hide();
		$('#btn_plus_tab2_1').click(function(){
			$('.sys_btn_area_tab2_1').hide();
			$('.table_view_tab2_1').hide();
			$('.table_remove_tab2_1').hide();
			$('.cha_btn_sys_tab2_1').hide();
			$('#btn_plus_tab2_1').hide();
			$('#btn_minus_tab2_1').show();
			$('.btn_hide_tab2_1').hide();
		});	
		$('#btn_minus_tab2_1').click(function(){
			$('.sys_btn_area_tab2_1').hide();
			$('.cha_btn_sys_tab2_1').show();
			$('.table_view_tab2_1').show();
			$('#btn_plus_tab2_1').show();
			$('#btn_minus_tab2_1').hide();
			$('.btn_hide_tab2_1').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_2').hide();
		$('#btn_plus_tab2_2').click(function(){
			$('.sys_btn_area_tab2_2').hide();
			$('.table_view_tab2_2').hide();
			$('.table_remove_tab2_2').hide();
			$('.cha_btn_sys_tab2_2').hide();
			$('#btn_plus_tab2_2').hide();
			$('#btn_minus_tab2_2').show();
			$('.btn_hide_tab2_2').hide();
		});	
		$('#btn_minus_tab2_2').click(function(){
			$('.sys_btn_area_tab2_2').hide();
			$('.cha_btn_sys_tab2_2').show();
			$('.table_view_tab2_2').show();
			$('#btn_plus_tab2_2').show();
			$('#btn_minus_tab2_2').hide();
			$('.btn_hide_tab2_2').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_3').hide();
		$('#btn_plus_tab2_3').click(function(){
			$('.sys_btn_area_tab2_3').hide();
			$('.table_view_tab2_3').hide();
			$('.table_remove_tab2_3').hide();
			$('.cha_btn_sys_tab2_3').hide();
			$('#btn_plus_tab2_3').hide();
			$('#btn_minus_tab2_3').show();
			$('.btn_hide_tab2_3').hide();
		});	
		$('#btn_minus_tab2_3').click(function(){
			$('.sys_btn_area_tab2_3').hide();
			$('.cha_btn_sys_tab2_3').show();
			$('.table_view_tab2_3').show();
			$('#btn_plus_tab2_3').show();
			$('#btn_minus_tab2_3').hide();
			$('.btn_hide_tab2_3').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_4').hide();
		$('#btn_plus_tab2_4').click(function(){
			$('.sys_btn_area_tab2_4').hide();
			$('.table_view_tab2_4').hide();
			$('.table_remove_tab2_4').hide();
			$('.cha_btn_sys_tab2_4').hide();
			$('#btn_plus_tab2_4').hide();
			$('#btn_minus_tab2_4').show();
			$('.btn_hide_tab2_4').hide();
		});	
		$('#btn_minus_tab2_4').click(function(){
			$('.sys_btn_area_tab2_4').hide();
			$('.cha_btn_sys_tab2_4').show();
			$('.table_view_tab2_4').show();
			$('#btn_plus_tab2_4').show();
			$('#btn_minus_tab2_4').hide();
			$('.btn_hide_tab2_4').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_5').hide();
		$('#btn_plus_tab2_5').click(function(){
			$('.sys_btn_area_tab2_5').hide();
			$('.table_view_tab2_5').hide();
			$('.table_remove_tab2_5').hide();
			$('.cha_btn_sys_tab2_5').hide();
			$('#btn_plus_tab2_5').hide();
			$('#btn_minus_tab2_5').show();
			$('.btn_hide_tab2_5').hide();
		});	
		$('#btn_minus_tab2_5').click(function(){
			$('.sys_btn_area_tab2_5').hide();
			$('.cha_btn_sys_tab2_5').show();
			$('.table_view_tab2_5').show();
			$('#btn_plus_tab2_5').show();
			$('#btn_minus_tab2_5').hide();
			$('.btn_hide_tab2_5').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_6').hide();
		$('#btn_plus_tab2_6').click(function(){
			$('.sys_btn_area_tab2_6').hide();
			$('.table_view_tab2_6').hide();
			$('.table_remove_tab2_6').hide();
			$('.cha_btn_sys_tab2_6').hide();
			$('#btn_plus_tab2_6').hide();
			$('#btn_minus_tab2_6').show();
			$('.btn_hide_tab2_6').hide();
		});	
		$('#btn_minus_tab2_6').click(function(){
			$('.sys_btn_area_tab2_6').hide();
			$('.cha_btn_sys_tab2_6').show();
			$('.table_view_tab2_6').show();
			$('#btn_plus_tab2_6').show();
			$('#btn_minus_tab2_6').hide();
			$('.btn_hide_tab2_6').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_7').hide();
		$('#btn_plus_tab2_7').click(function(){
			$('.sys_btn_area_tab2_7').hide();
			$('.table_view_tab2_7').hide();
			$('.table_remove_tab2_7').hide();
			$('.cha_btn_sys_tab2_7').hide();
			$('#btn_plus_tab2_7').hide();
			$('#btn_minus_tab2_7').show();
			$('.btn_hide_tab2_7').hide();
		});	
		$('#btn_minus_tab2_7').click(function(){
			$('.sys_btn_area_tab2_7').hide();
			$('.cha_btn_sys_tab2_7').show();
			$('.table_view_tab2_7').show();
			$('#btn_plus_tab2_7').show();
			$('#btn_minus_tab2_7').hide();
			$('.btn_hide_tab2_7').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_8').hide();
		$('#btn_plus_tab2_8').click(function(){
			$('.sys_btn_area_tab2_8').hide();
			$('.table_view_tab2_8').hide();
			$('.table_remove_tab2_8').hide();
			$('.cha_btn_sys_tab2_8').hide();
			$('#btn_plus_tab2_8').hide();
			$('#btn_minus_tab2_8').show();
			$('.btn_hide_tab2_8').hide();
		});	
		$('#btn_minus_tab2_8').click(function(){
			$('.sys_btn_area_tab2_8').hide();
			$('.cha_btn_sys_tab2_8').show();
			$('.table_view_tab2_8').show();
			$('#btn_plus_tab2_8').show();
			$('#btn_minus_tab2_8').hide();
			$('.btn_hide_tab2_8').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_9').hide();
		$('#btn_plus_tab2_9').click(function(){
			$('.sys_btn_area_tab2_9').hide();
			$('.table_view_tab2_9').hide();
			$('.table_remove_tab2_9').hide();
			$('.cha_btn_sys_tab2_9').hide();
			$('#btn_plus_tab2_9').hide();
			$('#btn_minus_tab2_9').show();
			$('.btn_hide_tab2_9').hide();
		});	
		$('#btn_minus_tab2_9').click(function(){
			$('.sys_btn_area_tab2_9').hide();
			$('.cha_btn_sys_tab2_9').show();
			$('.table_view_tab2_9').show();
			$('#btn_plus_tab2_9').show();
			$('#btn_minus_tab2_9').hide();
			$('.btn_hide_tab2_9').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_10').hide();
		$('#btn_plus_tab2_10').click(function(){
			$('.sys_btn_area_tab2_10').hide();
			$('.table_view_tab2_10').hide();
			$('.table_remove_tab2_10').hide();
			$('.cha_btn_sys_tab2_10').hide();
			$('#btn_plus_tab2_10').hide();
			$('#btn_minus_tab2_10').show();
			$('.btn_hide_tab2_10').hide();
		});	
		$('#btn_minus_tab2_10').click(function(){
			$('.sys_btn_area_tab2_10').hide();
			$('.cha_btn_sys_tab2_10').show();
			$('.table_view_tab2_10').show();
			$('#btn_plus_tab2_10').show();
			$('#btn_minus_tab2_10').hide();
			$('.btn_hide_tab2_10').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_11').hide();
		$('#btn_plus_tab2_11').click(function(){
			$('.sys_btn_area_tab2_11').hide();
			$('.table_view_tab2_11').hide();
			$('.table_remove_tab2_11').hide();
			$('.cha_btn_sys_tab2_11').hide();
			$('#btn_plus_tab2_11').hide();
			$('#btn_minus_tab2_11').show();
			$('.btn_hide_tab2_11').hide();
		});	
		$('#btn_minus_tab2_11').click(function(){
			$('.sys_btn_area_tab2_11').hide();
			$('.cha_btn_sys_tab2_11').show();
			$('.table_view_tab2_11').show();
			$('#btn_plus_tab2_11').show();
			$('#btn_minus_tab2_11').hide();
			$('.btn_hide_tab2_11').show();
		});
	});

	$(function(){
		$('#btn_minus_tab2_12').hide();
		$('#btn_plus_tab2_12').click(function(){
			$('.sys_btn_area_tab2_12').hide();
			$('.table_view_tab2_12').hide();
			$('.table_remove_tab2_12').hide();
			$('.cha_btn_sys_tab2_12').hide();
			$('#btn_plus_tab2_12').hide();
			$('#btn_minus_tab2_12').show();
			$('.btn_hide_tab2_12').hide();
		});	
		$('#btn_minus_tab2_12').click(function(){
			$('.sys_btn_area_tab2_12').hide();
			$('.cha_btn_sys_tab2_12').show();
			$('.table_view_tab2_12').show();
			$('#btn_plus_tab2_12').show();
			$('#btn_minus_tab2_12').hide();
			$('.btn_hide_tab2_12').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_1').hide();
		$('#btn_plus_tab3_1').click(function(){
			$('.sys_btn_area_tab3_1').hide();
			$('.table_view_tab3_1').hide();
			$('.table_remove_tab3_1').hide();
			$('.cha_btn_sys_tab3_1').hide();
			$('#btn_plus_tab3_1').hide();
			$('#btn_minus_tab3_1').show();
			$('.btn_hide_tab3_1').hide();
		});	
		$('#btn_minus_tab3_1').click(function(){
			$('.sys_btn_area_tab3_1').hide();
			$('.cha_btn_sys_tab3_1').show();
			$('.table_view_tab3_1').show();
			$('#btn_plus_tab3_1').show();
			$('#btn_minus_tab3_1').hide();
			$('.btn_hide_tab3_1').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_2').hide();
		$('#btn_plus_tab3_2').click(function(){
			$('.sys_btn_area_tab3_2').hide();
			$('.table_view_tab3_2').hide();
			$('.table_remove_tab3_2').hide();
			$('.cha_btn_sys_tab3_2').hide();
			$('#btn_plus_tab3_2').hide();
			$('#btn_minus_tab3_2').show();
			$('.btn_hide_tab3_2').hide();
		});	
		$('#btn_minus_tab3_2').click(function(){
			$('.sys_btn_area_tab3_2').hide();
			$('.cha_btn_sys_tab3_2').show();
			$('.table_view_tab3_2').show();
			$('#btn_plus_tab3_2').show();
			$('#btn_minus_tab3_2').hide();
			$('.btn_hide_tab3_2').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_3').hide();
		$('#btn_plus_tab3_3').click(function(){
			$('.sys_btn_area_tab3_3').hide();
			$('.table_view_tab3_3').hide();
			$('.table_remove_tab3_3').hide();
			$('.cha_btn_sys_tab3_3').hide();
			$('#btn_plus_tab3_3').hide();
			$('#btn_minus_tab3_3').show();
			$('.btn_hide_tab3_3').hide();
		});	
		$('#btn_minus_tab3_3').click(function(){
			$('.sys_btn_area_tab3_3').hide();
			$('.cha_btn_sys_tab3_3').show();
			$('.table_view_tab3_3').show();
			$('#btn_plus_tab3_3').show();
			$('#btn_minus_tab3_3').hide();
			$('.btn_hide_tab3_3').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_4').hide();
		$('#btn_plus_tab3_4').click(function(){
			$('.sys_btn_area_tab3_4').hide();
			$('.table_view_tab3_4').hide();
			$('.table_remove_tab3_4').hide();
			$('.cha_btn_sys_tab3_4').hide();
			$('#btn_plus_tab3_4').hide();
			$('#btn_minus_tab3_4').show();
			$('.btn_hide_tab3_4').hide();
		});	
		$('#btn_minus_tab3_4').click(function(){
			$('.sys_btn_area_tab3_4').hide();
			$('.cha_btn_sys_tab3_4').show();
			$('.table_view_tab3_4').show();
			$('#btn_plus_tab3_4').show();
			$('#btn_minus_tab3_4').hide();
			$('.btn_hide_tab3_4').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_5').hide();
		$('#btn_plus_tab3_5').click(function(){
			$('.sys_btn_area_tab3_5').hide();
			$('.table_view_tab3_5').hide();
			$('.table_remove_tab3_5').hide();
			$('.cha_btn_sys_tab3_5').hide();
			$('#btn_plus_tab3_5').hide();
			$('#btn_minus_tab3_5').show();
			$('.btn_hide_tab3_5').hide();
		});	
		$('#btn_minus_tab3_5').click(function(){
			$('.sys_btn_area_tab3_5').hide();
			$('.cha_btn_sys_tab3_5').show();
			$('.table_view_tab3_5').show();
			$('#btn_plus_tab3_5').show();
			$('#btn_minus_tab3_5').hide();
			$('.btn_hide_tab3_5').show();
		});
	});

	$(function(){
		$('#btn_minus_tab3_6').hide();
		$('#btn_plus_tab3_6').click(function(){
			$('.sys_btn_area_tab3_6').hide();
			$('.table_view_tab3_6').hide();
			$('.table_remove_tab3_6').hide();
			$('.cha_btn_sys_tab3_6').hide();
			$('#btn_plus_tab3_6').hide();
			$('#btn_minus_tab3_6').show();
			$('.btn_hide_tab3_6').hide();
		});	
		$('#btn_minus_tab3_6').click(function(){
			$('.sys_btn_area_tab3_6').hide();
			$('.cha_btn_sys_tab3_6').show();
			$('.table_view_tab3_6').show();
			$('#btn_plus_tab3_6').show();
			$('#btn_minus_tab3_6').hide();
			$('.btn_hide_tab3_6').show();
		});
	});

	
	$(function(){
		$('#btn_minus_tab4_1').hide();
		$('#btn_plus_tab4_1').click(function(){
			$('.sys_btn_area_tab4_1').hide();
			$('.table_view_tab4_1').hide();
			$('.table_remove_tab4_1').hide();
			$('.cha_btn_sys_tab4_1').hide();
			$('#btn_plus_tab4_1').hide();
			$('#btn_minus_tab4_1').show();
			$('.btn_hide_tab4_1').hide();
		});	
		$('#btn_minus_tab4_1').click(function(){
			$('.sys_btn_area_tab4_1').hide();
			$('.cha_btn_sys_tab4_1').show();
			$('.table_view_tab4_1').show();
			$('#btn_plus_tab4_1').show();
			$('#btn_minus_tab4_1').hide();
			$('.btn_hide_tab4_1').show();
		});
	});

	$(function(){
		$('#btn_minus_tab4_2').hide();
		$('#btn_plus_tab4_2').click(function(){
			$('.sys_btn_area_tab4_2').hide();
			$('.table_view_tab4_2').hide();
			$('.table_remove_tab4_2').hide();
			$('.cha_btn_sys_tab4_2').hide();
			$('#btn_plus_tab4_2').hide();
			$('#btn_minus_tab4_2').show();
			$('.btn_hide_tab4_2').hide();
		});	
		$('#btn_minus_tab4_2').click(function(){
			$('.sys_btn_area_tab4_2').hide();
			$('.cha_btn_sys_tab4_2').show();
			$('.table_view_tab4_2').show();
			$('#btn_plus_tab4_2').show();
			$('#btn_minus_tab4_2').hide();
			$('.btn_hide_tab4_2').show();
		});
	});

	$(function(){
		$('#btn_minus_tab4_3').hide();
		$('#btn_plus_tab4_3').click(function(){
			$('.sys_btn_area_tab4_3').hide();
			$('.table_view_tab4_3').hide();
			$('.table_remove_tab4_3').hide();
			$('.cha_btn_sys_tab4_3').hide();
			$('#btn_plus_tab4_3').hide();
			$('#btn_minus_tab4_3').show();
			$('.btn_hide_tab4_3').hide();
		});	
		$('#btn_minus_tab4_3').click(function(){
			$('.sys_btn_area_tab4_3').hide();
			$('.cha_btn_sys_tab4_3').show();
			$('.table_view_tab4_3').show();
			$('#btn_plus_tab4_3').show();
			$('#btn_minus_tab4_3').hide();
			$('.btn_hide_tab4_3').show();
		});
	});

	$(function(){
		$('#btn_minus_tab4_4').hide();
		$('#btn_plus_tab4_4').click(function(){
			$('.sys_btn_area_tab4_4').hide();
			$('.table_view_tab4_4').hide();
			$('.table_remove_tab4_4').hide();
			$('.cha_btn_sys_tab4_4').hide();
			$('#btn_plus_tab4_4').hide();
			$('#btn_minus_tab4_4').show();
			$('.btn_hide_tab4_4').hide();
		});	
		$('#btn_minus_tab4_4').click(function(){
			$('.sys_btn_area_tab4_4').hide();
			$('.cha_btn_sys_tab4_4').show();
			$('.table_view_tab4_4').show();
			$('#btn_plus_tab4_4').show();
			$('#btn_minus_tab4_4').hide();
			$('.btn_hide_tab4_4').show();
		});
	});
	
	$(function(){
		$('#btn_minus_tab4_5').hide();
		$('#btn_plus_tab4_5').click(function(){
			$('.sys_btn_area_tab4_5').hide();
			$('.table_view_tab4_5').hide();
			$('.table_remove_tab4_5').hide();
			$('.cha_btn_sys_tab4_5').hide();
			$('#btn_plus_tab4_5').hide();
			$('#btn_minus_tab4_5').show();
			$('.btn_hide_tab4_5').hide();
		});	
		$('#btn_minus_tab4_5').click(function(){
			$('.sys_btn_area_tab4_5').hide();
			$('.cha_btn_sys_tab4_5').show();
			$('.table_view_tab4_5').show();
			$('#btn_plus_tab4_5').show();
			$('#btn_minus_tab4_5').hide();
			$('.btn_hide_tab4_5').show();
		});
	});
	
	$(function(){
		$('#btn_minus_tab4_6').hide();
		$('#btn_plus_tab4_6').click(function(){
			$('.sys_btn_area_tab4_6').hide();
			$('.table_view_tab4_6').hide();
			$('.table_remove_tab4_6').hide();
			$('.cha_btn_sys_tab4_6').hide();
			$('#btn_plus_tab4_6').hide();
			$('#btn_minus_tab4_6').show();
			$('.btn_hide_tab4_6').hide();
		});	
		$('#btn_minus_tab4_6').click(function(){
			$('.sys_btn_area_tab4_6').hide();
			$('.cha_btn_sys_tab4_6').show();
			$('.table_view_tab4_6').show();
			$('#btn_plus_tab4_6').show();
			$('#btn_minus_tab4_6').hide();
			$('.btn_hide_tab4_6').show();
		});
	});
	
	$(function(){
		$('#btn_minus_tab4_7').hide();
		$('#btn_plus_tab4_7').click(function(){
			$('.sys_btn_area_tab4_7').hide();
			$('.table_view_tab4_7').hide();
			$('.table_remove_tab4_7').hide();
			$('.cha_btn_sys_tab4_7').hide();
			$('#btn_plus_tab4_7').hide();
			$('#btn_minus_tab4_7').show();
			$('.btn_hide_tab4_7').hide();
		});	
		$('#btn_minus_tab4_7').click(function(){
			$('.sys_btn_area_tab4_7').hide();
			$('.cha_btn_sys_tab4_7').show();
			$('.table_view_tab4_7').show();
			$('#btn_plus_tab4_7').show();
			$('#btn_minus_tab4_7').hide();
			$('.btn_hide_tab4_7').show();
		});
	});

	$(function(){
		$('#btn_minus_tab5_1').hide();
		$('#btn_plus_tab5_1').click(function(){
			$('.sys_btn_area_tab5_1').hide();
			$('.table_view_tab5_1').hide();
			$('.table_remove_tab5_1').hide();
			$('.cha_btn_sys_tab5_1').hide();
			$('#btn_plus_tab5_1').hide();
			$('#btn_minus_tab5_1').show();
			$('.btn_hide_tab5_1').hide();
		});	
		$('#btn_minus_tab5_1').click(function(){
			$('.sys_btn_area_tab5_1').hide();
			$('.cha_btn_sys_tab5_1').show();
			$('.table_view_tab5_1').show();
			$('#btn_plus_tab5_1').show();
			$('#btn_minus_tab5_1').hide();
			$('.btn_hide_tab5_1').show();
		});
	});



//수정변경화면 
	$('.table_remove').hide();
	$('.table_remove2').hide();
	$('.table_remove3').hide();
	$('.table_remove4').hide();
	$('.table_remove5').hide();
	$('.table_remove6').hide();
	$('.table_remove7').hide();
	$('.table_remove_tab2_1').hide();
	$('.table_remove_tab2_2').hide();
	$('.table_remove_tab2_3').hide();
	$('.table_remove_tab2_4').hide();
	$('.table_remove_tab2_5').hide();
	$('.table_remove_tab2_6').hide();
	$('.table_remove_tab2_7').hide();
	$('.table_remove_tab2_8').hide();
	$('.table_remove_tab2_9').hide();
	$('.table_remove_tab2_10').hide();
	$('.table_remove_tab2_11').hide();
	$('.table_remove_tab2_12').hide();
	$('.table_remove_tab3_1').hide();
	$('.table_remove_tab3_2').hide();
	$('.table_remove_tab3_3').hide();
	$('.table_remove_tab3_4').hide();
	$('.table_remove_tab3_5').hide();
	$('.table_remove_tab3_6').hide();
	$('.table_remove_tab4_1').hide();
	$('.table_remove_tab4_2').hide();
	$('.table_remove_tab4_3').hide();
	$('.table_remove_tab4_4').hide();
	$('.table_remove_tab5_1').hide();

	
	$('.sys_btn_area').hide();
	$('.sys_btn_area2').hide();
	$('.sys_btn_area3').hide();
	$('.sys_btn_area4').hide();
	$('.sys_btn_area5').hide();
	$('.sys_btn_area6').hide();
	$('.sys_btn_area7').hide();
	$('.sys_btn_area_tab2_1').hide();
	$('.sys_btn_area_tab2_2').hide();
	$('.sys_btn_area_tab2_3').hide();
	$('.sys_btn_area_tab2_4').hide();
	$('.sys_btn_area_tab2_5').hide();
	$('.sys_btn_area_tab2_6').hide();
	$('.sys_btn_area_tab2_7').hide();
	$('.sys_btn_area_tab2_8').hide();
	$('.sys_btn_area_tab2_9').hide();
	$('.sys_btn_area_tab2_10').hide();
	$('.sys_btn_area_tab2_11').hide();
	$('.sys_btn_area_tab2_12').hide();
	$('.sys_btn_area_tab3_1').hide();
	$('.sys_btn_area_tab3_2').hide();
	$('.sys_btn_area_tab3_3').hide();
	$('.sys_btn_area_tab3_4').hide();
	$('.sys_btn_area_tab3_5').hide();
	$('.sys_btn_area_tab3_6').hide();
	$('.sys_btn_area_tab4_1').hide();
	$('.sys_btn_area_tab4_2').hide();
	$('.sys_btn_area_tab4_3').hide();
	$('.sys_btn_area_tab4_4').hide();	
	$('.sys_btn_area_tab5_1').hide();


	$('.cha_btn_sys').click(function(){ 
		$('.table_view').hide();
		$('.cha_btn_sys').hide();
		$('.sys_btn_area').show();
		$('.table_remove').show();
	});
	$('.cha_btn_sys2').click(function(){ 
		$('.table_view2').hide();
		$('.cha_btn_sys2').hide();
		$('.sys_btn_area2').show();
		$('.table_remove2').show();
	});
	$('.cha_btn_sys3').click(function(){ 
		$('.table_view3').hide();
		$('.cha_btn_sys3').hide();
		$('.sys_btn_area3').show();
		$('.table_remove3').show();
	});
	$('.cha_btn_sys4').click(function(){ 
		$('.table_view4').hide();
		$('.cha_btn_sys4').hide();
		$('.sys_btn_area4').show();
		$('.table_remove4').show();
	});
	$('.cha_btn_sys5').click(function(){ 
		$('.table_view5').hide();
		$('.cha_btn_sys5').hide();
		$('.sys_btn_area5').show();
		$('.table_remove5').show();
	});
	$('.cha_btn_sys6').click(function(){ 
		$('.table_view6').hide();
		$('.cha_btn_sys6').hide();
		$('.sys_btn_area6').show();
		$('.table_remove6').show();
	});
	$('.cha_btn_sys7').click(function(){ 
		$('.table_view7').hide();
		$('.cha_btn_sys7').hide();
		$('.sys_btn_area7').show();
		$('.table_remove7').show();
	});

	$('.cha_btn_sys_tab2_1').click(function(){ 
		$('.table_view_tab2_1').hide();
		$('.cha_btn_sys_tab2_1').hide();
		$('.sys_btn_area_tab2_1').show();
		$('.table_remove_tab2_1').show();
	});

		$('.cha_btn_sys_tab2_2').click(function(){ 
		$('.table_view_tab2_2').hide();
		$('.cha_btn_sys_tab2_2').hide();
		$('.sys_btn_area_tab2_2').show();
		$('.table_remove_tab2_2').show();
	});
		$('.cha_btn_sys_tab2_3').click(function(){ 
		$('.table_view_tab2_3').hide();
		$('.cha_btn_sys_tab2_3').hide();
		$('.sys_btn_area_tab2_3').show();
		$('.table_remove_tab2_3').show();
	});
		$('.cha_btn_sys_tab2_4').click(function(){ 
		$('.table_view_tab2_4').hide();
		$('.cha_btn_sys_tab2_4').hide();
		$('.sys_btn_area_tab2_4').show();
		$('.table_remove_tab2_4').show();
	});
		$('.cha_btn_sys_tab2_5').click(function(){ 
		$('.table_view_tab2_5').hide();
		$('.cha_btn_sys_tab2_5').hide();
		$('.sys_btn_area_tab2_5').show();
		$('.table_remove_tab2_5').show();
	});
		$('.cha_btn_sys_tab2_6').click(function(){ 
		$('.table_view_tab2_6').hide();
		$('.cha_btn_sys_tab2_6').hide();
		$('.sys_btn_area_tab2_6').show();
		$('.table_remove_tab2_6').show();
	});
		$('.cha_btn_sys_tab2_7').click(function(){ 
		$('.table_view_tab2_7').hide();
		$('.cha_btn_sys_tab2_7').hide();
		$('.sys_btn_area_tab2_7').show();
		$('.table_remove_tab2_7').show();
	});
		$('.cha_btn_sys_tab2_8').click(function(){ 
		$('.table_view_tab2_8').hide();
		$('.cha_btn_sys_tab2_8').hide();
		$('.sys_btn_area_tab2_8').show();
		$('.table_remove_tab2_8').show();
	});
		$('.cha_btn_sys_tab2_9').click(function(){ 
		$('.table_view_tab2_9').hide();
		$('.cha_btn_sys_tab2_9').hide();
		$('.sys_btn_area_tab2_9').show();
		$('.table_remove_tab2_9').show();
	});
		$('.cha_btn_sys_tab2_10').click(function(){ 
		$('.table_view_tab2_10').hide();
		$('.cha_btn_sys_tab2_10').hide();
		$('.sys_btn_area_tab2_10').show();
		$('.table_remove_tab2_10').show();
	});
		$('.cha_btn_sys_tab2_11').click(function(){ 
		$('.table_view_tab2_11').hide();
		$('.cha_btn_sys_tab2_11').hide();
		$('.sys_btn_area_tab2_11').show();
		$('.table_remove_tab2_11').show();
	});
	$('.cha_btn_sys_tab2_12').click(function(){ 
		$('.table_view_tab2_12').hide();
		$('.cha_btn_sys_tab2_12').hide();
		$('.sys_btn_area_tab2_12').show();
		$('.table_remove_tab2_12').show();
	});

	
	$('.cha_btn_sys_tab3_1').click(function(){ 
		$('.table_view_tab3_1').hide();
		$('.cha_btn_sys_tab3_1').hide();
		$('.sys_btn_area_tab3_1').show();
		$('.table_remove_tab3_1').show();
	});

		$('.cha_btn_sys_tab3_2').click(function(){ 
		$('.table_view_tab3_2').hide();
		$('.cha_btn_sys_tab3_2').hide();
		$('.sys_btn_area_tab3_2').show();
		$('.table_remove_tab3_2').show();
	});
		$('.cha_btn_sys_tab3_3').click(function(){ 
		$('.table_view_tab3_3').hide();
		$('.cha_btn_sys_tab3_3').hide();
		$('.sys_btn_area_tab3_3').show();
		$('.table_remove_tab3_3').show();
	});
		$('.cha_btn_sys_tab3_4').click(function(){ 
		$('.table_view_tab3_4').hide();
		$('.cha_btn_sys_tab3_4').hide();
		$('.sys_btn_area_tab3_4').show();
		$('.table_remove_tab3_4').show();
	});
		$('.cha_btn_sys_tab3_5').click(function(){ 
		$('.table_view_tab3_5').hide();
		$('.cha_btn_sys_tab3_5').hide();
		$('.sys_btn_area_tab3_5').show();
		$('.table_remove_tab3_5').show();
	});
		$('.cha_btn_sys_tab3_6').click(function(){ 
		$('.table_view_tab3_6').hide();
		$('.cha_btn_sys_tab3_6').hide();
		$('.sys_btn_area_tab3_6').show();
		$('.table_remove_tab3_6').show();
	});

	$('.cha_btn_sys_tab4_1').click(function(){ 
		$('.table_view_tab4_1').hide();
		$('.cha_btn_sys_tab4_1').hide();
		$('.sys_btn_area_tab4_1').show();
		$('.table_remove_tab4_1').show();
	});

		$('.cha_btn_sys_tab4_2').click(function(){ 
		$('.table_view_tab4_2').hide();
		$('.cha_btn_sys_tab4_2').hide();
		$('.sys_btn_area_tab4_2').show();
		$('.table_remove_tab4_2').show();
	});
		$('.cha_btn_sys_tab4_3').click(function(){ 
		$('.table_view_tab4_3').hide();
		$('.cha_btn_sys_tab4_3').hide();
		$('.sys_btn_area_tab4_3').show();
		$('.table_remove_tab4_3').show();
	});
		$('.cha_btn_sys_tab4_4').click(function(){ 
		$('.table_view_tab4_4').hide();
		$('.cha_btn_sys_tab4_4').hide();
		$('.sys_btn_area_tab4_4').show();
		$('.table_remove_tab4_4').show();
	});


	$('.cha_btn_sys_tab5_1').click(function(){ 
		$('.table_view_tab5_1').hide();
		$('.cha_btn_sys_tab5_1').hide();
		$('.sys_btn_area_tab5_1').show();
		$('.table_remove_tab5_1').show();
	});



// 동물그룹 항목 선택노출
	$('.all_btn').hide();
	$('.ani_info').hide();
	$('.infobase').show()
	$('.category .add_btn').click(function(){ //강그룹 추가버튼 클릭이벤트
		$('.infobase01').show();
	});
	$('.category td a').click(function(){ // '강'의 td안의 a값 클릭이벤트
		$('.infobase01').hide();
		$('.infoadd').show();
		$('.category01, .category .all_btn').show();			
		$('.category td').hide();			
		$(this).show();
		$(this).parent().show();
		$(this).parent().css('border-bottom','solid 1px #d0d0d0');
		$('.category .add_btn').hide();
	});
	$('.category01 td a').click(function(){ // '목'의 td안의 a값 클릭이벤트
		$('.category02, .category01 .all_btn').show();
		$('.category01 td').hide();
		$(this).show();
		$(this).parent().show();
		$(this).parent().css('border-bottom','solid 1px #d0d0d0');
		$('.category01 .add_btn').hide();
	});
	$('.category02 td a').click(function(){ // '과'의 td안의 a값 클릭이벤트
		$('.category03, .category02 .all_btn').show();
		$('.category02 td').hide();
		$(this).show();
		$(this).parent().show();
		$(this).parent().css('border-bottom','solid 1px #d0d0d0');
		$('.category02 .add_btn').hide();			
	});
	$('.category03 td a').click(function(){ // '종'의 td안의 a값 클릭이벤트
		$('.infoadd').hide();
		$('.infotable').show();
		$('.category04, .category03 .all_btn').show();
		$('.category03 td').hide();
		$(this).show();
		$(this).parent().show();
		$(this).parent().css('border-bottom','solid 1px #d0d0d0');
		$('.category03 .add_btn').hide();			
	});
	$('.category .all_btn').click(function(){
		$('.category .add_btn').show();
		$('.category td').show();
		$('.category td').css('border','none');
		$('.category .all_btn').hide()
	});
	$('.category01 .all_btn').click(function(){
		$('.category01 .add_btn').show();
		$('.category01 td').show();
		$('.category01 td').css('border','none');
		$('.category01 .all_btn').hide()
	});
	$('.category02 .all_btn').click(function(){
		$('.category02 .add_btn').show();
		$('.category02 td').show();
		$('.category02 td').css('border','none');
		$('.category02 .all_btn').hide()
	});
	$('.category03 .all_btn').click(function(){
		$('.category03 .add_btn').show();
		$('.category03 td').show();
		$('.category03 td').css('border','none');
		$('.category03 .all_btn').hide()
	});
	$('.infotable .cha_btn').click(function(){ 
		$('.infotable').hide();
		$('.infotable01').show();
	});


	// tab_menu 
	if($(".tab_menu").length > 0){
		$(".tab_cont:not(:first)").hide();
		$(".tab_menu li a").click(function() {
			tabCont = $(this).attr("href");
			$(".tab_cont").hide();
			$(tabCont).show();
			$(".tab_menu li").removeClass("on");
			$(this).parent().addClass("on");
			return false;
		});
	}
	




});



 

