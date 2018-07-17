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
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/common/json2.js"></script>

<title>기본정보 &gt; 권한관리</title>
</head>
<script type="text/javascript">
function selectAuthGrpList(result, param){
 	if(result!=null){
//		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#authGrp_tbody tr:first").attr('style',"display:");
		
		for(var i=0; i<result.length; i++){
			var data = result[i];
			
			fc_addRow("authGrp_tbody");

			var iRow = (i+1);
		    if(data.MAG_GRPCODE!=data.PREV_MAG_GRPCODE){
				$("#authGrp_tbody .mag_grpcode").eq(iRow).attr('rowspan', data.CNT_MAG_GRPCODE);
				$("#authGrp_tbody .mag_grpcode").eq(iRow).show();
		    }else{
				$("#authGrp_tbody .mag_grpcode").eq(iRow).hide();
		    }
			$("#authGrp_tbody div#MAG_ID_DIV").eq(iRow).attr('data-val', data.MAG_ID); 
			$("#authGrp_tbody div#MAG_GRPCODE_DIV").eq(iRow).attr('data-val', data.MAG_GRPCODE); 
			
			$("#authGrp_tbody div#TXT_MAG_GRPCODE_DIV").eq(iRow).html(data.TXT_MAG_GRPCODE); 
			$("#authGrp_tbody div#DPTNAME_DIV").eq(iRow).html(data.DPTNAME); 
			
			$("#authGrp_tbody div#MUI_NAME_DIV").eq(iRow).attr('data-val', data.MAG_ID); 
			$("#authGrp_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME);
			
			$("#authGrp_tbody #MAG_ST_DAY").eq(iRow).val(data.TXT_MAG_ST_DAY);
			$("#authGrp_tbody #MAG_ED_DAY").eq(iRow).val(data.TXT_MAG_ED_DAY);
		}
		$("#authGrp_tbody tr:first").attr('style',"display:none");
		$("#authGrp_tbody").append($("#authGrp_tbody tr:last"));
 	}
}

function selectAuthMenuList(result){
 	if(result!=null){
//		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#pms_tbody tr:first").attr('style',"display:");
		
		for(var i=0; i<result.length; i++){
			var data = result[i];
			
			fc_addRow("pms_tbody");

			var iRow = (i+1);
			
		    if(data.MCC_M_CODE!=data.PREV_MCC_M_CODE){
				$("#pms_tbody .mcc_m_name").eq(iRow).attr('rowspan', data.CNT_M_CODE);
				$("#pms_tbody .mcc_m_name").eq(iRow).show();
		    }else{
				$("#pms_tbody .mcc_m_name").eq(iRow).hide();
		    }
			$("#pms_tbody div#MUP_USERID_DIV").eq(iRow).attr('data-val', data.MUP_USERID); 
			$("#pms_tbody div#MUP_PROGID_DIV").eq(iRow).attr('data-val', data.MCC_S_CODE); 
			$("#pms_tbody div#MCC_M_NAME_DIV").eq(iRow).html(data.MCC_M_NAME); 
			$("#pms_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
			if(data.MUP_SRCHLVL == "1"){
				$("#pms_tbody #chk_srchLvl").eq(iRow).prop("checked", true);
			}
			if(data.MUP_UPDLVL == "1"){
				$("#pms_tbody #chk_updLvl").eq(iRow).prop("checked", true);
			}
		}
		$("#pms_tbody tr:first").attr('style',"display:none");
		$("#pms_tbody").append($("#pms_tbody tr:last"));
		$("#pms_tbody #chk_srchLvl").eq(1).focus();
 	}
}

function fn_base_selectAuthGrpList(param, callback, retObj) {
	fc_clearRow("authGrp_tbody");
	fc_clearRow("pms_tbody");

	var targetUrl = "/base/0120/selectAuthGrpList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result, param);
		}
	});
}

function fn_base_selectAuthMenuList(mag_id, callback, retObj) {
	var param = {
			mup_userid : mag_id
	};
	fc_clearRow("pms_tbody");

	var targetUrl = "/base/0120/selectAuthMenuList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result, param);
		}
	});
}

