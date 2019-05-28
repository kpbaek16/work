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

<title>기본정보 &gt; 직원</title>
</head>
<script type="text/javascript">
function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}
</script>
<script>
	function selectDeptList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#dept_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("dept_tbody"); 
				
				var iRow = (i+1);
				$("#dept_tbody div#DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME);
				$("#dept_tbody div#DPTNAME_DIV").eq(iRow).attr('data-val', data.MDI_LINKNO); 
				
			}
			$("#dept_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectTeamList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			$("#team_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("team_tbody");
				
				var iRow = (i+1);
				$("#team_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME);
				$("#team_tbody div#TEAMNAME_DIV").eq(iRow).attr('data-val', data.MTI_TEAMNO); 
			}
			$("#team_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			$("#user_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("user_tbody");
				
				var iRow = (i+1);
				$("#user_tbody div#MUI_NAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#user_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#user_tbody div#MUI_ID_DIV").eq(iRow).attr('data-val', data.MUI_ID); 
			}
			$("#user_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserKjpList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#kjp_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("kjp_tbody");
				
				var iRow = (i+1);
				$("#kjp_tbody div#KJP_INDEX_DIV").eq(iRow).html(iRow); 
				$("#kjp_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#kjp_tbody div#MUK_KJSEQ_DIV").eq(iRow).html(data.MUK_KJSEQ); 
				$("#kjp_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#kjp_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#kjp_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
				$("#kjp_tbody div#MUI_DPTLVLNAME_DIV").eq(iRow).attr('data-val', data.MUI_DPTLVLNAME); 
			}
			$("#kjp_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserRcvTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#rcv_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("rcv_tbody");
				
				var iRow = (i+1);
				$("#rcv_tbody div#RCV_INDEX_DIV").eq(iRow).html(iRow); 
				$("#rcv_tbody div#RCV_DEL_DIV").eq(iRow).attr('data-val', iRow); 

				$("#rcv_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#rcv_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#rcv_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#rcv_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#rcv_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#rcv_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserNotiTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#noti_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("noti_tbody");
				
				var iRow = (i+1);
				$("#noti_tbody div#NOTI_INDEX_DIV").eq(iRow).html(iRow); 
				$("#noti_tbody div#NOTI_DEL_DIV").eq(iRow).attr('data-val', iRow); 
				
				$("#noti_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#noti_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#noti_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#noti_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#noti_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#noti_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function fn_base_selectDeptList(param, callback, retObj) {
		fc_clearRow("dept_tbody");
		var targetUrl = "/base/0104/selectDeptList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
		var data = {
				sch_dptno : ""
		};
		fn_base_selectUserKjpList(data, selectUserKjpList);
	}

	function fn_base_selectTeamList(dptno, callback, retObj) {

		fc_clearRow("team_tbody");

		var targetUrl = "/base/0104/selectTeamList.do";
		var param = {
				schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
				schKeyword : $("#sch_tbody #schKeyword").val(),
				dptno:dptno
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
			var data = {
					sch_dptno : dptno
			};
			fn_base_selectUserKjpList(data, selectUserKjpList);
		});
	}

	function fn_base_selectUserList(team_no, callback, retObj) {

		fc_clearRow("user_tbody");

		var targetUrl = "/base/0104/selectUserList.do";
		var param = {
				team_no : team_no,
				schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
				schKeyword : $("#sch_tbody #schKeyword").val()
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
			var data = {
					sch_teamno : team_no
			};
			fn_base_selectUserKjpList(data, selectUserKjpList);
		});
	}

	function fn_base_selectUserKjpList(param, callback, retObj) {
		fc_clearRow("kjp_tbody");

		var targetUrl = "/base/0104/selectUserKjpList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectUserRcvTypeList(param, callback, retObj) {
		
		param.muk_rcvtype = 'RCV';
		fc_clearRow("rcv_tbody");

		var targetUrl = "/base/0104/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectUserNotiTypeList(param, callback, retObj) {
		param.muk_rcvtype = 'NOTI';
		fc_clearRow("noti_tbody");

		var targetUrl = "/base/0104/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function selectUserInfo(mui_id, callback, retObj){
		var param = {mui_id:mui_id};
		$.ajax({
			type : "POST",
			url : "/base/0104/selectUserInfo.do",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				$("#userinfo_tbody div#MUI_ID").html(data.TXT_ID); 
				$("#userinfo_tbody div#MUI_ID").attr('data-val',data.MUI_ID); 
				$("#userinfo_tbody div#MUI_NAME").html(data.MUI_NAME);
				if(data.MTI_DPTNO!=null){
					$("#userinfo_tbody div#MDI_DPTNAME").html(data.MDI_DPTNAME + "(" + data.MTI_DPTNO + ")");
					$("#userinfo_tbody #MDI_DPTNAME").attr("style","display:;");
					$("#userinfo_tbody #MDI_LINKNO").attr("style","display:none;");
				}else{
					$("#userinfo_tbody #MDI_DPTNAME").attr("style","display:none;");
					$("#userinfo_tbody #MDI_LINKNO").attr("style","display:;");
					getComboDpt("#userinfo_tbody #MDI_LINKNO", data.MTI_DPTNO);
				}	
/**				
				if(data.MUI_TEAMNO!=null){
					$("#userinfo_tbody div#MTI_TEAMNAME").html(data.MTI_TEAMNAME + "(" + data.MUI_TEAMNO + ")"); 
					$("#userinfo_tbody #MTI_TEAMNAME").attr("style","display:;");
					$("#userinfo_tbody #MTI_TEAMNO").attr("style","display:none;");
				}else{
					$("#userinfo_tbody #MTI_TEAMNAME").attr("style","display:none;");
					$("#userinfo_tbody #MTI_TEAMNO").attr("style","display:;");
					getComboDptTeam("#userinfo_tbody #MTI_TEAMNO", data.MTI_DPTNO, data.MUI_TEAMNO);
				}
*/				
				getComboDptTeam("#userinfo_tbody #MTI_TEAMNO", data.MTI_DPTNO, data.MUI_TEAMNO);

				$("#userinfo_tbody div#MUI_DPTLVLNAME").html(data.MUI_DPTLVLNAME); 
				$("#userinfo_tbody div#MUI_DPTPOSITNAME").html(data.MUI_DPTPOSITNAME); 
				getComboJccode("#userinfo_tbody #MUI_JCCODE", data.MUI_JCCODE);
				$("#userinfo_tbody input[name=MUI_HPTELNO]").val(data.MUI_HPTELNO); 
				$("#userinfo_tbody #MUI_MAINBIZ").val(data.MUI_MAINBIZ); 
				$("#userinfo_tbody #MUI_LINCNO").val(data.MUI_LINCNO); 
//				$("#userinfo_tbody div#MDI_DPTNAME").html(data.MDI_DPTNAME); 
				
//				$("#userinfo_tbody #MAG_GRPCODE").val(data.MAG_GRPCODE);
				getComboTeamAuthGrp("#userinfo_tbody #MAG_GRPCODE", data.MAG_GRPCODE, {"mti_teamno": data.MUI_TEAMNO});
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
				var param = {
						sch_mui_id : data.MUI_ID
				};
				fn_base_selectUserKjpList(param, selectUserKjpList);
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
		ShowTable('user_table');
	}
	
	function fn_base_selectUserInfo(targetRow){
		var param = {
				mui_id:$("#user_tbody div#MUI_ID_DIV").eq(targetRow).attr('data-val')
		};
		var validate = function validate(data){	
			if(data!=null){
		 		return;
			}else{
		 	}
		}
		selectUserInfo(param.mui_id, validate);
	}	
	
	function fn_base_saveUser(){
		if($("#userinfo_tbody #MTI_TEAMNO").val()==""){
			alert("팀을 선택하시기 바랍니다.");
			return;
		} 
		if(!confirm("저장하시겠습니까?")){
			return;	
		}
		var param = {
				mag_id : $("#userinfo_tbody div#MUI_ID").attr('data-val'),
				mag_grpcode : $("#userinfo_tbody #MAG_GRPCODE").val(),
				mti_teamno : $("#userinfo_tbody #MTI_TEAMNO").val(),
				mui_jccode : $("#userinfo_tbody #MUI_JCCODE").val(),
				mui_hptelno : $("#userinfo_tbody #MUI_HPTELNO").val(),
				mui_lincno : $("#userinfo_tbody #MUI_LINCNO").val(),
				mui_mainbiz : $("#userinfo_tbody #MUI_MAINBIZ").val()
		};
		console.log("param====>" + JSON.stringify(param));
		
		var targetUrl = "/base/0104/saveUserInfo.do";
		$.ajaxSettings.traditional = true; 
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if(result!=null){
//				if(JSON.stringify(result.saveRslt.cnt) > 0){
					alert("저장되었습니다.");
//				}
			}
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function fn_base_search(){
		var param = {
				schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
				schKeyword : $("#sch_tbody #schKeyword").val()
		};
		console.log(param.schType);
		if(param.schType=="dept"){
			fn_base_selectDeptList(param, selectDeptList);
		}else if(param.schType=="team"){
			fc_clearRow("dept_tbody");
			fn_base_selectTeamList("", selectTeamList)
		}else if(param.schType=="name"){
			fc_clearRow("team_tbody");
			fn_base_selectUserList("", selectUserList)
		}
	}	
	
	function fn_pop_selectUserRcvTypeList(){
		var mui_uid = $("#userinfo_tbody div#MUI_ID").attr('data-val');
		console.log("mui_uid====>" + mui_uid);
		if(mui_uid==""){
			alert("직원을 먼저 선택하시기 바랍니다.");
			return;
		}
		fn_layer_show();

		var param = {
			muk_userid : mui_uid,
			muk_rcvtype : ""
		};
		fn_base_selectUserRcvTypeList(param, selectUserRcvTypeList);
		fn_base_selectUserNotiTypeList(param, selectUserNotiTypeList);
	}

	function fn_pop_deleteUserRcvType(rcvType, targetRow){
		if(!confirm("삭제하시겠습니까?")){
			return;	
		}
		var muk_kjid = "";
		if(rcvType=="NOTI"){
			muk_kjid = $("#noti_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}else if(rcvType=="RCV"){
			muk_kjid = $("#rcv_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}
		var param = {
				muk_userid : $("#userinfo_tbody div#MUI_ID").attr('data-val'),
				muk_kjid : muk_kjid
		};

		var targetUrl = "/base/0104/deleteUserRcvType.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
		fn_pop_selectUserRcvTypeList();
	}

	function fn_layer_show() {
		$(".layer_box").show();
		$(".layer_popup").show();
		var width_size = $(".layer_box").innerWidth()/2;
		$(".layer_box").css("margin-left",-width_size);
	}

	function fn_layer_hide() {
		$(".layer_box").hide();
		$(".layer_popup").hide();
		$("body").css("overflow-y", "auto");
	}
	
	function reset(){
		fc_clearRow("user_tbody");
		HideTable('user_table');
	}
	
	$(document).ready(function() {
		HideTable('user_table');
		
		if(fn_is_pms_upd(0104)){
			$(".save_btn").css("display","");
			$(".cancel_btn").css("display","");
			$("#modify_btn").css("display","");
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
                    <p class="contents_title">직원</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>> 직원</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="dept" class="search_radio" checked/>부서</label>
                                  <label><input type="radio" id="schType" name="schType" value="team" class="search_radio"/>팀</label>
								  <label><input type="radio" id="schType" name="schType" value="name" class="search_radio"/>이름</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 직원관리-->
					<div class="table_wrap">
						<!-- 직원관리표-->
						<p class="sub_title">직원관리</p>					
						<table class="ani_list">
							<caption>직원관리</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">부서</th></tr>
							</thead>
							<tbody id="dept_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');"><td onclick="javascript:reset();">
								<a href="javascript:;">
								<div id="DPTNAME_DIV" data-val='' onclick="javascript:fn_base_selectTeamList($(this).attr('data-val'), selectTeamList);"></div></a></td></tr>
							</tbody>
						</table>
						
						<div>							
							<table class="ani_list">
								<caption>팀</caption>
								<colgroup>
									<col style="width:100%"/>
								</colgroup>
								<thead>
									<tr><th scope="col">팀</th></tr>
								</thead>
								<tbody id="team_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');"><td>
									<a href="javascript:;">
									<div id="TEAMNAME_DIV" data-val='' onclick="javascript:fn_base_selectUserList($(this).attr('data-val'), selectUserList);"></div></a></td></tr>
								</tbody>
							</table>							
						</div>
						<div>							
							<table class="ani_list" >
								<caption>이름</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">이름<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="user_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
										<div id="MUI_ID_DIV" data-val=''></div>
										<a href="javascript:;">
										<div id="MUI_NAME_DIV" data-val='' onclick="javascript:fn_base_selectUserInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						<!-- //직원관리표-->
						
						<!-- 상세정보표-->
						<div class="ani_info_box">
							
							<!-- 상세정보-->
							<table class="ani_info infotable" id="user_table"> 
								<caption>직원상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:fn_base_saveUser();" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id="userinfo_tbody">
									<tr><th scope="row">이름</th><td><div id="MUI_NAME" data-val=''></div></td></tr>
									<tr><th scope="row">아이디(cKey)</th><td><div id="MUI_ID" data-val=''></div></td></tr>
									<tr><th scope="row">부서</th>
										<td>
											<div id="MDI_DPTNAME" data-val='' style="display:none;"></div>
											<select name="MDI_LINKNO" id="MDI_LINKNO" onchange="javascript:getComboDptTeam('#userinfo_tbody #MTI_TEAMNO', this.value);" style="display:none;">
											<option value="">선택</option>
											</select>
										</td>
									</tr>
									<tr><th scope="row">팀</th>
										<td>
											<div id="MTI_TEAMNAME" data-val='' style="display:none;"></div>
											<select name="MTI_TEAMNO" id="MTI_TEAMNO" onchange="javascript:getComboTeamAuthGrp('#userinfo_tbody #MAG_GRPCODE', '', {'mti_teamno': this.value});" style="display:;">
											<option value="">선택</option>
											</select>
										</td>
									</tr>
									<tr><th scope="row">직위</th><td><div id="MUI_DPTLVLNAME" data-val=''></div></td></tr>
									<tr><th scope="row">직급</th><td><div id="MUI_DPTPOSITNAME" data-val=''></div></td></tr>
									<tr><th scope="row">직책</th>
									<td>	
									<select name="MUI_JCCODE" id="MUI_JCCODE">
									<option value="">미선택</option>
									</select>
									</td></tr>
									<tr><th scope="row">핸드폰번호</th><td>
									<input type="text" name ="MUI_HPTELNO" id="MUI_HPTELNO" class="textfield" onclick="javascript://phone_format();" maxlength=20/></td></tr>
									<tr><th scope="row">수의사면허번호</th><td><input type="text" name = "MUI_LINCNO" id="MUI_LINCNO" class="textfield" maxlength=20/></td></tr>
									<tr><th scope="row">주요업무</th><td><input type="text" name = "MUI_MAINBIZ" id="MUI_MAINBIZ" class="textfield" maxlength=50/></td></tr>
									<tr><th scope="row">권한그룹</th>
										<td>
											<select name="MAG_GRPCODE" id="MAG_GRPCODE">
											<option value="">미선택</option>
											</select>
										</td>
									</tr>
							   </tbody>
							</table>
							<!-- //상세정보-->
						</div>
						<!-- //상세정보표-->
						
						<!-- 결재패턴-->
						<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<p class="sub_title">결재패턴</p>	
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" onclick="javascript:fn_pop_selectUserRcvTypeList();" class="cha_btn">수정
								</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>결재패턴</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
								</tr>
							</thead>
							<tbody id="kjp_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
									<th scope="row" id="n01" headers="th01"><div id="KJP_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th03"><div id="MUK_KJSEQ_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th05"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div><div id="MUI_DPTLVLNAME_DIV" data-val=''></div></td>
									
								</tr>
							</tbody>
						</table>
					
					</div>
						
					<!-- //결재패턴-->
					</div>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:800px;">
			<div class="layer_tit">결재패턴 정보</div>
				<div class="layer_con">					
					<div class="table_box">
						<p class="sub_title" style="margin-bottom:10px;">수신</p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재패턴 정보 수신</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:22%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:18%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">이름</th>
									<th scope="col" id="th03_1">부서</th>
									<th scope="col" id="th04_1">팀</th>
									<th scope="col" id="th05_1">직책</th>
									<th scope="col" id="th06_1">선택</th>
								</tr>
							</thead>
							<tbody id="rcv_tbody">
								<tr style="display:none">
									<th scope="row" id="n01_1" headers="th01_1"><div id="RCV_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_1 th02_1"><div id="MUK_KJID_DIV" data-val=''></div><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th03_1"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th04_1"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th05_1"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div></td>
									<td headers="n01_1 th06_1"><a href="#" class="popcha_btn">수정</a>
									<a href="#" class="del2_btn btn_type2"><div onclick="javascript:fn_pop_deleteUserRcvType('RCV', $(this).attr('data-val'));" id="RCV_DEL_DIV" data-val=''>삭제</div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
					</div>
					<!-- //pagination -->

					<div class="table_box"  style="margin-top:20px;">
						<p class="sub_title" style="margin-bottom:10px;">참조</p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재패턴 정보 참조</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:22%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:18%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_2">No</th>
									<th scope="col" id="th02_2">이름</th>
									<th scope="col" id="th03_2">부서</th>
									<th scope="col" id="th04_2">팀</th>
									<th scope="col" id="th05_2">직책</th>
									<th scope="col" id="th06_2">선택</th>
								</tr>
							</thead>
							<tbody id="noti_tbody">
								<tr style="display:none">
									<th scope="row" id="n02_2" headers="th02_2"><div id="NOTI_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_2 th02_2"><div id="MUK_KJID_DIV" data-val=''></div><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th03_2"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th04_2"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th05_2"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div></td>
									<td headers="n01_2 th06_2"><a href="#" class="popcha_btn">수정</a><a href="#" class="del2_btn btn_type2"><div id="NOTI_DEL_DIV" data-val='' onclick="javascript:fn_pop_deleteUserRcvType('NOTI', $(this).attr('data-val'));">삭제</div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
					</div>
					<!-- //pagination -->


					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
	</div>
	<!-- // layer_popup -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>