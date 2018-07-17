<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<link rel="stylesheet" href="/css/common/twbsPagination.css">
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/common/json2.js"></script>
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	
	if(fn_is_pms_upd('0107')){
		$(".add_btn").css("display","");
	}
});

function selectPyeAll(result, param){
 	if(result!=null){
 		var totalPages = 1;
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++)
		{
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
			var pageRow = param.PAGE_ROW
			totalPages = parseInt((data.TOTAL_COUNT-1)/pageRow+1);
			
			var pageNo = param.PAGE_NO;
			var index = (pageNo-1)*pageRow + iRow;
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(index); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#BUNSIKDATE_DIV").eq(iRow).html(data.MAI_BIRTHDAY);
			$("#schRst_tbody div#INDATE_DIV").eq(iRow).html(data.DATE1);
			$("#schRst_tbody div#SIGNCLASS_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_CURSTS);
			$("#schRst_tbody div#OUTDATE_DIV").eq(iRow).html(data.DATE2);
			$("#schRst_tbody div#OUTRSN_DIV").eq(iRow).html(data.TYPE2);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 		if(param.PAGE_NO==1){
 			fc_paging(totalPages, 10, fn_paging);
 		}
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		document.getElementById('codeSearch').value = "";
// 		document.getElementById('daioPlace').value = "";
 		return;
 	}
}

function selectPyeAli(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#BUNSIKDATE_DIV").eq(iRow).html(data.MAI_BIRTHDAY);
			$("#schRst_tbody div#INDATE_DIV").eq(iRow).html(data.DATE1);
			$("#schRst_tbody div#SIGNCLASS_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_CURSTS);
			$("#schRst_tbody div#OUTDATE_DIV").eq(iRow).html(data.DATE2);
			$("#schRst_tbody div#OUTRSN_DIV").eq(iRow).html(data.TYPE2);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		document.getElementById('codeSearch').value = "";
// 		document.getElementById('daioPlace').value = "";
 		return;
 	}
}

function selectPyeDea(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#BUNSIKDATE_DIV").eq(iRow).html(data.MAI_BIRTHDAY);
			$("#schRst_tbody div#INDATE_DIV").eq(iRow).html(data.DATE1);
			$("#schRst_tbody div#SIGNCLASS_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_CURSTS);
			$("#schRst_tbody div#OUTDATE_DIV").eq(iRow).html(data.DATE2);
			$("#schRst_tbody div#OUTRSN_DIV").eq(iRow).html(data.TYPE2);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		document.getElementById('codeSearch').value = "";
// 		document.getElementById('daioPlace').value = "";
 		return;
 	}
}

function fn_base_selectPyeAll(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
//	var targetUrl = "/base/0107/selectAllList.do";
	var targetUrl = "/base/0107/selectPagingList.do";
	/**
	var chk_del_sts = "N";
	if($('#sch_tbody #chk_del_sts').prop("checked")){
		chk_del_sts = "";
	}
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			DAIO_Place:$("#sch_tbody #DAIO_Place").val(),
			pyeType : "All",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			tmp : $('#sch_tbody input:radio[name=tmp]:checked').val(),
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val(),
			del_sts :chk_del_sts
	};
	*/
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result, param);
		}
	});
}

