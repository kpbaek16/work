<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<title>기본정보 &gt; 혈액검사항목</title>
</head>
<script>
	
	function selectCommBdItemList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#bdItem_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("bdItem_tbody");
				
				var iRow = (i+1);
				$("#bdItem_tbody div#BDITEM_INDEX_DIV").eq(iRow).attr('data-val', iRow); 
				$("#bdItem_tbody div#MCC_S_NAME_DIV").eq(iRow).attr('data-val', data.MCC_S_CODE); 
				$("#bdItem_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#bdItem_tbody div#MCC_COM_S1_DIV").eq(iRow).html(data.MCC_COM_S1); 
			}
			$("#bdItem_tbody tr:first").attr('style',"display:none");
	 	}
	}
	

	function fn_base_selectCommBdItemList(param, callback, retObj) {

		fc_clearRow("bdItem_tbody");

		var targetUrl = "/base/0108/selectCommBdItemList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function selectBdItemInfo(mcc_s_code, callback, retObj){
		var param = {
				mcc_s_code :mcc_s_code
		};
		$.ajax({
			type : "POST",
			url : "/base/0108/selectBdItemInfo.do",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				$("#bdItemInfo_tbody div#MCC_L_CODE_DIV").attr('data-val', data.MCC_L_CODE); 
				$("#bdItemInfo_tbody div#MCC_M_CODE_DIV").attr('data-val', data.MCC_M_CODE); 
				$("#bdItemInfo_tbody div#MCC_S_CODE_DIV").attr('data-val', data.MCC_S_CODE); 
				$("#bdItemInfo_tbody #MCC_S_CODE").val(data.MCC_S_CODE); 
				$("#bdItemInfo_tbody #MCC_SORT_ORDER").val(data.MCC_SORT_ORDER); 
				$("#bdItemInfo_tbody #MCC_S_NAME").val(data.MCC_S_NAME); 
				$("#bdItemInfo_tbody #MCC_COM_S1").val(data.MCC_COM_S1); 
				
				$("#bdItemInfo_tbody #MCC_S_CODE").prop("disabled", true);
				$("#DEL_BTN_REF").attr("style","display:");
				
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
	}
	
	function fn_base_selectBdItemInfo(mcc_s_code){
		console.log("mcc_s_code====>" + mcc_s_code);
		var validate = function validate(data){
			if(data!=null){
		 		return;
			}else{
		 	}
		}
		selectBdItemInfo(mcc_s_code, validate);
	}	
	
	function createBdItem(result) {
		if (result.qryRslt == "Y") {
			alert("등록되었습니다.");
			fn_base_search();
		}
	}
	
	function fn_base_createBdItem(callback, retObj) {
		if($("#bdItemInfo_tbody #MCC_S_CODE").val().trim()==""){
			alert("코드 입력은 필수 입니다.");
			$("#bdItemInfo_tbody #MCC_S_CODE").focus();
			return;
		}
		if($("#bdItemInfo_tbody #MCC_S_NAME").val().trim()==""){
			alert("검사명 입력은 필수입니다.");
			$("#bdItemInfo_tbody #MCC_S_NAME").focus();
			return;
		}
		if($("#bdItemInfo_tbody #MCC_COM_S1").val().trim()==""){
			alert("단위 입력은 필수입니다.");
			$("#bdItemInfo_tbody #MCC_COM_S1").focus();
			return;
		}
		var regMode = "";
		if($("#bdItemInfo_tbody #MCC_S_CODE").prop("disabled")){
			regMode = "U";
			if(!confirm("수정하시겠습니까?")){
				return;	
			}
		}else{	
			regMode = "I";
			if(!confirm("등록하시겠습니까?")){
				return;	
			}
		}
		var param = {
				regMode : regMode,
				mcc_s_code : $("#bdItemInfo_tbody #MCC_S_CODE").val(),
				mcc_sort_order : $("#bdItemInfo_tbody #MCC_SORT_ORDER").val(),
				mcc_s_name : $("#bdItemInfo_tbody #MCC_S_NAME").val(),
				mcc_com_s1 : $("#bdItemInfo_tbody #MCC_COM_S1").val()
		};

		var targetUrl = "/base/0108/createBdItem.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function deleteBdItem(result) {
		if (result.qryRslt == "Y") {
			alert("삭제되었습니다.");
			fn_base_search();
			fn_base_addBdItem();
		}else{
			alert("혈액검사결과 데이터가 존재하므로 삭제불가 합니다.");
		}
	}
	
	function fn_base_deleteBdItem(callback, retObj) {
		if(!confirm("삭제하시겠습니까?")){
			return;	
		}
		var param = {
				mcc_s_code : $("#bdItemInfo_tbody #MCC_S_CODE").val()
		};

		var targetUrl = "/base/0108/deleteBdItem.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_addBdItem() {
		$("#bdItemInfo_tbody #MCC_S_CODE").prop("disabled", false);
		$("#bdItemInfo_tbody #MCC_S_CODE").val("");
		$("#bdItemInfo_tbody #MCC_SORT_ORDER").val("");
		$("#bdItemInfo_tbody #MCC_S_NAME").val("");
		$("#bdItemInfo_tbody #MCC_COM_S1").val("");
		
		$("#DEL_BTN_REF").attr("style","display:none");
	}
	
	function fn_base_search(){
		var param = {
				schKeyword : $("#sch_tbody #schKeyword").val()
		};
		fn_base_selectCommBdItemList(param, selectCommBdItemList);
	}	
	
	$(document).ready(function() {
	if(fn_is_pms_upd(0108)){
			$(".save_btn").css("display","");
			$(".add_btn").css("display","");
			$(".cancel_btn").css("display","");
		}
	});
</script>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">혈액검사항목</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>> 혈액검사항목</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>백신정보조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								 <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 혈액검사 관리-->
					<div class="table_wrap">
						<!-- 혈액검사 관리표-->
						<p class="sub_title">혈액검사 관리</p>					
						<table class="ani_list category category03" style="width:250px;">
							<caption>혈액검사 관리</caption>
							<colgroup>
								<col style="width:100%;" />
							</colgroup>
							<thead>
								<tr><th scope="col">혈액검사명<a href="javascript:fn_base_addBdItem();" class="add_btn" style="display: none;">추가</a></th></tr>
							</thead>
							<tbody id="bdItem_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
								<td><div id="BDITEM_INDEX_DIV" data-val=''></div>
										<a href="javascript:;">
										<div id="MCC_S_NAME_DIV" data-val='' onclick="javascript:fn_base_selectBdItemInfo($(this).attr('data-val'), selectBdItemInfo);"></div></a>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- //혈액검사 관리표-->
						
						<!-- 혈액검사 관리상세정보표-->
						<div class="ani_info_box">
							<!-- 상세정보기본-->
							<table class="ani_info infobase" > 
								<caption> 혈액검사 관리상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr>
									<th colspan="2" scope="col">
									<span class="info_title">상세정보</span>
									<a href="javascript:fn_base_createBdItem(createBdItem);" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									<!-- <a href="javascript:fn_base_deleteBdItem(deleteBdItem);" class="del_btn layer_open" style="display:none" id="DEL_BTN_REF" >삭제</a> --></th></tr>
								</thead>
								<tbody id="bdItemInfo_tbody">
									<tr><th scope="row">코드</th><td><input name="MCC_S_CODE" type="text" id="MCC_S_CODE" class="textfield" value="" maxlength="10"/><label for="table1_text1"></label>
									<div id="MCC_L_CODE_DIV" data-val=''></div>
									<div id="MCC_M_CODE_DIV" data-val=''></div>
									<div id="MCC_S_CODE_DIV" data-val=''></div>
									</td></tr>
									<tr><th scope="row">번호</th><td><input name="MCC_SORT_ORDER" type="text" id="MCC_SORT_ORDER" class="textfield" value="" onkeyup="javascript:fc_OnlyNumber(this);" maxlength="2"/><label for="table1_text3"></label></td></tr>
									<tr><th scope="row">검사명</th><td><input name="MCC_S_NAME" type="text" id="MCC_S_NAME" class="textfield" value="" maxlength="25"/><label for="table1_text3"></label></td></tr>
									<tr><th scope="row">단위</th><td><input name="MCC_COM_S1" type="text" id="MCC_COM_S1" class="textfield" value="" maxlength="25"/><label for="table1_text3"></label></td></tr>
							   </tbody>
							</table>
						</div>
						<!-- //혈액검사 관리상세정보표-->
					</div>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