function fn_base_search(){
	var param = {
			sch_grpcode : $("#sch_tbody #sch_grpcode").val()
	};
	fn_base_selectAuthGrpList(param, selectAuthGrpList);
}	

function saveAuthGrpList(result) {
	if (result.qryRslt == "Y") {
		alert("등록되었습니다.");
	}
}

function saveUserPmsList(result) {
	if (result.qryRslt == "Y") {
		alert("등록되었습니다.");
	}
}

function toggle_bgcolor(tbody_id, target) {
	$("#" + tbody_id + " tr").each(function(index){
		console.log($(this).find("td").find("div#DPTNAME_DIV").html());
		$(this).find("td").eq(1).attr('style','background-color:#ffffff;');
	});
	target.style.backgroundColor ='#d0d0d0';
}

function toggle_calDay(target) {
	if($(target).prop("checked")){
		$(target).nextAll().attr('disabled',false);
	}else{
		$(target).nextAll().attr('disabled',true);
	}
}

function fn_base_saveAuthGrpList(callback, retObj) {
	if(!confirm("선택한 구성원을 저장하시겠습니까?")){
		return;	
	}
	
	var mag_id_list = [];
	var mag_grpcode_list = [];
	var mag_st_day_list = [];
	var mag_ed_day_list = [];
	

	$("#authGrp_tbody #chk_day").each(function(index){
		console.log($(this).prop("checked"));
		if(index!=0){
			var isChk = $(this).prop("checked");
			if(isChk==true){
				mag_id_list.push($("#authGrp_tbody #MAG_ID_DIV").eq(index).attr('data-val'));
				mag_grpcode_list.push($("#authGrp_tbody #MAG_GRPCODE_DIV").eq(index).attr('data-val'));
				mag_st_day_list.push($("#authGrp_tbody #MAG_ST_DAY").eq(index).val());
				mag_ed_day_list.push($("#authGrp_tbody #MAG_ED_DAY").eq(index).val());
			}
		}
	});
	var param = {
			mag_id_list : mag_id_list,
			mag_grpcode_list : mag_grpcode_list,
			mag_st_day_list : mag_st_day_list,
			mag_ed_day_list : mag_ed_day_list
	};
	console.log("param.mag_grpcode====>" + param.mag_id_list);
	console.log("param.mup_progid_list====>" + param.mag_grpcode_list);
	console.log("param.mup_srchlvl_list====>" + param.mag_st_day_list);
	console.log("param.mup_updlvl_list====>" + param.mag_ed_day_list);

	var targetUrl = "/base/0120/saveAuthGrpList.do";
	$.ajaxSettings.traditional = true; 
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_saveUserPmsList(callback, retObj) {
	var mup_userid_list = [];
	var mup_progid_list = [];
	var mup_srchlvl_list = [];
	var mup_updlvl_list = [];
	$("#pms_tbody div#MUP_USERID_DIV").each(function(index){
		console.log($(this).html() + "::" + $(this).val());
		if(index!=0){

			mup_userid_list.push($("#pms_tbody div#MUP_USERID_DIV").eq(index).attr('data-val'));
			mup_progid_list.push($("#pms_tbody div#MUP_PROGID_DIV").eq(index).attr('data-val'));
			if($("#pms_tbody #chk_srchLvl").eq(index).prop("checked")){
				mup_srchlvl_list.push("1");
			}else{
				mup_srchlvl_list.push("0");
			}
			if($("#pms_tbody #chk_updlvl").eq(index).prop("checked")){
				mup_updlvl_list.push("1");
			}else{
				mup_updlvl_list.push("0");
			}
		}
	});
	var param = {
			mup_userid_list : mup_userid_list,
			mup_progid_list : mup_progid_list,
			mup_srchlvl_list : mup_srchlvl_list,
			mup_updlvl_list : mup_updlvl_list
	};
	console.log("param.mup_userid_list====>" + param.mup_userid_list);
	console.log("param.mup_progid_list====>" + param.mup_progid_list);
	console.log("param.mup_srchlvl_list====>" + param.mup_srchlvl_list);
	console.log("param.mup_updlvl_list====>" + param.mup_updlvl_list);

	var targetUrl = "/base/0120/saveUserPmsList.do";
	$.ajaxSettings.traditional = true; 
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

$(document).ready(function() {
	getComboAuthGrp("#sch_tbody #sch_grpcode");
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
                    <p class="contents_title">권한관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 권한관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>권한그룹 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
							<tr>
								<th scope="row">권한그룹</th>
								<td>
									<div class="select_box">			
										<select id="sch_grpcode" name="sch_grpcode">
										<option value="">전체</option>
										</select>
									</div>
								</td>
							</tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 권한관리-->
					<div class="table_wrap">
						<!-- 그룹항목표-->
						<p class="sub_title">동물 그룹정보 일람</p>					
						<!-- 권한그룹-->
						<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_minus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>권한그룹</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="save_btn" onclick="javascript:fn_base_saveAuthGrpList(saveAuthGrpList);">저장</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_td_margin" style="width:100%;">
							<caption>권한그룹</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">권한그룹</th>
									<th scope="col" id="th02">소속</th>
									<th scope="col" id="th04">구성원</th>
									<th scope="col" id="th04">기간</th>
								</tr>
							</thead>
							<tbody id="authGrp_tbody">
								<tr style="display:none;background-color:;">
									<th style="display:none">
										<div id="MAG_ID_DIV" data-val=''></div>
										<div id="MAG_GRPCODE_DIV" data-val=''></div>
									</th>
									<th scope="row" id="n01" headers="th01" class="mag_grpcode">
									<div id="TXT_MAG_GRPCODE_DIV" data-val=''></div>
									</th>
									<td headers="n01 th02"><div id="DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01 th03" onClick="javascript:toggle_bgcolor('authGrp_tbody',this);"><div id="MUI_NAME_DIV" data-val='' onclick="fn_base_selectAuthMenuList($(this).attr('data-val'), selectAuthMenuList);" style="cursor:hand;"></div></td>
									<td headers="n01 th04"><p><input type=checkbox id="chk_day" name="chk_day" onclick="javascript:toggle_calDay(this);">
									<input type="text" class="calendar1" id="MAG_ST_DAY" value="" style="width: 80px" maxlength=10 disabled> ~ 
									<input type="text" class="calendar1" id="MAG_ED_DAY" value="" style="width: 80px" maxlength=10 disabled></p></td>
								</tr>
							</tbody>
						</table>
						<!-- 메뉴권한-->
						<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_minus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>메뉴권한</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="save_btn" onclick="javascript:fn_base_saveUserPmsList(saveUserPmsList);">저장</a></span>
							</div>
						</div>
						
						
						<table class="aniinfo_add table_view2">
							<caption>메뉴권한</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">메뉴명칭</th>
									<th scope="col" id="th02">프로그램 명칭</th>
									<th scope="col" id="th03">조회</th>
									<th scope="col" id="th04">추가/수정/삭제</th>
								</tr>
							</thead>
							
							<span id="auth_user" style="width: 0%;height: 0%">
							
							<tbody id="pms_tbody">
								<tr style="display:none">
									<th style="display:none">
										<input type=text id="auth_grpcode" name="auth_grpcode" value="" style="background: transparent; border: 0;width:33px;text-align: right;" readOnly>
										<div id="MUP_USERID_DIV" data-val=''></div>
										<div id="MUP_PROGID_DIV" data-val=''></div>
										<div id="MUP_SRCHLVL_DIV" data-val=''></div>
										<div id="MUP_UPDLVL_DIV" data-val=''></div>
									</th>
									<th scope="row" id="n01" headers="th01" class="mcc_m_name">
									<div id="MCC_M_NAME_DIV" data-val=''></div>
									</th>
									<td headers="n01 th02"><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td style="vertical-align: middle;"><input type="checkbox" id="chk_srchLvl" name="chk_srchLvl"/></td>
									<td style="vertical-align: middle;"><input type="checkbox" id="chk_updLvl" name="chk_updLvl"/></td>
								</tr>
							</tbody>
						</table>
					
					</div>
						
					<!-- //권한관리-->
					</div>
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