function fn_base_selectPyeAli(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/base/0107/selectAliveList.do";
	var chk_del_sts = "N";
	if($('#sch_tbody #chk_del_sts').prop("checked")){
		chk_del_sts = "";
	}
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			DAIO_Place:$("#sch_tbody #DAIO_Place").val(),
			pyeType : "Alive",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			tmp : $('#sch_tbody input:radio[name=tmp]:checked').val(),
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val(),
			del_sts :chk_del_sts
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectPyeDea(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/base/0107/selectDeathList.do";
	var chk_del_sts = "N";
	if($('#sch_tbody #chk_del_sts').prop("checked")){
		chk_del_sts = "";
	}
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			DAIO_Place:$("#sch_tbody #DAIO_Place").val(),
			pyeType : "Death",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			/* del_chk : $('#sch_tbody input:radio[name=del_chk]:checked').val(), */
			tmp : $('#sch_tbody input:radio[name=tmp]:checked').val(),
			del_sts :chk_del_sts,
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val()
			
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_AniInfo_view0107E(MAI_AniCode){
	var targetUrl = "/base/0107/view0107E.do";
	location.href = targetUrl + "?MAI_AniCode=" +MAI_AniCode;
}

function fn_base_search(page){
	var st = $(":input:radio[name=tmp]:checked").val();
	
	if(st == 'normal'){
		$(".pagination").css('display','');
	}else{
		fc_clearRow("schRst_tbody");
		$(".pagination").css('display','none');
		return;
	}
	
	 <%-- var sch1 = document.getElementById("codeSearch").value;
	 var sch2 = document.getElementById("schKeyword").value;
	 var sch3 = document.getElementById("daioPlace").value; --%>
	var chk_del_sts = "N";
	if($('#sch_tbody #chk_del_sts').prop("checked")){
		chk_del_sts = "";
	}
	 
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			DAIO_Place:$("#sch_tbody #DAIO_Place").val(),
			pyeType : $('#sch_tbody input:radio[name=pyeType]:checked').val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			tmp : $('#sch_tbody input:radio[name=tmp]:checked').val(),
			del_sts : chk_del_sts,
			// cal_1 ~ 2 : 번식일자, cal_3 ~ 4 : 반입일자, cal_5 ~ 6 : 반출일자
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val()
	};
	
	var options = {
			PAGE_NO : page,
			PAGE_ROW : 10
//			PAGE_SIZE : 3
	};
	var params = $.extend( {}, param, options);
	console.log(params);
	
	console.log(param.pyeType);
	if(param.pyeType=="All"){
		fn_base_selectPyeAll(params, selectPyeAll);
	}else if(param.pyeType=="Alive"){
		fn_base_selectPyeAli("", selectPyeAli);
	}else if(param.pyeType=="Death"){
		fn_base_selectPyeDea("", selectPyeDea);
	}
}

function fn_paging(){
	fn_base_search($('#pagination').twbsPagination('getCurrentPage'));
}

function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}

function fn_layer_show() {
	$("#layer01").show();
	$(".layer_popup").show();
	var width_size = $("#layer01").innerWidth()/2;
	$("#layer01").css("margin-left",-width_size);
	
	HideTable('subDetail_table');
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	$("input:radio[name='subSchType']:radio[value='1']").attr("checked",true);
	$('#subSchKeyword').val('');
	
	fc_clearRow("class_tbody");
	fc_clearRow("order_tbody");
	fc_clearRow("family_tbody");
	fc_clearRow("species_tbody");
	HideTable('subDetail_table');
}

</script>

<%-- 동물추가 레이어 스크립트 --%>
<script type="text/javascript">

function getSubDetailInfo(mac_aniclscode, callback, retObj){
	var param = {
			mac_aniclscode:mac_aniclscode
	};
	$.ajax({
		type : "POST",
		url : "/base/0107/getSubDetailInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#subDetail_tbody div#CLS1_NAME_DIV").html(data.CLS1_NAME); 
			$("#subDetail_tbody div#CLS2_NAME_DIV").html(data.CLS2_NAME); 
			$("#subDetail_tbody div#CLS3_NAME_DIV").html(data.CLS3_NAME); 
			$("#subDetail_tbody div#MAC_ANICLSCODE_DIV").html(data.MAC_ANICLSCODE); 
			$("#subDetail_thead div#animalAdd").attr('data-val', data.MAC_ANICLSCODE); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
	ShowTable('subDetail_table');
}

function selectSpeciesList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#species_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("species_tbody");
			
			var iRow = (i+1);
			$("#species_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#species_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#species_tbody div#MAC_ANICLSCODE_DIV").eq(iRow).attr('data-val', data.MAC_ANICLSCODE); 
			/* $("#species_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAC_ANICLSCODE); */
		}
		$("#species_tbody tr:first").attr('style',"display:none");
 	}
}

