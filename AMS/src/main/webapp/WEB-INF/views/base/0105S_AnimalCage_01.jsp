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
<link rel="stylesheet" href="/css/common/multiple-select.css" />
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/common/multiple-select.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<title>기본정보 &gt; 동물사</title>
</head>
<script>
	function selectDeptList(result){
	 	if(result!=null){
			console.log("selectDeptList:" + JSON.stringify(result));
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
			console.log("selectTeamList:" + JSON.stringify(result));
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
	
	function selectVvrmList(result){
	 	if(result!=null){
			console.log("selectVvrmList:" + JSON.stringify(result));
			$("#vvrm_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("vvrm_tbody");
				
				var iRow = (i+1);
				$("#vvrm_tbody div#MVI_VVRM_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#vvrm_tbody div#MVI_VVRM_DIV").eq(iRow).attr('data-val', data.MVI_VVRMNO); 
				$("#vvrm_add_tbody div#dptname_layer").html(data.MTI_TEAMNAME +"(" + data.MVI_VVRMNO +")");
			}
			$("#vvrm_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectManagerList(result){
	 	if(result!=null){
			$("#vml_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("vml_tbody");
				
				var iRow = (i+1);
				$("#vml_tbody div#VML_INDEX_DIV").eq(iRow).html(iRow); 
				$("#vml_tbody div#MVI_VVRM_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#vml_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#vml_tbody div#MUI_DPTLVLNAME_DIV").eq(iRow).html(data.MUI_DPTLVLNAME); 
				$("#vml_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#vml_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 		
			}
			$("#vml_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function fn_base_selectDeptList(param, callback, retObj) {
		fc_clearRow("dept_tbody");
		
		var targetUrl = "/base/0105/selectDeptList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
//			fn_base_selectManagerList(param, selectManagerList);
		});
	}

	function fn_base_selectTeamList(dptno, callback, retObj) {
		console.log("dptno====>" + dptno);

		fc_clearRow("team_tbody");

		var targetUrl = "/base/0105/selectTeamList.do";
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
			fn_base_selectManagerList(param, selectManagerList);
		});
	}

	function fn_base_selectVvrmList(team_no, callback, retObj) {
		console.log("team_no====>" + team_no);

		fc_clearRow("vvrm_tbody");

		var targetUrl = "/base/0105/selectVvrmList.do";
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
			fn_base_selectManagerList(param, selectManagerList);
		});
	}

	function fn_base_selectManagerList(param, callback, retObj) {
		fc_clearRow("vml_tbody");

		var targetUrl = "/base/0105/selectManagerList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectSypattnList(param, callback, retObj) {
		var targetUrl = "/base/0105/selectSypattnList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	/* function selectSypattnList(result){
	 	if(result!=null){
			for(var i=0; i<result.length; i++){
				var data = result[i];
				if(i > 0){
					$("#vvrminfo_tbody").append($("#vvrminfo_tbody #sypattn_list").clone());
				}
				$("#vvrminfo_tbody div#MVI_SYPATTN").eq(i).html(data.MVI_SYPATTN_TXT); 
			}
	 	}
	} */

	function selectVvrmInfo(mvi_vvrmno, callback, retObj){
		ShowTable('vvrm_info');
		var param = {mvi_vvrmno:mvi_vvrmno};
		var rowid = ''; 
		var checkRow = '';
		$.ajax({
			type : "POST",
			url : "/base/0105/selectVvrmInfo.do",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				$("#vvrminfo_tbody div#MVI_VVRMNO").attr('data-val', data.MVI_VVRMNO); 
				$("#vvrminfo_tbody div#MTI_DPTNO").attr('data-val', data.MTI_DPTNO); 
				$("#vvrminfo_tbody div#MVI_TEAMNO").attr('data-val', data.MVI_TEAMNO); 

				$("#vvrminfo_tbody div#MVI_VVRMNO").html(data.MVI_VVRMNO); 
				$("#vvrminfo_tbody #MVI_VVRMNAME").val(data.MVI_VVRMNAME); 
				$("#vvrminfo_tbody div#MDI_DPTNAME").html(data.MDI_DPTNAME); 
				$("#vvrminfo_tbody div#MTI_TEAMNAME").html(data.MTI_TEAMNAME);

				var arrSyPtn = [];
				if(data.MVI_SYPATTN!=null){
					arrSyPtn = data.MVI_SYPATTN.split(",");
				}
				getMultiComboSyPtn("#vvrminfo_tbody #MVI_SYPATTN", arrSyPtn, {width:'250px'});
				
				if(data.MVI_SYPATTN == null){
					$('input:checkbox').removeAttr('checked');
				}
				
/* 				if(data.MVI_SYPATTN != null){
					var sypattndata = data.MVI_SYPATTN.split(',');
		            var syp = document.getElementsByName("SYPattn");
		            for (var i = 0; i < syp.length; ++i) {
		                for (var j = 0; j < sypattndata.length; ++j) {
		                    if (syp[i].value == sypattndata[j]) {
		                        syp[i].checked = "checked";
		                    }
		                }
				}
	            } */
				/* $("#vvrminfo_tbody #sypattn_list").each(function(index){
					if(index==0){
						$("#vvrminfo_tbody div#MVI_SYPATTN").eq(0).html(""); 
					}else{
						$(this).remove();
					}
				}); */
				$("#vvrminfo_tbody input[name=MVI_CMNT]").val(data.MVI_CMNT); 
				
				/* var sypattn_list = data.MVI_SYPATTN.split(",");
				console.log("MVI_SYPATTN.split===>" + data.MVI_SYPATTN.split(","));
				if(sypattn_list!=""){
					var param = {mvi_vvrmno:mvi_vvrmno};
					fn_base_selectSypattnList(param, selectSypattnList);
				} */
				
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
				var param = {
						dptno : data.MTI_DPTNO,
						team_no : data.MVI_TEAMNO,
						sch_vvrmno : data.MVI_VVRMNO
				};
				fn_base_selectManagerList(param, selectManagerList);
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
	}
	
	function fn_base_selectVvrmInfo(mvi_vvrmno){
		var validate = function validate(data){
			if(data!=null){
		 	}
		}
		selectVvrmInfo(mvi_vvrmno, validate);
	}	
	
	function selectVmlPopList(result){
	 	if(result!=null){
			console.log("result:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#vmlPop_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("vmlPop_tbody");
				
				var iRow = (i+1);
				$("#vmlPop_tbody div#VMLPOP_INDEX_DIV").eq(iRow).html(iRow); 
				$("#vmlPop_tbody div#MUI_ID_DIV").eq(iRow).attr('data-val', data.MUI_ID); 
				$("#vmlPop_tbody div#MVI_VVRM_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#vmlPop_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#vmlPop_tbody div#MUI_DPTLVLNAME_DIV").eq(iRow).html(data.MUI_DPTLVLNAME); 
				$("#vmlPop_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				if(data.CHK_YN == "Y"){
					$("#vmlPop_tbody #vml_chk_yn").eq(iRow).prop("checked", true);
				}
			}
			$("#vmlPop_tbody tr:first").attr('style',"display:none");
	 	}
	}

	function fn_base_selectVmlPopList(param, callback, retObj) {
		console.log("vvrmno====>" + param.vvrmno);

		fc_clearRow("vmlPop_tbody");

		var targetUrl = "/base/0105/selectManagerList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_pop_selectVmlPopList(){
		var mvi_vvrmno = $("#vvrminfo_tbody div#MVI_VVRMNO").attr('data-val');
		console.log("mvi_vvrmno====>" + mvi_vvrmno);
		if(mvi_vvrmno==""){
			alert("동물사를 먼저 선택하시기 바랍니다.");
			return;
		}
		
		fn_layer_show();

		var param = {
				vvrmno : mvi_vvrmno, 
				dptno : $("#vvrminfo_tbody div#MTI_DPTNO").attr('data-val'),
				team_no : $("#vvrminfo_tbody div#MVI_TEAMNO").attr('data-val'),
				schType : $('#sch_pop_tbody input:radio[name=schPopType]:checked').val(),
				schKeyword : $("#sch_pop_tbody #schKeyword").val(),
				sch_vvrmno : "" // ALL SEARCH
		};
		fn_base_selectVmlPopList(param, selectVmlPopList);
	}

	function fn_pop_createVmlList(callback, retObj) {
		
		var chk_list = [];
		var chk_list_Y = "";
		var chk_list_N = "";
		$("#vmlPop_tbody #vml_chk_yn").each(function(index){
			console.log($(this).prop("checked"));
			if($(this).prop("checked")){
				chk_list.push($("#vmlPop_tbody #MUI_ID_DIV").eq(index).attr('data-val'));
				chk_list_Y += $("#vmlPop_tbody #MUI_ID_DIV").eq(index).attr('data-val');
				chk_list_Y += ",";
			}else{
				chk_list_N += $("#vmlPop_tbody #MUI_ID_DIV").eq(index).attr('data-val');
				if(index > 1){
					chk_list_N += ",";
				}
			}
		});
		var param = {
				vvrmno : $("#vvrminfo_tbody div#MVI_VVRMNO").attr('data-val'),
				list_Y : chk_list_Y,
				list_N : chk_list_N,
				schKeyword : $("#sch_pop_tbody #schKeyword").val()
			};
		console.log("vvrmno====>" + param.vvrmno);
		console.log("list_Y====>" + param.list_Y);
		console.log("list_N====>" + param.list_N);

		var targetUrl = "/base/0105/createVmlList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function createVmlList(result) {
		if (result.qryRslt == "Y") {
			alert("등록되었습니다.");
			fn_layer_hide();
			var param = {
					sch_vvrmno : $("#vvrminfo_tbody div#MVI_VVRMNO").attr('data-val')
			};
			fn_base_selectManagerList(param, selectManagerList);
		}
	}
	
	function fn_base_search(){
		var param = {
				schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
				schKeyword : $("#sch_tbody #schKeyword").val()
		};
		console.log(param.schType);
		fc_clearRow("vvrm_tbody");
		if(param.schType=="dept"){
			fn_base_selectDeptList(param, selectDeptList);
		}else if(param.schType=="team"){
			fc_clearRow("dept_tbody");
			fn_base_selectTeamList("", selectTeamList)
		}else if(param.schType=="name"){
			fc_clearRow("team_tbody");
			fn_base_selectVvrmList("", selectVvrmList)
		}
		HideTable('vvrm_info');	
		fc_clearRow("team_tbody");
		
		/* fc_clearRow("dept_tbody");
		fc_clearRow("team_tbody"); */
	}	
	
	function fn_layer_show() {
		$("#layer01").show();
		$(".layer_popup").show();
		var width_size = $("#layer01").innerWidth()/2;
		$("#layer01").css("margin-left",-width_size);
	}
	
	function fn_layer_show2() {
		$("#layer02").show();
		$(".layer_popup").show();
		var width_size = $("#layer02").innerWidth()/2;
		$("#layer02").css("margin-left",-width_size);
	}

	function fn_layer_hide() {
		$(".layer_box").hide();
		$(".layer_popup").hide();
		$("body").css("overflow-y", "auto");
		
		$("#vvrm_add_tbody #dptname_layer").val("");
		$("#vvrm_add_tbody #vvrmname_layer").val("");
		$("#vvrm_add_tbody #MVI_CMNT").val("");
		// 레이어 닫은 후 체크박스 값 초기화
//		$('input[name=SYPattn]').removeAttr('checked');
	}
	
	function ShowTable(wtable) {
		eval(wtable).style.display="";
		}

	function HideTable(wtable) {
		eval(wtable).style.display="none";
	}
	
	function test(){
		fc_clearRow("vvrm_tbody");
		HideTable('vvrm_info');
	}

	$(document).ready(function() {
		var arrSyPtn = [];
		getMultiComboSyPtn("#vvrm_add_tbody #MVI_SYPATTN", arrSyPtn, {width:'250px'});

	    HideTable('vvrm_info');
		if(gb_ss_auth_grp=="SA" || fn_is_vm(0105)){
			$(".add_btn").css("display","");
			$(".save_btn").css("display","");
			$(".cancel_btn").css("display","");
			$(".cha_btn").css("display","");
			$(".popent_btn").css("display","");
			$(".popcancel_btn").css("display","");
			
			$("#MVI_VVRMNAME").css("border","");
			$("#MVI_CMNT").css("border","");
		}
	});
	
	/* function showDptTeam(){
		var targetUrl = "/base/0105/showDptTeam.do";
		
		$.ajax({
			type : "POST",
			url : targetUrl, 
			datatype:"json",
			success : function(result) {
					for(var i=0; i<result.length; i++){
						var data = result[i];
						$("#vvrm_add_tbody #MAI_TeamNo").append("<option value='" + data.MTI_TEAMNO + "'>" + 
								data.MDI_DPTNAME +"(" + data.MTI_DPTNO+")" + "-"+ 
								data.MTI_TEAMNAME+"(" + data.MTI_TEAMNO+")"+"</option>");
					}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		}); 
	} */
</script>
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
                    <p class="contents_title">동물사</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>> 동물사</li>
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
								  <label><input type="radio" id="schType" name="schType" value="name" class="search_radio"/>동물사</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>	
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					<!-- 동물사관리-->
					<div class="table_wrap">
						<!-- 동물사관리표-->
						<p class="sub_title">동물사관리</p>					
						<table class="ani_list" id="dept_table">
							<caption>부서</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">부서</th></tr>
							</thead>
							<tbody id="dept_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');"><td onclick="javascript:test();">
								<a href="javascript:;">
								<div id="DPTNAME_DIV" data-val='' onclick="javascript:fn_base_selectTeamList($(this).attr('data-val'), selectTeamList);"></div></a></td></tr>
							</tbody>
						</table>
						
						<div>							
							<table class="ani_list" id="team_table">
								<caption>팀</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">팀</th></tr>
								</thead>
								<tbody id="team_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
									<td>
									<a href="javascript:;" onclick="">
									<div id="TEAMNAME_DIV" data-val='' onclick="javascript:fn_base_selectVvrmList($(this).attr('data-val'), selectVvrmList);"></div></a></td></tr>
								</tbody>
							</table>							
						</div>
						<div>							
							<table class="ani_list" id="vvrm_table">
								<caption>동물사</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">동물사
									<a href="javascript:;" onclick="javascript:fn_layer_show2();" class="add_btn" style="display: none;">추가</a>
									</th></tr>
								</thead>
								<tbody id="vvrm_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');"><td>
									<a href="javascript:;">
									<div id="MVI_VVRM_DIV" data-val='' onclick="javascript:fn_base_selectVvrmInfo($(this).attr('data-val'));"></div></a></td></tr>
								</tbody>
							</table>							
						</div>
						<!-- //동물사관리표-->
						
						<!-- 상세정보표-->
						<div class="ani_info_box">
							<table class="ani_info infotable" id='vvrm_info'> 
								<caption>동물사관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>	
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									</th></tr>
								</thead>
								<tbody id="vvrminfo_tbody">
									<tr><th scope="row">부서정보</th><td><div id="MTI_DPTNO" data-val=''></div><div id="MDI_DPTNAME" data-val=''></div></td></tr>
									<tr><th scope="row">팀정보</th><td><div id="MVI_TEAMNO" data-val=''></div><div id="MTI_TEAMNAME" data-val=''></div></td></tr>	
									<tr><th scope="row">동물사번호</th><td><div id="MVI_VVRMNO" data-val=''></div></td></tr>
									<tr><th scope="row">동물사명</th><td><input type="text" id="MVI_VVRMNAME" name='MVI_VVRMNAME' class="textfield" style="border: thin;"></td></tr>
									<tr><th style="vertical-align:middle;">사육일지패턴</th>
										<td><select id="MVI_SYPATTN" name="MVI_SYPATTN" multiple="multiple" style="width: 300px" class='textfield'></td></tr>
<!-- 									<tr><th rowspan="6" style="vertical-align:middle;">사육일지패턴</th>
									<tr><td><input type="checkbox" name="SYPattn" value="1" id="SYPattn"><label for="SYPattn">해양관패턴</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="2" id="SYPattn"><label for="SYPattn">유해조수포획</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="3" id="SYPattn"><label for="SYPattn">무인판매대판매</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="4" id="SYPattn"><label for="SYPattn">사슴뿔수거</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="5" id="SYPattn"><label for="SYPattn">타조알인계</label></td></tr> -->
									<tr><th scope="row">특이사항</th><td><input type="text" id="MVI_CMNT" name='MVI_CMNT' class="textfield" style="border: thin;"></td></tr>
									<!-- <tr><th rowspan="6" scope="row" style="vertical-align:middle;">사육일지패턴</th><td style="display:none"></td></tr>
									<tr id="sypattn_list"><td><div id="MVI_SYPATTN" data-val=''></div></td></tr> -->
							   </tbody>
							</table>
							<!-- //상세정보-->
							</div>
						
						<!-- 관리자 정보-->
					<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<span class="table_title">
							<a href="javascript:;" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="javascript:;" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>관리자 정보</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide">
								<a href="#layer01" class="cha_btn" onclick="javascript:fn_pop_selectVmlPopList();" style="display: none;">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>관리자 정보</caption>
							<colgroup>
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:17%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">이름</th>
									<th scope="col" id="th03">직책</th>
									<th scope="col" id="th04">부서</th>
									<th scope="col" id="th05">팀</th>
									<th scope="col" id="th06">동물사</th>
								</tr>
							</thead>
							<tbody id="vml_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="VML_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="MVI_VVRM_DIV" data-val=''></div></td>
									<td headers="n01 th03"><div id="MUI_DPTLVLNAME_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01 th05"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					
					</div>
						
					<!-- //관리자 정보-->
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
			<div class="layer_tit">관리자 정보</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_pop_tbody">
                            <tr>
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schPopType" name="schPopType" value="dept" class="search_radio"/>부서</label>
                                  <label><input type="radio" id="schPopType" name="schPopType" value="team" class="search_radio"/>팀</label>
								  <label><input type="radio" id="schPopType" name="schPopType" value="name" class="search_radio" checked/>이름</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="seach_text2"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_pop_selectVmlPopList();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box" style="height: 300px; overflow: auto">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>관리자 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">이름</th>
									<th scope="col" id="th03_1">직책</th>
									<th scope="col" id="th04_1">부서</th>
									<th scope="col" id="th05_1">팀</th>
									<th scope="col" id="th06_1">선택</th>
								</tr>
							</thead>
							<tbody id="vmlPop_tbody">
								<tr style="display:none">
									<th scope="row" id="n01_1" headers="th01_1"><div id="VMLPOP_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_1 th02_1"><div id="MUI_ID_DIV" data-val=''></div><div id="MVI_VVRM_DIV" data-val=''></div></td>
									<td headers="n01_1 th03_1"><div id="MUI_DPTLVLNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th04_1"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th05_1"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th06_1"><input type="checkbox" id="vml_chk_yn" name="vml_chk_yn"/><label for="vml_chk_yn"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2" onclick="javascript:fn_pop_createVmlList(createVmlList);">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>	
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">동물사 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>동물사 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                           <tbody id="vvrm_add_tbody">
									<tr><th scope="row">동물사번호</th><td>${MAX.MAXNUM }</td></tr>
									<tr><th scope="row">동물사명</th><td><input type="text" class="textfield" id="vvrmname_layer"></td></tr>
									<tr><th scope="row">관리 부서 / 팀</th><td>
									<select id="MAI_TeamNo" name="MAI_TeamNo" style="width:600px">
									<option value="">-- 동물사 선택 --</option>
									<c:forEach var="teamList" items="${teamList }" varStatus="st">
									<option value="${teamList.MTI_TEAMNO}">${teamList.MDI_DPTNAME}(${teamList.MTI_DPTNO})-${teamList.MTI_TEAMNAME }(${teamList.MTI_TEAMNO })</option>
									</c:forEach>
									</select>
									</td></tr>
									<tr><th style="vertical-align:middle;">사육일지패턴</th>
										<td><select id="MVI_SYPATTN" name="MVI_SYPATTN" multiple="multiple" style="width: 300px" class='textfield'></td></tr>
<!-- 									<tr><th rowspan="6" style="vertical-align:middle;">사육일지패턴</th>
									<tr><td><input type="checkbox" name="SYPattn" value="1" id="SYPattn"><label for="SYPattn">해양관패턴</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="2" id="SYPattn"><label for="SYPattn">유해조수포획</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="3" id="SYPattn"><label for="SYPattn">무인판매대판매</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="4" id="SYPattn"><label for="SYPattn">사슴뿔수거</label></td></tr>
									<tr><td><input type="checkbox" name="SYPattn" value="5" id="SYPattn"><label for="SYPattn">타조알인계</label></td></tr> -->
									<tr><th scope="row">특이사항</th><td><input type="text" id="MVI_CMNT" name='MVI_CMNT' class="textfield"></td></tr>
							   </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="javascript:;" class="popent_btn">확인</a>&nbsp;&nbsp;
						<a href="javascript:;" class="popcancel_btn" onclick="fn_layer_hide();">취소</a>	
					</div>
				</div>
				<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
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