function selectFamilyList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#family_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("family_tbody");
			
			var iRow = (i+1);
			$("#family_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#family_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#family_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#family_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
			$("#family_tbody div#MAC_ANICODE3_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE3); 
		}
		$("#family_tbody tr:first").attr('style',"display:none");
 	}
}

function selectOrderList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#order_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("order_tbody");
			
			var iRow = (i+1);
			$("#order_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#order_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#order_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#order_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
		}
		$("#order_tbody tr:first").attr('style',"display:none");
 	}
}

function selectClassList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#class_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("class_tbody"); 
			
			var iRow = (i+1);
			$("#class_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#class_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			
			$("#class_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
		}
		$("#class_tbody tr:first").attr('style',"display:none");
 	}
}


function fn_base_selectSpeciesList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	var anicode2 = "";
	var anicode3 = "";
	if(targetRow!=""){
		anicode1 = $("#family_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
		anicode2 = $("#family_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
		anicode3 = $("#family_tbody div#MAC_ANICODE3_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("species_tbody");

	var targetUrl = "/base/0107/selectSpeciesList.do";
	var param = {
			anicode1 : anicode1,
			anicode2 : anicode2,
			anicode3 : anicode3,
			subSchKeyword:$("#sub_tbody #subSchKeyword").val(),
			clsType : "4"
	};
	
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectFamilyList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	var anicode2 = "";
	if(targetRow!=""){
		anicode1 = $("#order_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
		anicode2 = $("#order_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("family_tbody");

	var targetUrl = "/base/0107/selectFamilyList.do";
	var param = {
			anicode1 : anicode1,
			anicode2 : anicode2,
			subSchKeyword:$("#sub_tbody #subSchKeyword").val(),
			clsType : "3"
	};
	console.log(JSON.stringify(param));
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectOrderList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	if(targetRow!=""){
		anicode1 = $("#class_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("order_tbody");

	var targetUrl = "/base/0107/selectOrderList.do";
	var param = {
			anicode1:anicode1,
			subSchKeyword:$("#sub_tbody #subSchKeyword").val(),
			clsType : "2"
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectClassList(param, callback, retObj) {
	fc_clearRow("class_tbody");
	
	var param = {
			subSchKeyword:$("#sub_tbody #subSchKeyword").val(),
			clsType : "1"
	};
	
	var targetUrl = "/base/0107/selectClassList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_sub_search(){
	var param = {
			subSchType : $('#sub_tbody input:radio[name=subSchType]:checked').val(),
			subSchKeyword : $("#sub_tbody #subSchKeyword").val()
	};
	console.log(param.subSchType);
	if(param.subSchType=="1"){
		fn_base_selectClassList(param, selectClassList);
	}else if(param.subSchType=="2"){
		fc_clearRow("class_tbody");
		fn_base_selectOrderList("", selectOrderList);
	}else if(param.subSchType=="3"){
		fc_clearRow("order_tbody");
		fn_base_selectFamilyList("", selectFamilyList);
	}else if(param.subSchType=="4"){
		fc_clearRow("family_tbody");
		fn_base_selectSpeciesList("", selectSpeciesList);
	}
}

function fn_base_selectAniClsInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			mac_aniclscode:$("#species_tbody div#MAC_ANICLSCODE_DIV").eq(targetRow).attr('data-val')
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	getSubDetailInfo(param.mac_aniclscode, validate);
}	

function fn_addAnimal(mac_aniclscode){
	if(mac_aniclscode == ''){
		alert('추가하려는 동물을 선택해주세요.');
	}

	else if (confirm('해당 동물을 추가하시겠습니까?')) {
		var targetUrl = "/base/0107/add_animal.do";
		location.href = targetUrl + "?mac_aniclscode=" +mac_aniclscode;
	} else {
		fn_layer_hide();
	}
}
</script>

<title>기본정보 &gt; 동물정보</title>
</head>
<body>
<div id="sub_wrap">
		
	<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<jsp:include page="/lnb.do"></jsp:include>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">동물정보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 동물정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물정보조회-->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>동물정보조회</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr><th scope="row">동물번호</th>
									<td><input name="codeSearch" type="text" id="codeSearch" class="textfield" style="width:90%"/><label for="codeSearch"></label></td>
									<th scope="row">동물사명</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
											<option value="">-- 동물사 선택 --</option>
										<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
											<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
											</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명칭</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label>
									</td>
									<th scope="row">반입처</th>
									<td><input name="DAIO_Place" type="text" id="DAIO_Place" class="textfield" style="width:90%"/><label for="seach_text2"></label></td>
								</tr>
								<tr><th scope="row">번식일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" name="cal_1" ><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" name="cal_2"><label for="cal_2"></label></p></td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" id="pyeType" name="pyeType" value="All" class="search_radio" checked="checked"/>전체</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Alive" class="search_radio"/>생존</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Death" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr><th scope="row">반입일자</th>
									<td><p><input type="text" class="calendar1" id="cal_3" ><label for="cal_3"></label> ~ <input type="text" class="calendar2" id="cal_4" ><label for="cal_4"></label></p></td>
									<th scope="row">삭제구분</th>
									<td>
										 <!-- <label><input type="radio" id="del_chk" name="del_chk" value="mipo" class="search_radio" checked="checked"/>미포함</label>
										 <label><input type="radio" id="del_chk" name="del_chk" value="poham" class="search_radio"/>포함(삭제 데이터를 포함합니다.)</label> -->
										 <input type="checkbox" id="chk_del_sts" name="chk_del_sts"><label for="chk_del_sts"></label> 삭제 (삭제 데이터를 포함합니다.)
									</td>
								</tr>
								<tr><th scope="row">반출일자</th>
									<td><p><input type="text" class="calendar1" id="cal_5"><label for="cal_5"></label> ~ <input type="text" class="calendar2" id="cal_6"><label for="cal_6"></label></p></td>
									<th scope="row">정렬방법</th>
									<td>
										<p>
										  <label><input type="radio" name="sortType" value="number" class="search_radio type1" checked="checked" />동물번호</label>
										  <label><input type="radio" name="sortType" value="name" class="search_radio"/>동물명</label>
										  <label><input type="radio" name="sortType" value="bunsik" class="search_radio"/>번식일</label>
										  <label><input type="radio" name="sortType" value="banip" class="search_radio"/>반입일</label>
										  <label><input type="radio" name="sortType" value="banchul" class="search_radio"/>반출일</label>
										</p>
									</td>
								</tr>
								<tr>
								<th scope="row">군집구분</th>
									<td>
										<label><input type="radio" id="gunzip" name="gunzip" value="gn" class="search_radio" checked="checked"/>단일개체</label>
										 <label><input type="radio" id="gunzip" name="gunzip" value="gy" class="search_radio" />군집</label>
									</td>
									<th scope="row">임시동물</th>
									<td>
										 <label><input type="radio" name="tmp" value="normal" class="search_radio" checked="checked"/>일반</label>
										 <label><input type="radio" name="tmp" value="temp" class="search_radio"/>임시</label>
									</td>
								</tr>
								<tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_base_search(1);" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					
					<!-- //동물정보조회-->
										
					<!-- 동물정보추가-->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span>
						<a href="javascript:fn_layer_show();" class="add_btn" style="display: none;">추가</a>
						</span>	
						</div>
						
						<table class="aniinfo_add" style="width:1000px;" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:8%;">
								<col style="width:17%;">
								<col style="width:5%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th>No</th>
        							<th>동물번호</th>
        							<th>동물명칭</th>
        							<th>성별</th>
        							<th>관리부서</th>
       								<th>동물사</th>
        							<th>번식일</th>
        							<th>반입일</th>
        							<th>등록구분</th>
        							<th>반출일</th> 
       								<th>반출사유</th> 
      								<th>보기</th>								
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="MAC_NAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="TEAMNAME_DIV" data-val=''></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="BUNSIKDATE_DIV" data-val=''></div></td>
								<td><div id="INDATE_DIV" data-val=''></div></td>
								<td><div id="SIGNCLASS_DIV"></div></td>
								<td><div id="OUTDATE_DIV"></div></td>
								<td><div id="OUTRSN_DIV"></div></td>
								<td><a href="javascript:;"><div id="MAI_ANICODE_DIV" data-val='' onclick="javascript:fn_AniInfo_view0107E($(this).attr('data-val'));" class="copy_btn">조회</div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
					
					<!-- pagination -->
					<div class="pagination">
					    <nav aria-label="Page navigation">
					        <ul class="pagination" id="pagination"></ul>
					    </nav>
					</div>
					<!-- //pagination -->						
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
		
		<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:1050px; height:650px; overflow: auto;">
			<div class="layer_tit">동물정보 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" >
							<caption>동물그룹정보조회</caption>
							<colgroup>
								<col style="width:40%;">
								<col style="width:70%;">
							</colgroup>
                            <tbody id="sub_tbody">
                            <tr>
                                <th scope="row">분류 구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="subSchType" name="subSchType" value="1" class="search_radio" checked/>강</label>
                                  <label><input type="radio" id="subSchType" name="subSchType" value="2" class="search_radio" />목</label>
                                  <label><input type="radio" id="subSchType" name="subSchType" value="3" class="search_radio" />과</label>
                                  <label><input type="radio" id="subSchType" name="subSchType" value="4" class="search_radio" />종</label>
                                </p>
                                </td>
                            </tr>
                           <tr><th scope="row">분류 명칭</th><td><input name="subSchKeyword" type="text" id="subSchKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sub_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>	
                            </tbody>
                        </table>
					</div>
					
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="table_box">
                       <table class="ani_list" >
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강</th></tr>
							</thead>
							<tbody id="class_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
								<td>
								<div id="MAC_ANICODE1_DIV" data-val=''></div>
								<a href="javascript:;">
								<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectOrderList($(this).attr('data-val'), selectOrderList);"></div></a>
								</td>
								</tr>								
							</tbody>
						</table>
						
						<table class="ani_list" >
								<caption>목그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">목</th></tr>
								</thead>
								<tbody id="order_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectFamilyList($(this).attr('data-val'), selectFamilyList);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>	
												
						<table class="ani_list" >
								<caption>과그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">과</th></tr>
								</thead>
								<tbody id="family_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<div id="MAC_ANICODE3_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectSpeciesList($(this).attr('data-val'), selectSpeciesList);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>		
							
							<table class="ani_list">
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">종</th></tr>
								</thead>	
								<tbody id="species_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICLSCODE_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniClsInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>				
							
							<div class="ani_info_box">
							<table class="ani_info infobase" id="subDetail_table" > 
								<caption>동물그룹상세정보</caption>
								<colgroup>
									<col style="width:30%;">
									<col style="width:80%;">
								</colgroup>
								<thead id="subDetail_thead">
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="cha_btn">
									<div id="animalAdd" data-val='' onclick="javascript:fn_addAnimal($(this).attr('data-val'));">선택</div></a>
								</thead>
								<tbody id="subDetail_tbody">
									<tr><th scope="row">강정보</th><td><div id="CLS1_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">목정보</th><td><div id="CLS2_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">과정보</th><td><div id="CLS3_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">종번호</th><td><div id="MAC_ANICLSCODE_DIV" data-val=''></div></td>
								</tbody>
							</table>
						<!-- //상세정보표-->	
						</div>
					</div>
			</div>
			<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer01 -->	
	</div>
	<!-- // layer_popup -->
		
			<!-- //container -->	
	</div>
 	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>